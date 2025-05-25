import 'package:ecommerce_supabase/core/app_colors.dart';
import 'package:ecommerce_supabase/core/functions/navigate_to.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_row_btn.dart';
import 'edit_name_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * .65,
        child: Card(
          color: AppColors.kWhiteColor,
          margin: const EdgeInsets.all(16),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(24))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 55,
                  backgroundColor: AppColors.kPrimaryColor,
                  foregroundColor: AppColors.kWhiteColor,
                  child: Icon(
                    Icons.person,
                    size: 60,
                  ),
                ),
                const Text('User Name'),
                const Text('User Email'),
                CustomRowBtn(
                  onTap: () => navigateTo(context, const EditNameView()),
                  text: 'Edit Name',
                  icon: Icons.person,
                ),
                const CustomRowBtn(
                    text: 'My Orders', icon: Icons.shopping_basket),
                const CustomRowBtn(text: 'Log Out', icon: Icons.logout)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
