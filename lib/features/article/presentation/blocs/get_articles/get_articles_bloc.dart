import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inno_net_app/core/constants/base_bloc_states.dart';
import 'package:inno_net_app/core/exceptions/exception_handler.dart';
import 'package:inno_net_app/features/article/data/models/article_model.dart';
import 'package:inno_net_app/features/article/domain/usecases/article_usecases.dart';
import 'package:inno_net_app/service_locator.dart';
part 'get_articles_event.dart';
part 'get_articles_state.dart';

///[GetArticlesBloc] is a [Bloc] class that is used to manage the state of the [ArticleScreen]
///[GetArticlesBloc] extends [Bloc] class and takes [GetArticlesEvent] and [BaseState] as parameters
///[GetArticlesBloc] is used to get the articles from the API
///[GetArticlesBloc] is used to manage the state of the [ArticleScreen]
///[GetArticlesBloc] has a [GetArticlesBloc] constructor that takes [GetArticlesEvent] and [BaseState] as parameters
class GetArticlesBloc extends Bloc<GetArticlesEvent, BaseState> {
  GetArticlesBloc() : super(GetArticlesInitial()) {
    on<GetArticles>((event, emit) async {
      emit(LoadingState());

      final articles = await locator<ArticleUsecases>().getArticles();

      articles.fold((left) {
        final failureMessage = CustomExceptionHandler.handleExceptionToMap(
          left,
        );

        final state =
            CustomExceptionHandler.exceptions[failureMessage["error"]];

        return emit(state);
      }, (right) {
        return emit(
          GetArticlesState(articles: right.articles),
        );
      });
    });
  }
}
