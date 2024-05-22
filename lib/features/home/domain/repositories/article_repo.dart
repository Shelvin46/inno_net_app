import 'package:dartz/dartz.dart';
import 'package:inno_net_app/core/failures/failures.dart';
import 'package:inno_net_app/features/home/data/models/article_model.dart';

/// [ArticleRepo] is an abstract class that is used to get the articles.
/// It is used to get the articles.
/// It has a [getArticles] method that returns a [Articles] if the articles are fetched successfully
/// It has a [Failure] if the articles are not fetched successfully

abstract class ArticleRepo {
  Future<Either<Failure, Articles>> getArticles();
}
