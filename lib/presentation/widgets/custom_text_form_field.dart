import 'package:flutter/material.dart';
import 'package:inno_net_app/core/constants/text_form_fields_decorations_constants.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({super.key, this.hintText, this.controller});
  final String? hintText;
  final TextEditingController? controller;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor:
          Theme.of(context).colorScheme.secondary, // Set the cursor color h
      decoration: InputDecoration(
        isDense: true,
        hintText: widget.hintText,
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
