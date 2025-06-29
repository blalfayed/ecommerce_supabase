import 'package:ecommerce_supabase/core/functions/navigate_to.dart';
import 'package:ecommerce_supabase/core/models/product_model/product_model.dart';
import 'package:ecommerce_supabase/views/product_details/ui/product_details_view.dart';
import 'package:flutter/material.dart';

import '../../views/auth/ui/widgets/custom_elevated_btn.dart';
import '../app_colors.dart';
import 'cache_image.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.product,
    super.key,
    this.onTap,
    required this.isFavorite,
  });
  final void Function()? onTap;
  final ProductModel product;

  final bool isFavorite;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        onTap: () => navigateTo(
            context,
            ProductDetailsView(
              product: product,
            )),
        child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16)),
                    child: CachImage(
                      url: product.imageUrl ??
                          "https://sharkiatoday.com/wp-content/uploads/2016/08/htqg-5-jhfg-hpvwd-ugd-ih-td-lfp.jpg",
                    ),
                  ),
                  Positioned(
                      child: Container(
                    alignment: Alignment.center,
                    width: 65,
                    height: 35,
                    decoration: const BoxDecoration(
                        color: AppColors.kPrimaryColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(16),
                            bottomRight: Radius.circular(16))),
                    child: Text(
                      'خصم %${product.sale}',
                      style: const TextStyle(color: AppColors.kWhiteColor),
                    ),
                  ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.productName ?? 'اسم المنتج',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: onTap,
                          icon: Icon(
                            Icons.favorite,
                            color: isFavorite
                                ? AppColors.kPrimaryColor
                                : AppColors.kGreyColor,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              '${product.price} جنيه',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${product.oldPrice} جنيه',
                              style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.kGreyColor),
                            )
                          ],
                        ),
                        CustomEBtn(
                          text: 'اشتري الآن',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
