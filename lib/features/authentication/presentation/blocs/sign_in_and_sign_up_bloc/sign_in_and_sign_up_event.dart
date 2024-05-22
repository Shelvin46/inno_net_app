part of 'sign_in_and_sign_up_bloc.dart';

///[SignInAndSignUpEvent] is a class that is used to handle events in the [SignInAndSignUpBloc]
///It extends the [Equatable] class
///It has a [SignInWithEmailAndPasswordEvent] class that takes in a [UserEntity] parameter
///Through this event the user can sign in the app.
sealed class SignInAndSignUpEvent extends Equatable {
  const SignInAndSignUpEvent();

  @override
  List<Object> get props => [];
}

class SignInWithEmailAndPasswordEvent extends SignInAndSignUpEvent {
  final String email;
  final String password;

  const SignInWithEmailAndPasswordEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class SignInAndSignUpInitialEvent extends SignInAndSignUpEvent {
  const SignInAndSignUpInitialEvent();

  @override
  List<Object> get props => [];
}
