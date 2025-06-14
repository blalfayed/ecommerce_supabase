import 'package:ecommerce_supabase/core/components/cache_image.dart';
import 'package:ecommerce_supabase/core/components/custom_circle_pro_ind.dart';
import 'package:ecommerce_supabase/core/functions/build_appbar.dart';
import 'package:ecommerce_supabase/core/functions/navigate_without_back.dart';
import 'package:ecommerce_supabase/core/models/product_model/product_model.dart';
import 'package:ecommerce_supabase/views/auth/logic/cubit/authentication_cubit.dart';
import 'package:ecommerce_supabase/views/auth/ui/widgets/custom_text_field.dart';
import 'package:ecommerce_supabase/views/product_details/logic/cubit/project_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'widgets/comments_list.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key, required this.product});
  final ProductModel product;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  final TextEditingController _commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProjectDetailsCubit()..getRates(productId: widget.product.productId!),
      child: BlocConsumer<ProjectDetailsCubit, ProjectDetailsState>(
        listener: (context, state) {
          if (state is AddOrUpdateRateSuccess) {
            navigateWithoutBack(context, widget);
          }
        },
        builder: (context, state) {
          ProjectDetailsCubit cubit = context.read<ProjectDetailsCubit>();
          return Scaffold(
            appBar: buildCustomAppBar(
                context, widget.product.productName ?? 'Product Name'),
            body: state is GetRateLoading || state is AddCommentLoading
                ? const CustomCircleProgIndicator()
                : ListView(
                    children: [
                      CachImage(
                        url: widget.product.imageUrl ??
                            "https://sharkiatoday.com/wp-content/uploads/2016/08/htqg-5-jhfg-hpvwd-ugd-ih-td-lfp.jpg",
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 16),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(widget.product.productName ??
                                    'Product Name'),
                                Text(widget.product.price != null
                                    ? "${widget.product.price} LE"
                                    : "...LE")
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text('${cubit.averageRate}  '),
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    )
                                  ],
                                ),
                                const Icon(
                                  Icons.favorite,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(widget.product.description ??
                                'Product Description'),
                            const SizedBox(
                              height: 20,
                            ),
                            RatingBar.builder(
                              initialRating: cubit.userRate.toDouble(),
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                cubit.addOrUpdateUserRate(
                                    productID: widget.product.productId!,
                                    data: {
                                      "rate": rating.toInt(),
                                      "for_user": cubit.userID,
                                      "for_product": widget.product.productId,
                                    });
                              },
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            CustomTextFormField(
                              controller: _commentController,
                              labeltext: 'Type your feedback',
                              keyBoardType: TextInputType.text,
                              suffIcon: TextButton(
                                  onPressed: () async {
                                    await cubit.addComments(data: {
                                      "comment": _commentController.text,
                                      "for_user": cubit.userID,
                                      "for_product": widget.product.productId,
                                      "user_name": context
                                              .read<AuthenticationCubit>()
                                              .userDataModel
                                              ?.name ??
                                          "User Name"
                                    });
                                    _commentController.clear();
                                  },
                                  child: const Icon(Icons.send)),
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
                            CommentslList(
                              productModel: widget.product,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }
}
