import 'package:get_it/get_it.dart';
import 'package:inno_net_app/features/authentication/domain/entities/user_entities.dart';
import 'package:inno_net_app/features/authentication/domain/repositories/auth_repo.dart';
import 'package:inno_net_app/features/authentication/domain/usecases/auth_usecases.dart';
import 'package:inno_net_app/features/authentication/data/repositories/auth_repo_implementation.dart';

final locator = GetIt.instance;

/// [AuthUseCases] is registered as a lazy singleton with the [GetIt] package
/// [AuthRepoImplementation] is registered as a lazy singleton with the [GetIt] package
/// [FormFieldValidateClass] is registered as a lazy singleton with the [GetIt] package
///
class ServiceLocator {
  static void setupLocator() {
    //
    final AuthRepository authRepository = AuthRepoImplementation();

    locator.registerLazySingleton(() => FormFieldValidateClass());

    locator.registerLazySingleton(() => AuthUseCases(
          repository: authRepository,
        ));
  }
}