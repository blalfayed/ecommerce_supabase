import 'package:ecommerce_supabase/core/components/cache_image.dart';
import 'package:ecommerce_supabase/core/functions/build_appbar.dart';
import 'package:ecommerce_supabase/views/auth/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'widgets/comments_list.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, 'Product Name'),
      body: ListView(
        children: [
          const CachImage(
            url:
                "https://sharkiatoday.com/wp-content/uploads/2016/08/htqg-5-jhfg-hpvwd-ugd-ih-td-lfp.jpg",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Product Name'), Text('123 LE')],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('3  '),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        )
                      ],
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.grey,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Product Description'),
                const SizedBox(
                  height: 20,
                ),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  labeltext: 'Type your feedback',
                  keyBoardType: TextInputType.text,
                  suffIcon: TextButton(
                      onPressed: () {}, child: const Icon(Icons.send)),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Text(
                      'Comments',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const CommentslList()
              ],
            ),
          )
        ],
      ),
    );
  }
}
