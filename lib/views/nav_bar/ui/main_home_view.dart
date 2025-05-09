import 'package:ecommerce_supabase/core/app_colors.dart';
import 'package:ecommerce_supabase/views/favorite/ui/favorite_view.dart';
import 'package:ecommerce_supabase/views/home/ui/home_view.dart';
import 'package:ecommerce_supabase/views/profile/ui/profile_view.dart';
import 'package:ecommerce_supabase/views/store/ui/store_view.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainHomeView extends StatelessWidget {
  MainHomeView({super.key});
  final List<Widget> views = [
    const HomeView(),
    const StoreView(),
    const FavoriteView(),
    const ProfileView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: views[2],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: AppColors.kWhiteColor),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          child: GNav(
              rippleColor: AppColors
                  .kPrimaryColor, // tab button ripple color when pressed
              hoverColor: AppColors.kPrimaryColor, // tab button hover color
              haptic: true, // haptic feedback// tab button shadow
              duration: Duration(milliseconds: 400), // tab animation duration
              gap: 8, // the tab button gap between icon and text
              color: AppColors.kGreyColor, // unselected icon color
              activeColor:
                  AppColors.kWhiteColor, // selected icon and text color
              iconSize: 24, // tab button icon size
              tabBackgroundColor:
                  AppColors.kPrimaryColor, // selected tab background color
              padding: EdgeInsets.symmetric(
                  horizontal: 20, vertical: 12), // navigation bar padding
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.store,
                  text: 'store',
                ),
                GButton(
                  icon: Icons.favorite,
                  text: 'favorite',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                )
              ]),
        ),
      ),
    );
  }
}
