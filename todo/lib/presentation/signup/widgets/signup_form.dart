import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/application/auth/signup/signup_bloc.dart';
import 'package:todo/core/failures/failures.dart';
import 'package:todo/core/validators/email_validator.dart';
import 'package:todo/core/validators/password_validator.dart';
import 'package:todo/presentation/core/custom_button.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    late String email;
    late String password;

    String? validateEmail(String? input) {
      final res = emailValidator(input);
      if (res == null) {
        email = input!;
        return null;
      }
      return res;
    }

    String? validatePassword(String? input) {
      final res = passwordValidator(input);
      if (res == null) {
        password = input!;
        return null;
      }
      return res;
    }

    String mapFailureMessage(Failure failure) {
      switch (failure.runtimeType) {
        case InvalidEmailOrPasswordFailure:
          return 'Email or Password wrong';
        case EmailAlreadyInUseFailure:
          return 'Email already in use';
        case ServerFailure:
        default:
          return 'Something went wrong, try again later.';
      }
    }

    return BlocConsumer<SignupBloc, SignupFormState>(
      listener: (context, state) {
        state.successOrFailure.fold(
          () => {},
          (eitherSuccessOrFailure) => eitherSuccessOrFailure.fold(
            (success) => print('logged in'),
            (failure) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.redAccent,
                content: Text(
                  mapFailureMessage(failure),
                  style: themeData.textTheme.bodyText1,
                ),
              ),
            ),
          ),
        );
        // TODO: Navigate to homepage
        // TODO: Show error if unsuccessful
      },
      builder: (context, state) {
        return Form(
          autovalidateMode: state.showValidationMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView(
              children: <Widget>[
                const SizedBox(height: 80),
                Text(
                  'Welcome',
                  textAlign: TextAlign.center,
                  style: themeData.textTheme.headline1?.copyWith(
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 4,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Please register or sign in',
                  textAlign: TextAlign.center,
                  style: themeData.textTheme.headline1?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 4,
                  ),
                ),
                const SizedBox(height: 80),
                TextFormField(
                  validator: validateEmail,
                  cursorColor: themeData.textTheme.headline1?.color,
                  decoration: const InputDecoration(label: Text('E-Mail')),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  validator: validatePassword,
                  cursorColor: themeData.textTheme.headline1?.color,
                  obscureText: true,
                  decoration: const InputDecoration(label: Text('Password')),
                ),
                const SizedBox(height: 40),
                CustomButton(
                  text: 'Sign in',
                  callback: () {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<SignupBloc>(context).add(
                          SignInWithEmailAndPasswordEvent(
                              email: email, password: password));
                    } else {
                      BlocProvider.of<SignupBloc>(context).add(
                          const SignInWithEmailAndPasswordEvent(
                              email: null, password: null));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.redAccent,
                          content: Text(
                            'Invalid inputs',
                            style: themeData.textTheme.bodyText1,
                          ),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'Register',
                  callback: () {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<SignupBloc>(context).add(
                          RegisterWithEmailAndPasswordEvent(
                              email: email, password: password));
                    } else {
                      BlocProvider.of<SignupBloc>(context).add(
                          const RegisterWithEmailAndPasswordEvent(
                              email: null, password: null));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.redAccent,
                          content: Text(
                            'Invalid inputs',
                            style: themeData.textTheme.bodyText1,
                          ),
                        ),
                      );
                    }
                  },
                ),
                // Three dots for multiple widgets in a if-statement
                if (state.isSubmitting) ...[
                  const SizedBox(height: 10),
                  LinearProgressIndicator(
                      color: themeData.colorScheme.secondary),
                ]
              ],
            ),
          ),
        );
      },
    );
  }
}
