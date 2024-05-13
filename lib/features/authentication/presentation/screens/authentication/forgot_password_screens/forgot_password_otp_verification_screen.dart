import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:inno_net_app/core/constants/screen_transition_constants.dart';
import 'package:inno_net_app/core/extensions/page_navigation_extension.dart';
import 'package:inno_net_app/features/authentication/domain/entities/user_entities.dart';
import 'package:inno_net_app/core/extensions/custom_gesture_detector.dart';
import 'package:inno_net_app/core/extensions/screen_size_extension.dart';
import 'package:inno_net_app/features/authentication/presentation/screens/authentication/forgot_password_screens/forgot_password_create_new_password_screen.dart';
import 'package:inno_net_app/features/authentication/presentation/screens/authentication/forgot_password_screens/widgets/otp_form_field.dart';
import 'package:inno_net_app/features/common/base_screen.dart';
import 'package:inno_net_app/widgets/button_widget.dart';
import 'package:inno_net_app/service_locator.dart';

///[FgPasswordOtpVerificationScreen] is a screen that is used to verify the OTP sent to the user's email address.
class FgPasswordOtpVerificationScreen extends StatefulWidget {
  const FgPasswordOtpVerificationScreen({super.key});

  @override
  State<FgPasswordOtpVerificationScreen> createState() =>
      _FgPasswordOtpVerificationScreenState();
}

class _FgPasswordOtpVerificationScreenState
    extends State<FgPasswordOtpVerificationScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    formKey.currentState?.dispose();
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
            "Verify OTP",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          15.h,
          Text(
            "An OTP has been sent to your email address. Please check your inbox and enter the 4-digit code below to verify your account.",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          40.h,
          // OTP form field
          ValidateOtpFormField(
            validator: locator<FormFieldValidateClass>().validateOtp,
          ),
          20.h,
          RichText(
            text: TextSpan(
              text: "Didn't receive the OTP? ",
              // style: DefaultTextStyle.of(context).style,
              style: Theme.of(context).textTheme.titleSmall,
              children: <TextSpan>[
                TextSpan(
                  text: ' Resend OTP',
                  style: const TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Perform your action here
                      debugPrint('Resend OTP tapped');
                    },
                ),
              ],
            ),
          ),
          20.h,
          ButtonWidget(
            buttonText: "Verify",
            onTap: () {
              if (formKey.currentState!.validate()) {
                debugPrint("OTP verified");
                context.pushWithTransition(
                  const FgPasswordCreatePasswordScreen(),
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
    ));
  }
}
