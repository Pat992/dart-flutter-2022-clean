part of 'controller_bloc.dart';

abstract class ControllerState extends Equatable {
  const ControllerState();
}

class ControllerInitial extends ControllerState {
  @override
  List<Object> get props => [];
}

class ControllerInProgressState extends ControllerState {
  @override
  List<Object> get props => [];
}

class ControllerSuccessState extends ControllerState {
  @override
  List<Object> get props => [];
}

class ControllerFailureState extends ControllerState {
  final Failure failure;

  const ControllerFailureState({required this.failure});
  @override
  List<Object> get props => [];
}
