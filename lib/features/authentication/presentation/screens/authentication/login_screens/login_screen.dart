import 'package:flutter/material.dart';
import 'package:inno_net_app/core/extensions/custom_gesture_detector.dart';
import 'package:inno_net_app/core/extensions/page_navigation_extension.dart';
import 'package:inno_net_app/core/extensions/screen_size_extension.dart';
import 'package:inno_net_app/features/authentication/presentation/screens/authentication/forgot_password_screens/forgot_password_email_verification_screen.dart';
import 'package:inno_net_app/features/authentication/presentation/screens/authentication/sign_up_screens/sign_up_screen.dart';
import 'package:inno_net_app/features/authentication/presentation/screens/authentication/widgets/sign_in_and_sign_up_prompt.dart';
import 'package:inno_net_app/features/authentication/presentation/screens/common/base_screen.dart';
import 'package:inno_net_app/widgets/button_widget.dart';
import 'package:inno_net_app/widgets/custom_text_form_field.dart';

import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final textFormFields = [
    const CustomTextFormField(
      hintText: "Email",
    ),
    const CustomTextFormField(
      hintText: "Password",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        child: Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 25.h,
        50.h,
        Text(
          "InnoNet",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        50.h,
        // text form fields
        ListView.separated(
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) {
              return textFormFields[index];
            },
            separatorBuilder: (context, index) {
              return 25.h;
            },
            itemCount: 2),
        5.h,
        // forgot password text
        const Align(
          alignment: Alignment.topRight,
          child: Text(
            "Forgot Password?",
          ),
        ).customGestureDetector(
          onTap: () => context.pushWithTransition(
              const FgPasswordEmailVerificationScreen(),
              PageTransitionType.rightToLeftWithFade),
        ),
        25.h,
        // button to login
        ButtonWidget(
          buttonText: "Log in",
          onTap: () {},
        ),
        20.h,
        // sign up text
        SignInAndSignUpPrompt(
          action: "Sign Up",
          instruction: "Don't have an account?",
          onTap: () => context.pushWithTransition(
              SignUpPage(), PageTransitionType.rightToLeftWithFade),
        ),
      ],
    ));
  }
}
