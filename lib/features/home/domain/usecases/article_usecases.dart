import 'package:dartz/dartz.dart';
import 'package:inno_net_app/core/failures/failures.dart';
import 'package:inno_net_app/features/home/data/models/article_model.dart';
import 'package:inno_net_app/features/home/domain/repositories/article_repo.dart';
import 'package:inno_net_app/service_locator.dart';

class ArticleUsecases {
  Future<Either<Failure, Articles>> getArticles() async {
    return await locator<ArticleRepo>().getArticles();
  }
}
