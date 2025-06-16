import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_supabase/core/api_services.dart';
import 'package:ecommerce_supabase/core/models/product_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final ApiServices _apiServices = ApiServices();
  List<ProductModel> products = [];

  List<ProductModel> searchResults = [];

  List<ProductModel> categoryProducts = [];

  Future<void> getProducts({String? query, String? category}) async {
    emit(GetDataLoading());

    try {
      Response response = await _apiServices.getData(
          "products_table?select=*,favorite_products(*),purchase_table(*)");
      for (var product in response.data as List) {
        products.add(ProductModel.fromJson(product));
      }
      search(query);
      getProductsByCategory(category);
      emit(GetDataSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetDataError());
    }
  }

  void search(String? query) {
    searchResults.clear();
    if (query != null) {
      for (var product in products) {
        if (product.productName!.toLowerCase().contains(query.toLowerCase())) {
          searchResults.add(product);
        }
      }
    }
  }

  void getProductsByCategory(String? category) {
    if (category != null) {
      for (var product in products) {
        if (product.category!.trim().toLowerCase() ==
            category.trim().toLowerCase()) {
          categoryProducts.add(product);
        }
      }
    }
  }
}
