import 'package:ecommerce_supabase/views/auth/ui/forgot_view.dart';
import 'package:flutter/material.dart';
import '../../../core/functions/navigate_to.dart';
import 'widgets/custom_row_with_arrow.dart';
import 'widgets/custom_text_btn.dart';
import 'widgets/custom_text_field.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

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
                        labeltext: "name",
                        keyBoardType: TextInputType.name,
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
                        text: 'Sign Up',
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomRowWithArrowBtn(
                        text: 'Sign Up With Google',
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Already Have An Account?',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          CustomTextBtn(
                            text: 'Login',
                            ontap: () {
                              Navigator.pop(context);
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
