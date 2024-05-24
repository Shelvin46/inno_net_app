import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inno_net_app/features/authentication/domain/entities/user_entities.dart';
import 'package:inno_net_app/features/authentication/domain/usecases/auth_usecases.dart';
import 'package:inno_net_app/features/authentication/presentation/blocs/sign_in_and_sign_up_bloc/sign_in_and_sign_up_bloc.dart';

import 'package:mockito/mockito.dart';

class MockAuthUsecase extends Mock implements AuthUseCases {}

// final mockAuthUseCases = AuthUseCases(authRepository: );
void main() {
  group("SignIn Bloc", () {
    late SignInAndSignUpBloc signInAndSignUpBloc;
    late MockAuthUsecase mockAuthUseCases;

    const userEntity = UserEntity(
        name: "", email: "shelvinvarghese6@gmail.com", password: "Qwerty@123");
    const params = Params(userEntity: userEntity);

    setUp(() {
      // final repository = AuthRepoImplementation();
      mockAuthUseCases = MockAuthUsecase();
      signInAndSignUpBloc = SignInAndSignUpBloc();
    });

    blocTest<SignInAndSignUpBloc, SignInAndSignUpState>(
      'emits [SignInAndSignUpLoadingState, SignInAndSignUpSuccessState] when SignInWithEmailAndPasswordEvent is added and signIn is successful',
      build: () {
        when(mockAuthUseCases.executeSignIn(params)).thenAnswer((_) async =>
            Right(UserEntity(
                email: userEntity.email ?? "",
                password: userEntity.password ?? "",
                name: userEntity.name ?? "")));
        return signInAndSignUpBloc;
      },
      act: (bloc) => bloc.add(SignInWithEmailAndPasswordEvent(
          email: userEntity.email ?? "", password: userEntity.password ?? "")),
      wait: const Duration(seconds: 5),
      expect: () => [
        SignInAndSignUpLoadingState(),
        const SignInAndSignUpSuccessState(userEntity: userEntity),
      ],
    );
  });

  // blocTest<SignInAndSignUpBloc, SignInAndSignUpState>(
  //   'emits [SignInAndSignUpLoadingState, SignInAndSignUpFailureState] when SignInWithEmailAndPasswordEvent is added and signIn fails',
  //   build: () {
  //     when(mockAuthUseCases.executeSignIn(any)).thenAnswer(
  //         (_) async => const Left(Failure(message: "Invalid Credentials")));
  //     return signInAndSignUpBloc;
  //   },
  //   act: (bloc) => bloc.add(
  //       const SignInWithEmailAndPasswordEvent('test@test.com', 'password')),
  //   wait: const Duration(seconds: 5),
  //   expect: () => [
  //     SignInAndSignUpLoadingState(),
  //     const SignInAndSignUpFailureState(Failure(message: "")),
  //   ],
  // );
}
