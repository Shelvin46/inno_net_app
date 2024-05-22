part of 'sign_in_and_sign_up_bloc.dart';

///[SignInAndSignUpState] is a class states that is used to handle the state management of the sign in and sign up screen.
///It extends the [Equatable] class
///It has a [SignInAndSignUpInitial] class that is used to handle the initial state of the sign in and sign up screen.
///It has a [SignInAndSignUpLoadingState] class that is used to handle the loading state of the sign in and sign up screen.
///It has a [SignInAndSignUpSuccessState] class that is used to handle the success state of the sign in and sign up screen.
///It has a [SignInAndSignUpFailureState] class that is used to handle the failure state of the sign in and sign up screen.
sealed class SignInAndSignUpState extends Equatable {
  const SignInAndSignUpState();

  @override
  List<Object> get props => [];
}

final class SignInAndSignUpInitial extends SignInAndSignUpState {}

final class SignInAndSignUpLoadingState extends SignInAndSignUpState {}

final class SignInAndSignUpSuccessState extends SignInAndSignUpState {
  final UserEntity userEntity;

  const SignInAndSignUpSuccessState({
    required this.userEntity,
  });

  @override
  List<Object> get props => [userEntity];
}

final class SignInAndSignUpFailureState extends SignInAndSignUpState {
  final Failure failure;

  const SignInAndSignUpFailureState({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}
