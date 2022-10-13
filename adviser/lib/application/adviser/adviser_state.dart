part of 'adviser_bloc.dart';

@immutable
abstract class AdviserState {}

class AdviserInitial extends AdviserState {}

class AdviserStateLoading extends AdviserState {}

class AdviserStateLoaded extends AdviserState {
  final String advise;
  AdviserStateLoaded({required this.advise});
}

class AdviserStateError extends AdviserState {
  final String errorMessage;
  AdviserStateError({required this.errorMessage});
}
