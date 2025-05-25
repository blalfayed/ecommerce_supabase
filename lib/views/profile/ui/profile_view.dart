import 'package:ecommerce_supabase/core/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.kWhiteColor,
      margin: const EdgeInsets.all(16),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 55,
              backgroundColor: AppColors.kPrimaryColor,
              foregroundColor: AppColors.kWhiteColor,
              child: Icon(
                Icons.person,
                size: 60,
              ),
            ),
            Text('User Name'),
            Text('User Email'),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              color: AppColors.kPrimaryColor,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.person,
                      color: AppColors.kWhiteColor,
                    ),
                    Text(
                      'Edit Name',
                      style: TextStyle(
                          color: AppColors.kWhiteColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.arrow_forward_ios, color: AppColors.kWhiteColor)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
