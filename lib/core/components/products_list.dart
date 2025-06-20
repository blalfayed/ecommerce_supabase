import 'package:ecommerce_supabase/core/components/custom_circle_pro_ind.dart';
import 'package:ecommerce_supabase/core/cubit/home_cubit.dart';
import 'package:ecommerce_supabase/core/models/product_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_card.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({
    super.key,
    this.physics,
    this.shrinkwrap,
    this.query,
    this.category,
    this.isFavoriteView = false,
  });
  final ScrollPhysics? physics;
  final bool? shrinkwrap;
  final String? query;
  final String? category;
  final bool isFavoriteView;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit()..getProducts(query: query, category: category),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit homeCubit = context.read<HomeCubit>();
          List<ProductModel> products = query != null
              ? context.read<HomeCubit>().searchResults
              : category != null
                  ? context.read<HomeCubit>().categoryProducts
                  : isFavoriteView
                      ? homeCubit.favoriteProductList
                      : context.read<HomeCubit>().products;
          return state is GetDataLoading
              ? const CustomCircleProgIndicator()
              : Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListView.builder(
                      shrinkWrap: shrinkwrap ?? true,
                      physics: physics ?? const NeverScrollableScrollPhysics(),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          isFavorite: homeCubit
                              .chekIsFavorite(products[index].productId!),
                          onTap: () {
                            bool isFavorite = homeCubit
                                .chekIsFavorite(products[index].productId!);
                            isFavorite
                                ? homeCubit
                                    .removeFavorite(products[index].productId!)
                                : homeCubit
                                    .addToFavorie(products[index].productId!);
                          },
                          product: products[index],
                        );
                      }),
                );
        },
      ),
    );
  }
}
