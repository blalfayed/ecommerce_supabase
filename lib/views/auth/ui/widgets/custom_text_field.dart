import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labeltext,
    this.suffIcon,
    this.isSecured = false,
  });
  final String labeltext;
  final Widget? suffIcon;
  final bool isSecured;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isSecured,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This Field is Required';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        suffixIcon: suffIcon,
        labelText: labeltext,
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.kBordersideColor)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.kBordersideColor)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.kBordersideColor)),
      ),
    );
  }
}
