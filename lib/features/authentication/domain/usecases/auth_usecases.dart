import 'package:dartz/dartz.dart';
// import 'package:injectable/injectable.dart';
import 'package:inno_net_app/features/authentication/domain/entities/user_entities.dart';
import 'package:inno_net_app/core/failures/failures.dart';
import 'package:inno_net_app/features/authentication/domain/repositories/auth_repo.dart';

///[AuthUseCases] is a class that is used to register a user with email and password.
///It takes in a [repository] parameter
///It has an [executeSignUp] method that returns a [UserEntity] if the user is registered successfully
///It has a [Failure] if the user is not registered successfully
///It has a [repository] parameter of type [AuthRepository]
///It has a [UserEntity] parameter
///It has a [Either] parameter of type [Failure] and [UserEntity]
// @injectable
class AuthUseCases {
  final AuthRepository repository;

  AuthUseCases({required this.repository});

  ///[executeSignUp] is a method that is used to register a user with email and password.
  Future<Either<Failure, UserEntity>> executeSignUp(
    UserEntity userEntity,
  ) {
    return repository.registerWithEmailAndPassword(userEntity);
  }
}
