import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:todo/core/failures/failures.dart';
import 'package:todo/domain/entities/todo/color_entity.dart';
import 'package:todo/domain/entities/todo/todo_entity.dart';
import 'package:todo/domain/repositories/todo_repository.dart';

part 'todo_form_event.dart';
part 'todo_form_state.dart';

class TodoFormBloc extends Bloc<TodoFormEvent, TodoFormState> {
  final TodoRepository todoRepository;

  TodoFormBloc({required this.todoRepository})
      : super(TodoFormState.initial()) {
    on<TodoFormInitializeDetailPage>((event, emit) {
      if (event.todo != null) {
        emit(state.copyWith(todo: event.todo, isEditing: true));
      } else {
        emit(state);
      }
    });

    on<TodoFormColorChangedEvent>((event, emit) {
      emit(
        state.copyWith(
          todo: state.todo.copyWith(
            color: ColorEntity(color: event.color),
          ),
        ),
      );
    });

    on<TodoFormSaveEvent>((event, emit) async {
      Either<Unit, Failure>? successOrFailure;
      emit(state.copyWith(isSaving: true, successOrFailureOption: none()));
      if (event.title != null && event.body != null) {
        final editedTodo =
            state.todo.copyWith(title: event.title, body: event.body);

        if (state.isEditing) {
          successOrFailure = await todoRepository.update(editedTodo);
        } else {
          successOrFailure = await todoRepository.create(editedTodo);
        }
      }

      emit(
        state.copyWith(
          isSaving: false,
          showErrorMessages: true,
          successOrFailureOption: optionOf(successOrFailure),
        ),
      );
    });
  }
}
