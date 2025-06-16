import 'package:ecommerce_supabase/core/components/products_list.dart';
import 'package:ecommerce_supabase/core/functions/build_appbar.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, "Search Results"),
      body: ListView(
        children: const [
          SizedBox(
            height: 20,
          ),
          ProductsList()
        ],
      ),
    );
  }
}
