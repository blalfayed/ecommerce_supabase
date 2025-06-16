import 'package:flutter/material.dart';

import '../app_colors.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    this.onPressed,
    this.controller,
  });

  final void Function()? onPressed;

  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: ElevatedButton.icon(
            onPressed: onPressed,
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
