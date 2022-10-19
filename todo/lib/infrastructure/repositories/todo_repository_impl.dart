import 'package:dartz/dartz.dart';
import 'package:todo/core/failures/failures.dart';
import 'package:todo/domain/entities/todo/todo_entity.dart';
import 'package:todo/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  @override
  Stream<Either<List<TodoEntity>, Failure>> watchAll() {
    // TODO: implement watchAll
    throw UnimplementedError();
  }

  @override
  Future<Either<Unit, Failure>> create(TodoEntity todo) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Either<Unit, Failure>> delete(TodoEntity todo) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<Unit, Failure>> update(TodoEntity todo) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
