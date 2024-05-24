import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:inno_net_app/features/article/presentation/screens/article_screen/article_screen.dart';
import 'package:inno_net_app/widgets/custom_svg_picture_widget.dart';

class ArticleCategoriesWidget extends StatelessWidget {
  const ArticleCategoriesWidget({
    super.key,
    required this.articleCategories,
  });

  final List<ArticleCategoriesModel> articleCategories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: articleCategories.length,
        itemBuilder: (context, index) {
          final articleCategory = articleCategories[index];
          return Column(
            children: [
              Container(
                height: 60,
                width: 70,
                margin: const EdgeInsets.only(right: 10),
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: SvgPictureWidget(
                  imageUrl: articleCategory.imageUrl,
                ),
              ),
              5.heightBox,
              Text(
                articleCategory.title,
                style: context.textTheme.labelMedium,
              ),
            ],
          );
        },
      ),
    );
  }
}
