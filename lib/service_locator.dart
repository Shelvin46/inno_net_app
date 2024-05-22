import 'package:get_it/get_it.dart';
import 'package:inno_net_app/features/authentication/domain/entities/user_entities.dart';
import 'package:inno_net_app/features/authentication/domain/repositories/auth_repo.dart';
import 'package:inno_net_app/features/authentication/data/repositories/auth_repo_implementation.dart';
import 'package:inno_net_app/features/authentication/domain/usecases/auth_usecases.dart';
import 'package:dio/dio.dart';
import 'package:inno_net_app/features/home/data/repositories/article_repo_implementaion.dart';
import 'package:inno_net_app/features/home/domain/repositories/article_repo.dart';

final locator = GetIt.instance;

/// [AuthRepoImplementation] is registered as a lazy singleton with the [GetIt] package
/// [FormFieldValidateClass] is registered as a lazy singleton with the [GetIt] package

class ServiceLocator {
  static void setupLocator() {
    final AuthRepository authRepository = AuthRepoImplementation();
    locator.registerFactory<AuthUseCases>(
        () => AuthUseCases(authRepository: authRepository));
    locator.registerLazySingleton(() => FormFieldValidateClass());
    locator.registerLazySingleton(() => authRepository);
    locator.registerSingleton<ArticleRepo>(ArticlesRepoImplementation());
    locator.registerSingleton<Dio>(Dio());
  }
}
