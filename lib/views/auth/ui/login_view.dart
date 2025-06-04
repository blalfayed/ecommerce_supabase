import 'package:ecommerce_supabase/core/components/custom_circle_pro_ind.dart';
import 'package:ecommerce_supabase/core/functions/navigate_without_back.dart';
import 'package:ecommerce_supabase/views/auth/ui/forgot_view.dart';
import 'package:ecommerce_supabase/views/auth/ui/signup_view.dart';
import 'package:ecommerce_supabase/views/nav_bar/ui/main_home_view.dart';
import 'package:ecommerce_supabase/views/product_details/logic/cubit/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/functions/navigate_to.dart';
import '../../../core/functions/show_msg.dart';
import 'widgets/custom_row_with_arrow.dart';
import 'widgets/custom_text_btn.dart';
import 'widgets/custom_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is LoginSuccess || state is GoogleSignInSuccess) {
          navigateWithoutBack(context, MainHomeView());
        }
        if (state is LoginError) {
          showMsg(context, state.message);
        }
      },
      builder: (context, state) {
        AuthenticationCubit cubit = context.read<AuthenticationCubit>();

        return Scaffold(
          body: state is LoginLoading
              ? const CustomCircleProgIndicator()
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 80,
                          ),
                          const Text(
                            'Welcome To Our Market ',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Card(
                            margin: const EdgeInsets.all(16),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  CustomTextFormField(
                                    controller: emailController,
                                    labeltext: "Email",
                                    keyBoardType: TextInputType.emailAddress,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomTextFormField(
                                    controller: passwordController,
                                    labeltext: "Password",
                                    suffIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isPasswordHidden =
                                                !isPasswordHidden;
                                          });
                                        },
                                        icon: Icon(isPasswordHidden
                                            ? Icons.visibility
                                            : Icons.visibility_off)),
                                    isSecured: isPasswordHidden,
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
                                          navigateTo(
                                              context, const ForgotView());
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
                                      onTap: () {
                                        if (_formKey.currentState!.validate()) {
                                          cubit.login(
                                              email: emailController.text,
                                              password:
                                                  passwordController.text);
                                        }
                                      }),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomRowWithArrowBtn(
                                    text: 'Login With Google',
                                    onTap: () => cubit.googleSignIn(),
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
                                          navigateTo(
                                              context, const SignupView());
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
                ),
        );
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose;
    passwordController.dispose();
    super.dispose();
  }
}
