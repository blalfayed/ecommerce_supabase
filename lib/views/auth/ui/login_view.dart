import 'package:ecommerce_supabase/views/auth/ui/forgot_view.dart';
import 'package:ecommerce_supabase/views/auth/ui/signup_view.dart';
import 'package:ecommerce_supabase/views/nav_bar/ui/main_home_view.dart';
import 'package:flutter/material.dart';
import '../../../core/functions/navigate_to.dart';
import 'widgets/custom_row_with_arrow.dart';
import 'widgets/custom_text_btn.dart';
import 'widgets/custom_text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              const Text(
                'Welcome To Our Market ',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                margin: const EdgeInsets.all(16),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      const CustomTextFormField(
                        labeltext: "Email",
                        keyBoardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        labeltext: "Password",
                        suffIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.visibility_off)),
                        isSecured: true,
                        keyBoardType: TextInputType.visiblePassword,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomTextBtn(
                            ontap: () {
                              navigateTo(context, const ForgotView());
                            },
                            text: 'Forgot Password?',
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomRowWithArrowBtn(
                        text: 'Login',
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomRowWithArrowBtn(
                        text: 'Login With Google',
                        onTap: () {
                          navigateTo(context, MainHomeView());
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Don't Have An Account?",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          CustomTextBtn(
                            text: 'Sign Up',
                            ontap: () {
                              navigateTo(context, const SignupView());
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
