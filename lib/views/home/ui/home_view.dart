// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_supabase/core/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../core/components/custom_Search_field.dart';
import 'widgets/categories_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ListView(
        children: [
          const CustomSearchField(),
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
          Card(
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
                      child: Image.asset("assets/images/tawabel.jpg"),
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
                      child: const Text(
                        '10% OFF',
                        style: TextStyle(color: AppColors.kWhiteColor),
                      ),
                    ))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
