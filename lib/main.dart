import 'package:ecommerce_supabase/core/app_colors.dart';
import 'package:ecommerce_supabase/core/my_observer.dart';
import 'package:ecommerce_supabase/views/auth/ui/login_view.dart';
import 'package:ecommerce_supabase/views/nav_bar/ui/main_home_view.dart';
import 'package:ecommerce_supabase/views/product_details/logic/cubit/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://xprtclqdfccliascldhz.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhwcnRjbHFkZmNjbGlhc2NsZGh6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDgyODMzMzYsImV4cCI6MjA2Mzg1OTMzNn0.jojocl-UA37S2GPKvY-AUusaGBgUf-ItF1oVJpZ5IdM',
  );
  Bloc.observer = MyObserver();

  runApp(const OurMarket());
}

class OurMarket extends StatelessWidget {
  const OurMarket({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SupabaseClient client = Supabase.instance.client;

    return BlocProvider(
      create: (context) => AuthenticationCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Our Perfumery',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.kScaffoldColor,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: client.auth.currentUser != null
            ? MainHomeView()
            : const LoginView(),
      ),
    );
  }
}
