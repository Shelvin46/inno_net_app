import 'package:flutter/material.dart';
import 'package:inno_net_app/core/constants/decorations_constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.hintText,
      this.controller,
      this.validator,
      this.autovalidateMode});
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      validator: validator,
      controller: controller,

      cursorColor:
          Theme.of(context).colorScheme.secondary, // Set the cursor color h
      decoration: InputDecoration(
        errorMaxLines: 2,
        isDense: true,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.labelSmall,
        border: OutlineInputBorder(
          borderRadius: DecorationConstants.borderRadius,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: DecorationConstants.borderRadius,
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 2,
          ),
        ),
      ),
    );
  }
}
