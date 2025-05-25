import 'package:ecommerce_supabase/core/app_colors.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_row_btn.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * .65,
        child: const Card(
          color: AppColors.kWhiteColor,
          margin: EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(24))),
          child: Padding(
            padding: EdgeInsets.all(8.0),
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
                CustomRowBtn(
                  text: 'Edit Email',
                  icon: Icons.person,
                ),
                CustomRowBtn(text: 'My Orders', icon: Icons.shopping_basket),
                CustomRowBtn(text: 'Log Out', icon: Icons.logout)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
