import 'package:ecommerce_supabase/core/components/products_list.dart';
import 'package:ecommerce_supabase/core/functions/build_appbar.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, category),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          ProductsList(
            category: category,
          )
        ],
      ),
    );
  }
}
