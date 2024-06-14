import 'package:get_it/get_it.dart';
import 'package:inno_net_app/core/exceptions/exception_handler.dart';
import 'package:inno_net_app/features/article/data/datasources/remote/custom_dio_interceptor.dart';
import 'package:inno_net_app/features/article/domain/usecases/article_usecases.dart';
import 'package:inno_net_app/features/authentication/domain/entities/user_entities.dart';
import 'package:inno_net_app/features/authentication/data/repositories/auth_repo_implementation.dart';
import 'package:inno_net_app/features/authentication/domain/usecases/auth_usecases.dart';
import 'package:dio/dio.dart';
import 'package:inno_net_app/features/article/data/repositories/article_repo_implementaion.dart';
import 'package:inno_net_app/features/article/domain/repositories/article_repo.dart';

final locator = GetIt.instance;

/// [AuthRepoImplementation] is registered as a lazy singleton with the [GetIt] package
/// [FormFieldValidateClass] is registered as a lazy singleton with the [GetIt] package
/// [AuthUseCases] is registered as a factory with the [GetIt] package
/// [ArticleRepo] is registered as a singleton with the [GetIt] package
/// [Dio] is registered as a singleton with the [GetIt] package
/// [CustomExceptionHandler] is registered as a lazy singleton with the [GetIt] package
/// [AuthRepoImplementation] is registered as a lazy singleton with the [GetIt] package

class ServiceLocator {
  static void setupLocator() {
    locator.registerFactory<AuthUseCases>(
        () => AuthUseCases(authRepository: AuthRepoImplementation()));
    locator.registerLazySingleton(() => FormFieldValidateClass());
    locator.registerLazySingleton(() => AuthRepoImplementation());
    locator.registerLazySingleton(() => ArticleUsecases());
    locator.registerSingleton<ArticleRepo>(ArticlesRepoImplementation());
    locator.registerSingleton<Dio>(Dio());
    locator.registerLazySingleton(() => CustomExceptionHandler());
    locator<Dio>().interceptors.add(CustomDioInterceptor());
  }
}
