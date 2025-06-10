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
  });
  final ScrollPhysics? physics;
  final bool? shrinkwrap;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getProducts(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          List<ProductModel> products = context.read<HomeCubit>().products;
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
