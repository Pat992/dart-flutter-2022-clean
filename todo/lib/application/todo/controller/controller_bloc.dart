import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/core/failures/failures.dart';
import 'package:todo/domain/entities/todo/todo_entity.dart';
import 'package:todo/domain/repositories/todo_repository.dart';

part 'controller_event.dart';
part 'controller_state.dart';

class ControllerBloc extends Bloc<ControllerEvent, ControllerState> {
  final TodoRepository todoRepository;

  ControllerBloc({required this.todoRepository}) : super(ControllerInitial()) {
    on<DeleteTodoEvent>((event, emit) async {
      emit(ControllerInProgressState());

      final successOrFailure = await todoRepository.delete(event.todo);

      successOrFailure.fold(
        (success) => emit(ControllerSuccessState()),
        (failure) => emit(ControllerFailureState(failure: failure)),
      );
    });

    on<UpdateTodoEvent>((event, emit) async {
      emit(ControllerInProgressState());

      final successOrFailure =
          await todoRepository.update(event.todo.copyWith(done: event.done));

      successOrFailure.fold(
        (success) => emit(ControllerSuccessState()),
        (failure) => emit(ControllerFailureState(failure: failure)),
      );
    });
  }
}
