import 'package:get_it/get_it.dart';
import 'package:inno_net_app/core/entities/user_entities.dart';

final locator = GetIt.instance;

class ServiceLocator {
  static void setupLocator() {
    locator.registerLazySingleton(() => UserEntities());
  }
}
