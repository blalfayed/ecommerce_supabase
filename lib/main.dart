import 'package:ecommerce_supabase/core/app_colors.dart';
import 'package:ecommerce_supabase/views/nav_bar/ui/main_home_view.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://xprtclqdfccliascldhz.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhwcnRjbHFkZmNjbGlhc2NsZGh6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDgyODMzMzYsImV4cCI6MjA2Mzg1OTMzNn0.jojocl-UA37S2GPKvY-AUusaGBgUf-ItF1oVJpZ5IdM',
  );

  runApp(const OurMarket());
}

class OurMarket extends StatelessWidget {
  const OurMarket({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Our Perfumery',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.kScaffoldColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainHomeView(),
    );
  }
}
