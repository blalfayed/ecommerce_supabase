import 'package:flutter/material.dart';

import '../app_colors.dart';

AppBar buildCustomAppBar(BuildContext context, String text) {
  return AppBar(
    backgroundColor: AppColors.kPrimaryColor,
    centerTitle: true,
    title: Text(
      text,
      style: const TextStyle(color: AppColors.kWhiteColor),
    ),
    leading: IconButton(
        color: AppColors.kWhiteColor,
        onPressed: Navigator.of(context).pop,
        icon: const Icon(Icons.arrow_back_ios)),
  );
}
