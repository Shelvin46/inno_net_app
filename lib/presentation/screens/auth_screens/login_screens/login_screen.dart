import 'package:flutter/material.dart';
import 'package:inno_net_app/core/constants/text_form_fields_decorations_constants.dart';
import 'package:inno_net_app/core/extensions/screen_size_extension.dart';
import 'package:inno_net_app/presentation/screens/common/base_screen.dart';
import 'package:inno_net_app/presentation/widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final textFormFields = [
  const CustomTextFormField(
    hintText: "Email",
  ),
  const CustomTextFormField(hintText: "Password"),
];

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        child: Column(
      children: [
        25.h,
        Text(
          "InnoNet",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        25.h,
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
        Container(
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: DecorationConstants.borderRadius,
                color: Theme.of(context).colorScheme.secondary),
            child: Text(
              "Log in",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            )),
        50.h,
        // sign up text
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account?  ",
            ),
            Text(
              "Sign up",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
