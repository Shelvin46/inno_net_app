import 'package:flutter/material.dart';
import 'package:inno_net_app/features/authentication/domain/entities/user_entities.dart';
import 'package:inno_net_app/core/extensions/screen_size_extension.dart';
import 'package:inno_net_app/features/authentication/presentation/screens/authentication/widgets/sign_in_and_sign_up_prompt.dart';
import 'package:inno_net_app/features/authentication/presentation/screens/common/base_screen.dart';
import 'package:inno_net_app/features/authentication/presentation/utils/form_keys.dart';
import 'package:inno_net_app/widgets/button_widget.dart';
import 'package:inno_net_app/widgets/custom_text_form_field.dart';
import 'package:inno_net_app/service_locator.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final formFields = [
    CustomTextFormField(
      hintText: "Full Name",
      validator: locator<FormFieldValidateClass>().validateName,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    ),
    CustomTextFormField(
      hintText: "Email",
      validator: locator<FormFieldValidateClass>().isValidEmail,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    ),
    CustomTextFormField(
      hintText: "Password",
      validator: locator<FormFieldValidateClass>().validatePassword,
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
              itemCount: 3,
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
          20.h,
          // sign in text
          SignInAndSignUpPrompt(
            action: "Log in",
            instruction: "Already have an account?",
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    ));
  }
}
