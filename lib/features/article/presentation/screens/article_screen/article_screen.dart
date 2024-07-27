import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:inno_net_app/features/article/presentation/screens/widgets/articles_widget.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

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
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        20.heightBox,

        Align(
          alignment: Alignment.centerLeft,
          child: TabBar(
            controller: _tabController,
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            labelPadding: const EdgeInsets.only(right: 10, left: 10),
            dividerHeight: 0,
            indicatorPadding: const EdgeInsets.only(bottom: 5),
            dragStartBehavior: DragStartBehavior.start,
            tabs: const [
              Tab(text: "Apple"),
              Tab(text: "Tesla"),
              Tab(text: "TechCrunch"),
            ],
          ),
        ),
        // ArticleCategoriesWidget(articleCategories: articleCategories),
        // const CustomDivider(),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              ArticlesWidget(),
              ArticlesWidget(),
              ArticlesWidget(),
            ],
          ),
        )
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
