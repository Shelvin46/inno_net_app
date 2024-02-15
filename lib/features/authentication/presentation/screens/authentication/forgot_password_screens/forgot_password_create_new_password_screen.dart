import 'package:flutter/material.dart';
import 'package:inno_net_app/core/extensions/custom_gesture_detector.dart';
import 'package:inno_net_app/core/extensions/screen_size_extension.dart';
import 'package:inno_net_app/features/authentication/domain/entities/user_entities.dart';
import 'package:inno_net_app/features/authentication/presentation/screens/common/base_screen.dart';
import 'package:inno_net_app/service_locator.dart';
import 'package:inno_net_app/widgets/button_widget.dart';
import 'package:inno_net_app/widgets/custom_text_form_field.dart';

///[FgPasswordCreatePasswordScreen] is a screen that is used to create a new password for the user

class FgPasswordCreatePasswordScreen extends StatefulWidget {
  const FgPasswordCreatePasswordScreen({super.key});

  @override
  State<FgPasswordCreatePasswordScreen> createState() =>
      _FgPasswordCreatePasswordScreenState();
}

class _FgPasswordCreatePasswordScreenState
    extends State<FgPasswordCreatePasswordScreen> {
  final formKey = GlobalKey<FormState>();

  late TextEditingController passwordController;

  late TextEditingController confirmPasswordController;

  late List formFields;

  @override
  void initState() {
    // initializing controllers
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    // text form fields
    formFields = [
      CustomTextFormField(
        hintText: "New Password",
        controller: passwordController,
      ),
      CustomTextFormField(
        hintText: "Confirm Password",
        controller: confirmPasswordController,
        validator: locator<FormFieldValidateClass>().validatePassword,
      ),
    ];
    super.initState();
  }

  @override
  void dispose() {
    formKey.currentState?.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        child: Form(
      key: formKey,
      child: ListView(
        children: [
          50.h,
          Text(
            "Create New Password",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          15.h,
          Text(
            "Enter a new password to regain access to your account.",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          20.h,
          ListView.separated(
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) {
              return formFields[index];
            },
            separatorBuilder: (context, index) => 25.h,
            itemCount: 2,
          ),
          25.h,
          // button to sign up
          ButtonWidget(
            buttonText: "Create",
            onTap: () {
              if (formKey.currentState!.validate()) {
                debugPrint("Validated");
              }
            },
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Back",
              style: Theme.of(context).textTheme.titleMedium,
            ).customGestureDetector(onTap: () => Navigator.pop(context)),
          ),
        ],
      ),
    ));
  }
}
