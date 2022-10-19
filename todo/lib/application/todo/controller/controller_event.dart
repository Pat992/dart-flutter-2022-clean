part of 'controller_bloc.dart';

abstract class ControllerEvent extends Equatable {
  const ControllerEvent();
}

class DeleteTodoEvent extends ControllerEvent {
  final TodoEntity todo;
  const DeleteTodoEvent({required this.todo});

  @override
  List<Object?> get props => [];
}

class UpdateTodoEvent extends ControllerEvent {
  final TodoEntity todo;
  final bool done;
  const UpdateTodoEvent({required this.todo, required this.done});

  @override
  List<Object?> get props => [];
}
