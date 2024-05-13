import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgPictureWidget extends StatelessWidget {
  const SvgPictureWidget({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(imageUrl,
        height: 20,
        width: 20,
        colorFilter: ColorFilter.mode(
          Theme.of(context).primaryColor,
          BlendMode.srcIn,
        )
        // color: Theme.of(context).primaryColor,

        );
  }
}
