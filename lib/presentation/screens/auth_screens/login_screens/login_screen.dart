import 'package:flutter/material.dart';
import 'package:inno_net_app/core/extensions/custom_gesture_detector.dart';
import 'package:inno_net_app/core/extensions/page_navigation_extension.dart';
import 'package:inno_net_app/core/extensions/screen_size_extension.dart';
import 'package:inno_net_app/presentation/screens/auth_screens/sign_up_screens/sign_up_screen.dart';
import 'package:inno_net_app/presentation/screens/common/base_screen.dart';
import 'package:inno_net_app/presentation/widgets/button_widget.dart';
import 'package:inno_net_app/presentation/widgets/custom_text_form_field.dart';
import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final textFormFields = [
  const CustomTextFormField(
    hintText: "Email",
  ),
  const CustomTextFormField(
    hintText: "Password",
  ),
];

class _LoginScreenState extends State<LoginScreen> {
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
        10.h,
        // forgot password text
        const Align(
          alignment: Alignment.topRight,
          child: Text(
            "Forgot Password?",
          ),
        ),
        25.h,
        // button to login
        ButtonWidget(
          buttonText: "Log in",
          onTap: () {},
        ),
        50.h,
        // sign up text
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have an account?",
            ),
            const Text(
              "Sign up",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ).customGestureDetector(
              onTap: () {
                // push the sign up screen
                context.pushWithTransition(
                  SignUpPage(),
                  PageTransitionType.rightToLeftWithFade,
                );
              },
            ),
          ],
        ),
      ],
    ));
  }
}
