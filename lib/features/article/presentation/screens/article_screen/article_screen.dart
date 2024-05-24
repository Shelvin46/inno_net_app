import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inno_net_app/core/constants/base_bloc_states.dart';
import 'package:inno_net_app/features/article/presentation/blocs/get_articles/get_articles_bloc.dart';
import 'package:inno_net_app/features/article/presentation/screens/widgets/article_category_widget.dart';
import 'package:inno_net_app/features/article/presentation/screens/widgets/article_list_tile_widget.dart';
import 'package:inno_net_app/features/article/presentation/screens/widgets/custom_divider.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  final List<ArticleCategoriesModel> articleCategories = [
    const ArticleCategoriesModel(
      title: "Apple",
      imageUrl: "assets/article/apple-black-logo-svgrepo-com.svg",
    ),
    const ArticleCategoriesModel(
      title: "Tesla",
      imageUrl: "assets/article/tesla.svg",
    ),
    const ArticleCategoriesModel(
      title: "TechCrunch",
      imageUrl: "assets/article/techcrunch.svg",
    ),
  ];

  @override
  void initState() {
    context.read<GetArticlesBloc>().add(const GetArticles());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        30.heightBox,
        ArticleCategoriesWidget(articleCategories: articleCategories),
        const CustomDivider(),
        BlocBuilder<GetArticlesBloc, BaseState>(
          builder: (context, state) {
            if (state is GetArticlesState) {
              return ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) {
                    return const ArticleListTileWidget();
                  },
                  separatorBuilder: (context, index) {
                    return const CustomDivider();
                  },
                  itemCount: 10);
            } else if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else {
              return const Center(child: Text("Error"));
            }
          },
        ).expanded()
      ],
    );
  }
}

class ArticleCategoriesModel extends Equatable {
  final String title;
  final String imageUrl;

  const ArticleCategoriesModel({
    required this.title,
    required this.imageUrl,
  });

  @override
  List<Object> get props => [title, imageUrl];
}
