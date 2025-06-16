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
  });
  final ScrollPhysics? physics;
  final bool? shrinkwrap;
  final String? query;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getProducts(query: query),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          List<ProductModel> products = query != null
              ? context.read<HomeCubit>().searchResults
              : context.read<HomeCubit>().products;
          return state is GetDataLoading
              ? const CustomCircleProgIndicator()
              : ListView.builder(
                  shrinkWrap: shrinkwrap ?? true,
                  physics: physics ?? const NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      product: products[index],
                    );
                  });
        },
      ),
    );
  }
}
