import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:inno_net_app/features/authentication/domain/entities/user_entities.dart';
import 'package:inno_net_app/core/failures/failures.dart';
import 'package:inno_net_app/features/authentication/domain/repositories/auth_repo.dart';

///[AuthRepoImplementation] is a class that is used to register a user with email and password.
///It implements the [AuthRepository] abstract class
///It has a [registerWithEmailAndPassword] method that returns a [UserEntity] if the user is registered successfully
///It has a [Failure] if the user is not registered successfully

class AuthRepoImplementation implements AuthRepository {
  @override
  Future<Either<Failure, UserEntity>> registerWithEmailAndPassword(
      UserEntity userEntity) async {
    // api call will happen here
    return Right(userEntity);
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      UserEntity userEntity) async {
    // api call will happen here
    try {
      if (userEntity.email == "shelvinvarghese6@gmail.com" &&
          userEntity.password == "Qwerty@123") {
        return Right(userEntity);
      } else {
        return const Left(Failure(message: "Invalid Credentials"));
      }
    } catch (e) {
      log(e.toString(), name: "Inside the catch block");
      return const Left(Failure(message: "Server Error"));
    }
  }
}
