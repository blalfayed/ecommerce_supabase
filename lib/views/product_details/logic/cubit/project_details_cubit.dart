import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_supabase/core/api_services.dart';
import 'package:ecommerce_supabase/views/product_details/logic/models/rate.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'project_details_state.dart';

class ProjectDetailsCubit extends Cubit<ProjectDetailsState> {
  ProjectDetailsCubit() : super(ProjectDetailsInitial());

  final ApiServices _apiServices = ApiServices();
  List<Rate> rates = [];
  int averageRate = 0;
  int userRate = 5;

  Future<void> getRates({required String productId}) async {
    emit(GetRateLoading());
    try {
      Response response = await _apiServices
          .getData('rates_table?select=*&for_product=eq.$productId');
      for (var rate in response.data) {
        rates.add(Rate.fromJson(rate));
      }
      _getAverageRate();
      _getUserRate();
      emit(GetRateSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetRateError());
    }
  }

  void _getUserRate() {
    List<Rate> userRates = rates
        .where((Rate rate) =>
            rate.forUser == Supabase.instance.client.auth.currentUser!.id)
        .toList();
    if (userRates.isNotEmpty) {
      userRate = userRates[0].rate!;
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
