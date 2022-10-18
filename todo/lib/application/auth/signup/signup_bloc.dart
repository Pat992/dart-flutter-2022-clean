import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/domain/repositories/auth_repository.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupFormState> {
  final AuthRepository authRepository;

  SignupBloc({required this.authRepository})
      : super(const SignupFormState(
            isSubmitting: false, showValidationMessages: false)) {
    on<SignInWithEmailAndPasswordEvent>((event, emit) {
      if (event.email == null || event.password == null) {
        emit(state.copyWith(isSubmitting: false, showValidationMessages: true));
      } else {
        emit(state.copyWith(isSubmitting: true, showValidationMessages: false));
      }
    });

    on<RegisterWithEmailAndPasswordEvent>((event, emit) {
      if (event.email == null || event.password == null) {
        emit(state.copyWith(isSubmitting: false, showValidationMessages: true));
      } else {
        emit(state.copyWith(isSubmitting: true, showValidationMessages: false));
      }
    });
  }
}
