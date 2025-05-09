// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_supabase/core/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../core/components/custom_Search_field.dart';

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
          SizedBox(
            height: 20,
          ),
          Text(
            "مواد العطارة الشعبية",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.kPrimaryColor,
                      foregroundColor: AppColors.kWhiteColor,
                      child: categories[index].icon,
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

List<Category> categories = [
  // Category(icon: Icons.sports, text: 'Sports'),
  // Category(icon: Icons.tv, text: 'Electronics'),
  // Category(icon: Icons.collections, text: 'Collections'),
  // Category(icon: Icons.book, text: 'books'),
  // Category(icon: Icons.games, text: 'Games'),
  Category(icon: Image.asset('assets/icons/spices.png'), text: 'التوابل'),
  Category(icon: Image.asset('assets/icons/herbs.png'), text: 'الأعشاب'),
];

class Category {
  final Widget icon;
  final String text;
  Category({
    required this.icon,
    required this.text,
  });
}
