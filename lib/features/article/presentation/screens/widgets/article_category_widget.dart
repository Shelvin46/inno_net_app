import 'package:flutter/material.dart';
import 'package:inno_net_app/features/article/presentation/screens/article_screen/article_screen.dart';

class ArticleCategoriesWidget extends StatelessWidget {
  const ArticleCategoriesWidget({
    super.key,
    required this.articleCategories,
  });

  final List<ArticleCategoriesModel> articleCategories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 90,
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: articleCategories.length,
        itemBuilder: (context, index) {
          final articleCategory = articleCategories[index];
          return ChoiceChip(
              color: WidgetStatePropertyAll<Color>(
                Theme.of(context).colorScheme.onSurface,
              ),
              shape: RoundedRectangleBorder(
                // side: BorderSide(
                //   color: Theme.of(context).colorScheme.primary,
                //   width: 1,
                // ),
                borderRadius: BorderRadius.circular(10),
              ),
              label: Text(articleCategory.title,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onError,
                      )),
              selected: false);
        },
      ),
    );
  }
}
