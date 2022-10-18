part of 'signup_bloc.dart';

class SignupFormState extends Equatable {
  final bool isSubmitting;
  final bool showValidationMessages;

  const SignupFormState(
      {required this.isSubmitting, required this.showValidationMessages});

  @override
  List<Object?> get props => [isSubmitting, showValidationMessages];

  SignupFormState copyWith({bool? isSubmitting, bool? showValidationMessages}) {
    return SignupFormState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      showValidationMessages:
          showValidationMessages ?? this.showValidationMessages,
    );
  }
}
