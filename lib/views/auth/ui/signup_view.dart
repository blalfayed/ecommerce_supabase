import 'package:ecommerce_supabase/core/functions/show_msg.dart';
import 'package:ecommerce_supabase/views/auth/ui/forgot_view.dart';
import 'package:ecommerce_supabase/views/nav_bar/ui/main_home_view.dart';
import 'package:ecommerce_supabase/views/product_details/logic/cubit/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/functions/navigate_to.dart';
import 'widgets/custom_row_with_arrow.dart';
import 'widgets/custom_text_btn.dart';
import 'widgets/custom_text_field.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _nameController = TextEditingController();
  bool isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => MainHomeView()));
          }
          if (state is SignUpError) {
            showMsg(context, state.message);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
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
                            CustomTextFormField(
                              controller: _nameController,
                              labeltext: "name",
                              keyBoardType: TextInputType.name,
                            ),
                            CustomTextFormField(
                              controller: _emailController,
                              labeltext: "Email",
                              keyBoardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextFormField(
                              controller: _passwordController,
                              labeltext: "Password",
                              suffIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isPasswordHidden = !isPasswordHidden;
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
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<AuthenticationCubit>().register(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                      name: _nameController.text);
                                }
                              },
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
        },
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
