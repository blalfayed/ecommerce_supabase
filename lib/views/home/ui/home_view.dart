// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_supabase/core/functions/navigate_to.dart';
import 'package:ecommerce_supabase/views/home/ui/search_view.dart';
import 'package:flutter/material.dart';

import '../../../core/components/custom_Search_field.dart';
import '../../../core/components/products_list.dart';
import 'widgets/categories_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ListView(
        children: [
          CustomSearchField(
            onPressed: () => navigateTo(context, const SearchView()),
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset('assets/images/buy.PNG'),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "مواد العطارة الشعبية",
            style: TextStyle(fontSize: 20),
          ),
          const CategoriesList(),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Recently Products',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          const ProductsList()
        ],
      ),
    );
  }
}
