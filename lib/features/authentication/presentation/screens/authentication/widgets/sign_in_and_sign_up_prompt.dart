import 'package:flutter/material.dart';
import 'package:inno_net_app/core/extensions/custom_gesture_detector.dart';

class SignInAndSignUpPrompt extends StatelessWidget {
  const SignInAndSignUpPrompt({
    super.key,
    required this.instruction,
    required this.action,
    required this.onTap,
  });
  final String instruction;
  final String action;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          instruction,
        ),
        Text(
          action,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ).customGestureDetector(onTap: onTap)
      ],
    );
  }
}
