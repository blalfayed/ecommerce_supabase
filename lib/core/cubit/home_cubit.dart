import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_supabase/core/api_services.dart';
import 'package:ecommerce_supabase/core/models/product_model/favorite_product.dart';
import 'package:ecommerce_supabase/core/models/product_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final String userId = Supabase.instance.client.auth.currentUser!.id;
  final ApiServices _apiServices = ApiServices();
  List<ProductModel> products = [];

  List<ProductModel> searchResults = [];

  List<ProductModel> categoryProducts = [];

  Future<void> getProducts({String? query, String? category}) async {
    products = [];
    searchResults = [];
    categoryProducts = [];
    favoriteProductList = [];
    emit(GetDataLoading());

    try {
      Response response = await _apiServices.getData(
          "products_table?select=*,favorite_products(*),purchase_table(*)");
      for (var product in response.data as List) {
        products.add(ProductModel.fromJson(product));
      }
      getFavoriteProducts();
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

  Map<String, bool> favoriteProducts = {};
  Future<void> addToFavorie(String productId) async {
    emit(AddToFavoriteLoading());
    try {
      await _apiServices.postData("favorite_products",
          {"is_favorite": true, "for_user": userId, "for_product": productId});
      await getProducts();

      favoriteProducts.addAll({productId: true});
      emit(AddToFavoritesuccess());
    } catch (e) {
      log(e.toString());
      emit(AddToFavoriteError());
    }
  }

  bool chekIsFavorite(String productId) {
    return favoriteProducts.containsKey(productId);
  }

  Future<void> removeFavorite(String productId) async {
    emit(RemoveFromFavoriteLoading());
    try {
      await _apiServices.deleteData(
          'favorite_products?for_user=eq.$userId&for_product=eq.$productId');
      await getProducts();
      favoriteProducts.removeWhere((key, value) => key == productId);
      emit(RemoveFromFavoritesuccess());
    } catch (e) {
      log(e.toString());
      emit(RemoveFromFavoriteError());
    }
  }

  List<ProductModel> favoriteProductList = [];
  void getFavoriteProducts() {
    for (ProductModel product in products) {
      if (product.favoriteProducts != null &&
          product.favoriteProducts!.isNotEmpty) {
        for (FavoriteProduct favoriteProduct in product.favoriteProducts!) {
          if (favoriteProduct.forUser == userId) {
            favoriteProductList.add(product);
            favoriteProducts.addAll({product.productId!: true});
          }
        }
      }
    }
  }
}
