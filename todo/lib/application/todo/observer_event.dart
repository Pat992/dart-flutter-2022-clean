part of 'observer_bloc.dart';

abstract class ObserverEvent extends Equatable {
  const ObserverEvent();
}

class ObserveAllEvent extends ObserverEvent {
  @override
  List<Object?> get props => [];
}

// Call from the Bloc itself
class ObserveTodosUpdatedEvent extends ObserverEvent {
  final Either<List<TodoEntity>, Failure> todosOrFailure;

  const ObserveTodosUpdatedEvent({required this.todosOrFailure});
  @override
  List<Object?> get props => [];
}
