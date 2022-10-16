part of 'adviser_bloc.dart';

@immutable
abstract class AdviserState with EquatableMixin {}

class AdviserInitial extends AdviserState {
  @override
  List<Object?> get props => [];
}

class AdviserStateLoading extends AdviserState {
  @override
  List<Object?> get props => [];
}

class AdviserStateLoaded extends AdviserState {
  final String advise;
  AdviserStateLoaded({required this.advise});

  @override
  List<Object?> get props => [advise];
}

class AdviserStateError extends AdviserState {
  final String errorMessage;
  AdviserStateError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
