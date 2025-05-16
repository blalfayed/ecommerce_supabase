import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColors.kPrimaryColor,
                    foregroundColor: AppColors.kWhiteColor,
                    child: categories[index].icon,
                  ),
                  Text(
                    categories[index].text,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
                  )
                ],
              ),
            );
          }),
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
