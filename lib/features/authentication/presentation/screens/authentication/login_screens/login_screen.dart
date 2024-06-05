import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inno_net_app/core/constants/decorations_constants.dart';
import 'package:inno_net_app/core/extensions/custom_gesture_detector.dart';
import 'package:inno_net_app/core/extensions/page_navigation_extension.dart';
import 'package:inno_net_app/core/extensions/screen_size_extension.dart';
import 'package:inno_net_app/features/authentication/domain/entities/user_entities.dart';
import 'package:inno_net_app/features/authentication/presentation/blocs/sign_in_and_sign_up_bloc/sign_in_and_sign_up_bloc.dart';
import 'package:inno_net_app/features/authentication/presentation/screens/authentication/forgot_password_screens/forgot_password_email_verification_screen.dart';
import 'package:inno_net_app/features/authentication/presentation/screens/authentication/sign_up_screens/sign_up_screen.dart';
import 'package:inno_net_app/features/authentication/presentation/screens/authentication/widgets/sign_in_and_sign_up_prompt.dart';
import 'package:inno_net_app/features/common/base_screen.dart';
import 'package:inno_net_app/features/common/root_bottom_navigation_bar.dart';
import 'package:inno_net_app/service_locator.dart';
import 'package:inno_net_app/widgets/button_widget.dart';
import 'package:inno_net_app/widgets/custom_text_form_field.dart';
import 'package:inno_net_app/widgets/loading_button.dart';
import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  // text form fields
  late final textFormFields = [
    CustomTextFormField(
      controller: emailController,
      hintText: "Email",
      validator: locator<FormFieldValidateClass>().isValidEmail,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    ),
    CustomTextFormField(
      controller: passwordController,
      hintText: "Password",
      validator: locator<FormFieldValidateClass>().validatePassword,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    ),
  ];

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    formKey.currentState?.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        child: Form(
      key: formKey,
      child: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 25.h,
          50.h,
          Text(
            "InnoNet",
            style: Theme.of(context).textTheme.displayLarge,
          ).alignAtCenter(),
          50.h,
          // text form fields
          ListView.separated(
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) {
                return textFormFields[index];
              },
              separatorBuilder: (context, index) {
                return 25.h;
              },
              itemCount: 2),
          5.h,
          // forgot password text
          const Align(
            alignment: Alignment.topRight,
            child: Text(
              "Forgot Password?",
            ),
          ).customGestureDetector(
            onTap: () => context.pushWithTransition(
                const FgPasswordEmailVerificationScreen(),
                PageTransitionType.rightToLeftWithFade),
          ),
          25.h,
          // button to login
          BlocConsumer<SignInAndSignUpBloc, SignInAndSignUpState>(
            listener: (context, state) {
              if (state is SignInAndSignUpSuccessState) {
                context.pushReplacementWithTransition(
                    const RootBottomNavigationBar(), PageTransitionType.fade);
              }
            },
            builder: (context, state) {
              if (state is SignInAndSignUpLoadingState) {
                return const ButtonLoadingWidget();
              }
              return ButtonWidget(
                buttonText: "Log in",
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    debugPrint("Validated");

                    context.read<SignInAndSignUpBloc>().add(
                          SignInWithEmailAndPasswordEvent(
                              email: emailController.text,
                              password: passwordController.text),
                        );
                  }
                },
              );
            },
          ),
          20.h,
          // sign up text
          SignInAndSignUpPrompt(
            action: "Sign Up",
            instruction: "Don't have an account?",
            onTap: () => context.pushWithTransition(
                SignUpPage(), PageTransitionType.rightToLeftWithFade),
          ),
        ],
      ),
    ));
  }
}
