import 'package:flutter/material.dart';
import 'package:inno_net_app/core/entities/user_entities.dart';
import 'package:inno_net_app/core/extensions/custom_gesture_detector.dart';
import 'package:inno_net_app/core/extensions/screen_size_extension.dart';
import 'package:inno_net_app/presentation/screens/common/base_screen.dart';
import 'package:inno_net_app/presentation/utils/form_keys.dart';
import 'package:inno_net_app/presentation/widgets/button_widget.dart';
import 'package:inno_net_app/presentation/widgets/custom_text_form_field.dart';
import 'package:inno_net_app/service_locator.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final formFields = [
    CustomTextFormField(
      hintText: "First Name",
      validator: locator<UserEntities>().validateName,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    ),
    const CustomTextFormField(
      hintText: "Last Name",
    ),
    CustomTextFormField(
      hintText: "Email",
      validator: locator<UserEntities>().isValidEmail,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    ),
    CustomTextFormField(
      hintText: "Password",
      validator: locator<UserEntities>().validatePassword,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        child: Form(
      key: FormKeys.myFormKey,
      child: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          50.h,
          Align(
            alignment: Alignment.center,
            child: Text(
              "InnoNet",
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          50.h,

          // text form fields
          ListView.separated(
              itemBuilder: (context, index) {
                return formFields[index];
              },
              itemCount: 4,
              separatorBuilder: (context, index) => 25.h,
              shrinkWrap: true,
              primary: false),

          25.h,
          // button to sign up
          ButtonWidget(
            buttonText: "Sign Up",
            onTap: () {
              if (FormKeys.myFormKey.currentState!.validate()) {
                debugPrint("Validated");
              }
            },
          ),
          50.h,
          // sign in text
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Already have an account?",
              ),
              const Text(
                "Sign in",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ).customGestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  // push the sign up screen
                },
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
