import 'package:flutter/material.dart';
import 'package:inno_net_app/core/constants/decorations_constants.dart';
import 'package:inno_net_app/core/extensions/custom_gesture_detector.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key, required this.buttonText, required this.onTap});
  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: DecorationConstants.borderRadius,
            // color: Theme.of(context).colorScheme.secondary,
            gradient: const LinearGradient(colors: [
              Color(0xFF5051F9),
              Color(0xFF1EA7FF),
            ])),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).buttonTheme.colorScheme?.primary,
          ),
        )).customGestureDetector(onTap: onTap);
  }
}
