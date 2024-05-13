import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:inno_net_app/widgets/custom_svg_picture_widget.dart';

class RootBottomNavigationBarIcon extends StatelessWidget {
  const RootBottomNavigationBarIcon({
    super.key,
    required this.image,
    required this.pageName,
  });

  final String image;
  final String pageName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPictureWidget(imageUrl: image),
        3.heightBox,
        Text(pageName, style: context.textTheme.labelSmall)
      ],
    );
  }
}
