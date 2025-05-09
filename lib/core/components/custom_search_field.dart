import 'package:flutter/material.dart';

import '../app_colors.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
      suffixIcon: ElevatedButton.icon(
        onPressed: () {},
        label: const Icon(Icons.search),
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.kPrimaryColor,
            foregroundColor: AppColors.kWhiteColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      ),
      labelText: "ابحث في العطارة",
      border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.kBordersideColor)),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.kBordersideColor)),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.kBordersideColor)),
    ));
  }
}
