import 'package:flutter/material.dart';
import 'package:inno_net_app/core/constants/decorations_constants.dart';

class ButtonLoadingWidget extends StatelessWidget {
  const ButtonLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(8),
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: DecorationConstants.borderRadius,
            // color: Theme.of(context).colorScheme.secondary,
            gradient: const LinearGradient(colors: [
              Color(0xFF5051F9),
              Color(0xFF1EA7FF),
            ])),
        child: const SizedBox(
          height: 30,
          width: 30,
          child: CircularProgressIndicator.adaptive(),
        ));
  }
}
