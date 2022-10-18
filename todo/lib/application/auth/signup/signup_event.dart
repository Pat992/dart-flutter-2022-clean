part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();
}

class RegisterWithEmailAndPasswordEvent extends SignupEvent {
  final String? email;
  final String? password;

  const RegisterWithEmailAndPasswordEvent({this.email, this.password});

  @override
  List<Object?> get props => [email, password];
}

class SignInWithEmailAndPasswordEvent extends SignupEvent {
  final String? email;
  final String? password;

  const SignInWithEmailAndPasswordEvent({this.email, this.password});

  @override
  List<Object?> get props => [email, password];
}
