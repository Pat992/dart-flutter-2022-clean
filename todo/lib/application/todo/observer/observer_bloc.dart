import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/core/failures/failures.dart';
import 'package:todo/domain/entities/todo/todo_entity.dart';
import 'package:todo/domain/repositories/todo_repository.dart';

part 'observer_event.dart';
part 'observer_state.dart';

class ObserverBloc extends Bloc<ObserverEvent, ObserverState> {
  final TodoRepository todoRepository;

  // use controller to prevent huge amount of opening listeners
  // Also necessary since bloc is a factory -> streams would still be open if bloc is closed
  StreamSubscription<Either<List<TodoEntity>, Failure>>? _streamSubscription;

  ObserverBloc({required this.todoRepository}) : super(ObserverInitial()) {
    on<ObserveAllEvent>((event, emit) async {
      // If already an existing subscription, then close VERY IMPORTANT for performance
      await _streamSubscription?.cancel();

      emit(ObserverLoadingState());

      // Stream listener
      _streamSubscription = todoRepository.watchAll().listen((todosOrFailure) {
        // Call another Event
        add(ObserveTodosUpdatedEvent(todosOrFailure: todosOrFailure));
      });
    });

    on<ObserveTodosUpdatedEvent>((event, emit) {
      event.todosOrFailure.fold(
        (todos) => emit(ObserverSuccessState(todos: todos)),
        (failure) => emit(ObserverFailureState(failure: failure)),
      );
    });
  }

  // Close listener when bloc is closed VERY IMPORTANT -> override existing close function
  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();
    super.close();
  }
}
