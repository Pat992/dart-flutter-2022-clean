part of 'observer_bloc.dart';

abstract class ObserverState extends Equatable {
  const ObserverState();
}

class ObserverInitial extends ObserverState {
  @override
  List<Object> get props => [];
}

class ObserverLoadingState extends ObserverState {
  @override
  List<Object?> get props => [];
}

class ObserverFailureState extends ObserverState {
  final Failure failure;

  const ObserverFailureState({required this.failure});

  @override
  List<Object?> get props => [];
}

class ObserverSuccessState extends ObserverState {
  final List<TodoEntity> todos;

  const ObserverSuccessState({required this.todos});

  @override
  List<Object?> get props => [];
}
