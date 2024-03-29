part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthStateAuthenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthStateUnauthenticated extends AuthState {
  @override
  List<Object?> get props => [];
}
