import 'package:flutter/material.dart';

import '../../../core/components/custom_search_field.dart';
import '../../../core/components/products_list.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ListView(
        children: const [
          Text(
            'Welcome To Our Market',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          CustomSearchField(),
          SizedBox(
            height: 20,
          ),
          ProductsList()
        ],
      ),
    );
  }
}
