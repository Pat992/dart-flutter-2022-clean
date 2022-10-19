import 'package:dartz/dartz.dart';
import 'package:todo/core/failures/failures.dart';
import 'package:todo/domain/entities/todo/todo_entity.dart';

abstract class TodoRepository {
  Stream<Either<List<TodoEntity>, Failure>> watchAll();

  Future<Either<Unit, Failure>> create(TodoEntity todo);

  Future<Either<Unit, Failure>> update(TodoEntity todo);

  Future<Either<Unit, Failure>> delete(TodoEntity todo);
}
