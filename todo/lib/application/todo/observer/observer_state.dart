part of 'observer_bloc.dart';

abstract class ObserverState {
  const ObserverState();
}

class ObserverInitial extends ObserverState {}

class ObserverLoadingState extends ObserverState {}

class ObserverFailureState extends ObserverState {
  final Failure failure;

  const ObserverFailureState({required this.failure});
}

class ObserverSuccessState extends ObserverState {
  final List<TodoEntity> todos;

  const ObserverSuccessState({required this.todos});
}
