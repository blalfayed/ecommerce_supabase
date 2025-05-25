import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';

class CustomRowBtn extends StatelessWidget {
  const CustomRowBtn({
    super.key,
    required this.text,
    this.onTap,
    required this.icon,
  });

  final String text;
  final void Function()? onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      color: AppColors.kPrimaryColor,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                color: AppColors.kWhiteColor,
              ),
              Text(
                text,
                style: const TextStyle(
                    color: AppColors.kWhiteColor, fontWeight: FontWeight.bold),
              ),
              const Icon(Icons.arrow_forward_ios, color: AppColors.kWhiteColor)
            ],
          ),
        ),
      ),
    );
  }
}
