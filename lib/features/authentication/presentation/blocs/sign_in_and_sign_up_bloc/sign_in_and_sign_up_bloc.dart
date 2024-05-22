import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inno_net_app/core/failures/failures.dart';
import 'package:inno_net_app/features/authentication/domain/entities/user_entities.dart';
import 'package:inno_net_app/features/authentication/domain/usecases/auth_usecases.dart';
import 'package:inno_net_app/service_locator.dart';
part 'sign_in_and_sign_up_event.dart';
part 'sign_in_and_sign_up_state.dart';

///[SignInAndSignUpBloc] is a class that is used to handle the state management of the sign in and sign up screen.
///It extends the [Bloc] class of the flutter_bloc package
///It has a [SignInAndSignUpEvent] and [SignInAndSignUpState] as parameters
///It has a [SignInWithEmailAndPasswordEvent] class that takes in a [UserEntity] parameter
///This Bloc is used to handle the sign in and sign up process in the app.
///It has a [SignInAndSignUpBloc] constructor that takes in a [SignInAndSignUpEvent] and [SignInAndSignUpState]
///It has a [SignInAndSignUpInitial] state
///It has a [SignInAndSignUpLoadingState] state
///It has a [SignInAndSignUpFailureState] state that takes in a [Failure] parameter
///It has a [SignInAndSignUpSuccessState] state that takes in a [UserEntity] parameter
///It has a [SignInWithEmailAndPasswordEvent] event that takes in a [UserEntity] parameter
///It has a [SignInAndSignUpInitialEvent] event it is used to handle the initial state of the sign in and sign up screen.

class SignInAndSignUpBloc
    extends Bloc<SignInAndSignUpEvent, SignInAndSignUpState> {
  SignInAndSignUpBloc() : super(SignInAndSignUpInitial()) {
    on<SignInWithEmailAndPasswordEvent>((event, emit) async {
      emit(SignInAndSignUpLoadingState());

      final userEntity = UserEntity(
        email: event.email.trim(),
        password: event.password.trim(),
        name: "",
      );

      final result = await locator<AuthUseCases>().executeSignIn(
        Params(userEntity: userEntity),
      );
      // just to show the loading state for 5 seconds
      await Future.delayed(const Duration(seconds: 5));
      result.fold(
        (failure) => emit(SignInAndSignUpFailureState(failure: failure)),
        (userEntity) =>
            emit(SignInAndSignUpSuccessState(userEntity: userEntity)),
      );
    });

    on<SignInAndSignUpInitialEvent>(
      (event, emit) => emit(SignInAndSignUpInitial()),
    );
  }
}
