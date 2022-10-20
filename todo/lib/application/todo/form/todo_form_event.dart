part of 'todo_form_bloc.dart';

@immutable
abstract class TodoFormEvent {}

class TodoFormInitializeDetailPage extends TodoFormEvent {
  final TodoEntity? todo;
  TodoFormInitializeDetailPage({required this.todo});
}

class TodoFormColorChangedEvent extends TodoFormEvent {
  final Color color;

  TodoFormColorChangedEvent({required this.color});
}
