import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/core/failures/failures.dart';
import 'package:todo/domain/repositories/auth_repository.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupFormState> {
  final AuthRepository authRepository;

  SignupBloc({required this.authRepository})
      : super(SignupFormState(
          isSubmitting: false,
          showValidationMessages: false,
          successOrFailure: none(),
        )) {
    on<SignInWithEmailAndPasswordEvent>((event, emit) async {
      if (event.email == null || event.password == null) {
        emit(state.copyWith(
          isSubmitting: false,
          showValidationMessages: true,
          successOrFailure: none(),
        ));
      } else {
        emit(state.copyWith(
          isSubmitting: true,
          showValidationMessages: false,
          successOrFailure: none(),
        ));

        final failureOrSuccess =
            await authRepository.signInWithEmailAndPassword(
                email: event.email!, password: event.password!);

        emit(state.copyWith(
          isSubmitting: false,
          successOrFailure: optionOf(failureOrSuccess),
        ));
      }
    });

    on<RegisterWithEmailAndPasswordEvent>((event, emit) async {
      if (event.email == null || event.password == null) {
        emit(state.copyWith(
          isSubmitting: false,
          showValidationMessages: true,
          successOrFailure: none(),
        ));
      } else {
        emit(state.copyWith(
          isSubmitting: true,
          showValidationMessages: false,
          successOrFailure: none(),
        ));

        final failureOrSuccess =
            await authRepository.registerWithEmailAndPassword(
                email: event.email!, password: event.password!);

        emit(state.copyWith(
          isSubmitting: false,
          successOrFailure: optionOf(failureOrSuccess),
        ));
      }
    });
  }
}
