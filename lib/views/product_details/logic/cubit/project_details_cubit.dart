import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_supabase/core/api_services.dart';
import 'package:ecommerce_supabase/views/product_details/logic/models/rate.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'project_details_state.dart';

class ProjectDetailsCubit extends Cubit<ProjectDetailsState> {
  ProjectDetailsCubit() : super(ProjectDetailsInitial());

  final ApiServices _apiServices = ApiServices();
  List<Rate> rates = [];
  int averageRate = 0;

  Future<void> getRates({required String productId}) async {
    emit(GetRateLoading());
    try {
      Response response = await _apiServices
          .getData('rates_table?select=*&for_product=eq.$productId');
      for (var rate in response.data) {
        rates.add(Rate.fromJson(rate));
      }
      _getAverageRate();
      log(averageRate.toString());
      emit(GetRateSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetRateError());
    }
  }

  void _getAverageRate() {
    for (var userRate in rates) {
      if (userRate.rate != null) {
        averageRate += userRate.rate!;
      }
    }
    averageRate = averageRate ~/ rates.length;
  }
}
