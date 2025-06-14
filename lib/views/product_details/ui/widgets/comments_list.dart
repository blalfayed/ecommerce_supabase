import 'package:ecommerce_supabase/core/components/custom_circle_pro_ind.dart';
import 'package:ecommerce_supabase/core/models/product_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CommentslList extends StatelessWidget {
  const CommentslList({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Supabase.instance.client
            .from("comments_table")
            .stream(primaryKey: ['id'])
            .eq("for_product", productModel.productId!)
            .order("created_at"),
        builder: (_, snapshot) {
          List<Map<String, dynamic>>? data = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CustomCircleProgIndicator(),
            );
          } else if (!snapshot.hasData) {
            return const Center(child: Text("no comment yet"));
          } else if (snapshot.hasData) {
            return Center(
              child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => const UserComment(),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: 10),
            );
          } else {
            return const Center(
              child: Text("something went error , try again"),
            );
          }
        });
  }
}

class UserComment extends StatelessWidget {
  const UserComment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Text(
              'User Name',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
        Row(
          children: [Text('comment')],
        ),
        Row(
          children: [
            Text(
              'Replay',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
        Row(
          children: [Text('replay')],
        )
      ],
    );
  }
}
