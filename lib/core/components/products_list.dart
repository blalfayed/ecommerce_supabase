import 'package:flutter/material.dart';

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
    return ListView.builder(
        shrinkWrap: shrinkwrap ?? true,
        physics: physics ?? const NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return const ProductCard();
        });
  }
}
