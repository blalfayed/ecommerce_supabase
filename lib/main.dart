import 'package:ecommerce_supabase/core/app_colors.dart';
import 'package:ecommerce_supabase/views/auth/ui/login_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const OurMarket());
}

class OurMarket extends StatelessWidget {
  const OurMarket({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Our Market',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.kScaffoldColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginView(),
    );
  }
}
