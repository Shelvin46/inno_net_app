import 'package:flutter/material.dart';

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
      cursorColor: Theme.of(context).colorScheme.surface,
      decoration: InputDecoration(
          errorMaxLines: 2,
          isDense: true,
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.labelSmall,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          )
          // border: OutlineInputBorder(
          //   borderRadius: DecorationConstants.borderRadius,
          //   borderSide: BorderSide(
          //     color: Theme.of(context).colorScheme.onSurface,
          //     width: 1,
          //   ),
          // ),
          ),
    );
  }
}
