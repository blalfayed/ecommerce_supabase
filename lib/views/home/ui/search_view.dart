import 'package:ecommerce_supabase/core/components/products_list.dart';
import 'package:ecommerce_supabase/core/functions/build_appbar.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.query});
  final String query;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: buildCustomAppBar(context, "Search Results"),
        body: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            ProductsList(
              query: query,
            )
          ],
        ),
      ),
    );
  }
}
