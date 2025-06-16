import 'package:flutter/material.dart';

import '../../../core/components/products_list.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ListView(
        children: const [
          Text(
            'Your Favorite Products',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          ProductsList(
            isFavoriteView: true,
          )
        ],
      ),
    );
  }
}
