import 'package:ecommerce_supabase/core/components/products_list.dart';
import 'package:ecommerce_supabase/core/functions/build_appbar.dart';
import 'package:flutter/material.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, 'My Orders'),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: ProductsList(
          physics: BouncingScrollPhysics(),
          shrinkwrap: false,
        ),
      ),
    );
  }
}
