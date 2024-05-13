import 'package:flutter/material.dart';

class AppTitleWidget extends StatelessWidget {
  const AppTitleWidget({
    super.key,
    this.fontSize = 24,
  });

  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      'InnoNet',
      style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: fontSize,
      ),
    );
  }
}
