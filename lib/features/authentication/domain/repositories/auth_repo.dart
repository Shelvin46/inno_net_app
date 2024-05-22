import 'package:dartz/dartz.dart';
import 'package:inno_net_app/features/authentication/domain/entities/user_entities.dart';
import 'package:inno_net_app/core/failures/failures.dart';

///[AuthRepository] is an abstract class that is used to register a user with email and password.
///It is used to register a user with email and password.
///It has a [registerWithEmailAndPassword] method that returns a [UserEntity] if the user is registered successfully
///It has a [Failure] if the user is not registered successfully

abstract class AuthRepository {
  ///[registerWithEmailAndPassword] is a method that is used to register a user with email and password.
  Future<Either<Failure, UserEntity>> registerWithEmailAndPassword(
    UserEntity userEntity,
  );

  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    UserEntity userEntity,
  );
}
