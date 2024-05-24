import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';

class ArticleListTileWidget extends StatelessWidget {
  const ArticleListTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                "Apple",
                style: context.textTheme.titleLarge,
              ),
              5.heightBox,
              Text(
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                "Apple is a fruit",
                style: context.textTheme.titleSmall,
              ),
            ],
          ).expanded(),
          10.widthBox,
          Container(
            height: 75,
            width: 75,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
