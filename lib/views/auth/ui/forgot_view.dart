import 'package:ecommerce_supabase/core/components/custom_circle_pro_ind.dart';
import 'package:ecommerce_supabase/core/functions/show_msg.dart';
import 'package:ecommerce_supabase/views/product_details/logic/cubit/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/custom_elevated_btn.dart';
import 'widgets/custom_text_field.dart';

class ForgotView extends StatefulWidget {
  const ForgotView({super.key});

  @override
  State<ForgotView> createState() => _ForgotViewState();
}

class _ForgotViewState extends State<ForgotView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is PasswordResetSuccess) {
          Navigator.pop(context);
          showMsg(context, "Email was sent");
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: state is PasswordResetLoading
              ? const CustomCircleProgIndicator()
              : SafeArea(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 80,
                        ),
                        const Text(
                          'Enter Your Email To Reset Password ',
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
                                CustomEBtn(
                                  text: 'Send',
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      context
                                          .read<AuthenticationCubit>()
                                          .resetPassword(
                                              email: emailController.text);
                                    }
                                  },
                                ),
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
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
