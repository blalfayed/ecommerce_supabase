import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
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
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomTextButton(
                          ontap: () {},
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
                        CustomTextButton(
                          text: 'Sign Up',
                          ontap: () {},
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
    );
  }
}

class CustomRowWithArrowBtn extends StatelessWidget {
  const CustomRowWithArrowBtn({
    super.key,
    required this.text,
    this.onTap,
  });
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.kPrimaryColor,
                foregroundColor: AppColors.kWhiteColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: onTap,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Icon(Icons.arrow_forward),
            ))
      ],
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    this.ontap,
  });
  final String text;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.kPrimaryColor),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labeltext,
    this.suffIcon,
    this.isSecured = false,
  });
  final String labeltext;
  final Widget? suffIcon;
  final bool isSecured;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isSecured,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This Field is Required';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        suffixIcon: suffIcon,
        labelText: labeltext,
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.kBordersideColor)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.kBordersideColor)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.kBordersideColor)),
      ),
    );
  }
}
