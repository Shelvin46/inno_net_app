import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:inno_net_app/core/failures/failures.dart';
import 'package:inno_net_app/features/authentication/domain/entities/user_entities.dart';
import 'package:inno_net_app/features/authentication/domain/repositories/auth_repo.dart';

///[AuthUseCases] is a class that is used to login a user with email and password.
///It has a [Failure] if the user is not logged in successfully
///It has a [UserEntity] parameter
///It has a [Either] parameter of type [Failure] and [UserEntity]

class AuthUseCases {
  final AuthRepository authRepository;

  AuthUseCases({required this.authRepository});

  Future<Either<Failure, UserEntity>> executeSignIn(Params params) async {
    return await authRepository.signInWithEmailAndPassword(params.userEntity);
  }
}

///[Params] is a class that is used to pass the [UserEntity] parameter to the [AuthUseCases] class
class Params extends Equatable {
  final UserEntity userEntity;

  const Params({required this.userEntity});

  @override
  List<Object> get props => [userEntity];
}
