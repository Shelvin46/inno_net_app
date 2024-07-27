import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';

class ErrorShowWidget extends StatelessWidget {
  const ErrorShowWidget({
    super.key,
    required this.error,
    required this.onRetry,
  });

  final String error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textAlign: TextAlign.center,
          error,
          style: context.textTheme.titleLarge,
        ),
        20.heightBox,
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          onPressed: () {
            onRetry();
          },
          child: const Text("Retry"),
        )
      ],
    ).paddingSymmetric(horizontal: 20);
  }
}
