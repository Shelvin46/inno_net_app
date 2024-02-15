import 'package:flutter/material.dart';
import 'package:inno_net_app/core/constants/decorations_constants.dart';
import 'package:inno_net_app/core/extensions/screen_size_extension.dart';
import 'package:pinput/pinput.dart';

///[ValidateOtpFormField] is a custom widget that is used to validate the OTP entered by the user.
class ValidateOtpFormField extends StatelessWidget {
  const ValidateOtpFormField(
      {super.key, this.focusNode, this.controller, this.validator});
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Pinput(
          validator: validator,
          controller: controller,
          focusNode: focusNode,
          errorTextStyle: TextStyle(
              color: Theme.of(context).colorScheme.error, fontSize: 12),
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          separatorBuilder: (index) {
            return 24.w;
          },
          enabled: true,
          defaultPinTheme: PinTheme(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: DecorationConstants.borderRadius,
              border: Border.all(
                color: Theme.of(context).colorScheme.secondary,
                width: 1,
              ),
            ),
            textStyle: TextStyle(
              fontSize: 20,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ));
  }
}
