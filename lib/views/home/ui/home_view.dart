// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_supabase/core/functions/navigate_to.dart';
import 'package:ecommerce_supabase/views/home/ui/search_view.dart';
import 'package:flutter/material.dart';

import '../../../core/components/custom_Search_field.dart';
import '../../../core/components/products_list.dart';
import 'widgets/categories_list.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            const SizedBox(
              height: 15,
            ),
            CustomSearchField(
                controller: _searchController,
                onPressed: () {
                  if (_searchController.text.isNotEmpty) {
                    navigateTo(
                        context,
                        SearchView(
                          query: _searchController.text,
                        ));
                    _searchController.clear();
                  }
                }),
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
              'المنتجات الحديثة',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            const ProductsList()
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
