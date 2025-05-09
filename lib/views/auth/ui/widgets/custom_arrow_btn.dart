import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

class CustomArrowBtn extends StatelessWidget {
  const CustomArrowBtn({
    super.key,
    required this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.kPrimaryColor,
            foregroundColor: AppColors.kWhiteColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: onTap,
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Icon(Icons.arrow_forward),
        ));
  }
}
