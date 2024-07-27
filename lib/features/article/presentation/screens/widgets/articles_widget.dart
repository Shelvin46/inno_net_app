import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inno_net_app/core/constants/base_bloc_states.dart';
import 'package:inno_net_app/features/article/presentation/blocs/get_articles/get_articles_bloc.dart';
import 'package:inno_net_app/features/article/presentation/screens/widgets/article_list_tile_widget.dart';
import 'package:inno_net_app/features/article/presentation/screens/widgets/custom_divider.dart';
import 'package:inno_net_app/widgets/error_show_widget.dart';

class ArticlesWidget extends StatelessWidget {
  const ArticlesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetArticlesBloc, BaseState>(
      builder: (context, state) {
        if (state is GetArticlesState) {
          return ListView.separated(
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) {
                final article = state.articles[index];
                return ArticleListTileWidget(
                  article: article,
                );
              },
              separatorBuilder: (context, index) {
                return const CustomDivider();
              },
              itemCount: state.articles.length);
        } else if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else if (state is TimeoutErrorState) {
          return ErrorShowWidget(
            error: "Timeout error try again later",
            onRetry: () {
              context.read<GetArticlesBloc>().add(const GetArticles());
            },
          ).toCenter();
        } else if (state is ParsingErrorState) {
          return ErrorShowWidget(
              error: "Parsing error try again later",
              onRetry: () {
                context.read<GetArticlesBloc>().add(const GetArticles());
              }).toCenter();
        } else if (state is ServerErrorState) {
          return ErrorShowWidget(
            error: "Something went wrong please try again later",
            onRetry: () {
              context.read<GetArticlesBloc>().add(const GetArticles());
            },
          ).toCenter();
        } else if (state is NoInternetState) {
          return ErrorShowWidget(
            error: "No internet connection",
            onRetry: () {
              context.read<GetArticlesBloc>().add(const GetArticles());
            },
          ).toCenter();
        } else if (state is FormatExceptionState) {
          return ErrorShowWidget(
            error: "Format exception try again later",
            onRetry: () {
              context.read<GetArticlesBloc>().add(const GetArticles());
            },
          ).toCenter();
        } else {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
      },
    );
  }
}
