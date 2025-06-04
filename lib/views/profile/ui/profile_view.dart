import 'package:ecommerce_supabase/core/app_colors.dart';
import 'package:ecommerce_supabase/core/components/custom_circle_pro_ind.dart';
import 'package:ecommerce_supabase/core/functions/navigate_to.dart';
import 'package:ecommerce_supabase/core/functions/navigate_without_back.dart';
import 'package:ecommerce_supabase/views/auth/ui/login_view.dart';
import 'package:ecommerce_supabase/views/product_details/logic/cubit/authentication_cubit.dart';
import 'package:ecommerce_supabase/views/profile/ui/myorders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../nav_bar/ui/main_home_view.dart';
import '../widgets/custom_row_btn.dart';
import 'edit_name_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          navigateWithoutBack(context, LoginView());
        }
      },
      builder: (context, state) {
        return state is LogoutLoading
            ? const CustomCircleProgIndicator()
            : Center(
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
                            onTap: () =>
                                navigateTo(context, const EditNameView()),
                            text: 'Edit Name',
                            icon: Icons.person,
                          ),
                          CustomRowBtn(
                            text: 'My Orders',
                            icon: Icons.shopping_basket,
                            onTap: () =>
                                navigateTo(context, const MyOrdersView()),
                          ),
                          CustomRowBtn(
                              onTap: () async {
                                await context
                                    .read<AuthenticationCubit>()
                                    .signOut();
                              },
                              text: 'Log Out',
                              icon: Icons.logout)
                        ],
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
