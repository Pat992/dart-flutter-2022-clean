part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class SignOutEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}
