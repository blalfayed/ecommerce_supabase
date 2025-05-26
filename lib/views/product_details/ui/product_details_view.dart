import 'package:ecommerce_supabase/core/components/cache_image.dart';
import 'package:ecommerce_supabase/core/functions/build_appbar.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, 'Product Name'),
      body: ListView(
        children: const [
          CachImage(
            url:
                "https://sharkiatoday.com/wp-content/uploads/2016/08/htqg-5-jhfg-hpvwd-ugd-ih-td-lfp.jpg",
          )
        ],
      ),
    );
  }
}
