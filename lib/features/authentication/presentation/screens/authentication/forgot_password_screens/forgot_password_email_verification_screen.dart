import 'package:flutter/material.dart';
import 'package:inno_net_app/core/constants/screen_transition_constants.dart';
import 'package:inno_net_app/features/authentication/domain/entities/user_entities.dart';
import 'package:inno_net_app/core/extensions/custom_gesture_detector.dart';
import 'package:inno_net_app/core/extensions/page_navigation_extension.dart';
import 'package:inno_net_app/core/extensions/screen_size_extension.dart';
import 'package:inno_net_app/features/authentication/presentation/screens/authentication/forgot_password_screens/forgot_password_otp_verification_screen.dart';
import 'package:inno_net_app/features/common/base_screen.dart';
import 'package:inno_net_app/features/authentication/presentation/utils/form_keys.dart';
import 'package:inno_net_app/widgets/button_widget.dart';
import 'package:inno_net_app/widgets/custom_text_form_field.dart';
import 'package:inno_net_app/service_locator.dart';

///[FgPasswordEmailVerificationScreen] is a screen that is used to verify the user's email address to reset the password.
class FgPasswordEmailVerificationScreen extends StatelessWidget {
  const FgPasswordEmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Form(
        key: FormKeys.myFormKey,
        child: ListView(
          children: [
            50.h,
            Text(
              "Password Reset",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            15.h,
            Text(
              "To reset your password, please verify your email address.",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            20.h,
            CustomTextFormField(
              hintText: "Email",
              validator: locator<FormFieldValidateClass>().isValidEmail,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            20.h,
            ButtonWidget(
              buttonText: "Continue",
              onTap: () {
                if (FormKeys.myFormKey.currentState!.validate()) {
                  debugPrint("Email verified");
                  context.pushWithTransition(
                    const FgPasswordOtpVerificationScreen(),
                    ScreenTransitionConstants.rightToLeftTransitionType,
                  );
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
      ),
    );
  }
}
