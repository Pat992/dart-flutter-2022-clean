part of 'signup_bloc.dart';

class SignupFormState extends Equatable {
  final bool isSubmitting;
  final bool showValidationMessages;
  // Options can receive none() or some()
  final Option<Either<Unit, Failure>> successOrFailure;

  const SignupFormState({
    required this.isSubmitting,
    required this.showValidationMessages,
    required this.successOrFailure,
  });

  @override
  List<Object?> get props => [isSubmitting, showValidationMessages];

  SignupFormState copyWith(
      {bool? isSubmitting,
      bool? showValidationMessages,
      Option<Either<Unit, Failure>>? successOrFailure}) {
    return SignupFormState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      showValidationMessages:
          showValidationMessages ?? this.showValidationMessages,
      successOrFailure: successOrFailure ?? this.successOrFailure,
    );
  }
}
