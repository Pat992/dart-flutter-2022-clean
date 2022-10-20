part of 'observer_bloc.dart';

abstract class ObserverEvent {
  const ObserverEvent();
}

class ObserveAllEvent extends ObserverEvent {}

class ObserveUpdateEvent extends ObserverEvent {}

// Call from the Bloc itself
class ObserveTodosUpdatedEvent extends ObserverEvent {
  final Either<List<TodoEntity>, Failure> todosOrFailure;

  const ObserveTodosUpdatedEvent({required this.todosOrFailure});
}
