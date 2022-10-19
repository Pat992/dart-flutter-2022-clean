import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:todo/core/failures/failures.dart';
import 'package:todo/domain/entities/todo/todo_entity.dart';
import 'package:todo/domain/repositories/todo_repository.dart';
import 'package:todo/infrastructure/extensions/firebase_helpers.dart';
import 'package:todo/infrastructure/models/todo_model.dart';

class TodoRepositoryImpl implements TodoRepository {
  final FirebaseFirestore fireStore;

  TodoRepositoryImpl({required this.fireStore});

  @override
  Stream<Either<List<TodoEntity>, Failure>> watchAll() async* {
    final userDoc = await fireStore.userDocument();

    yield* userDoc.todoCollection
        .snapshots()
        .map((snapshot) => left<List<TodoEntity>, Failure>(snapshot.docs
            .map((doc) => TodoModel.fromFireStore(doc).toDomain())
            .toList()))
        .handleError((e) {
      if (e is FirebaseException) {
        if (e.code.contains('permission-denied') ||
            e.code.contains('PERMISSION_DENIED')) {
          return right<List<TodoEntity>, Failure>(
              InsufficientPermissionsFailure());
        } else {
          return right<List<TodoEntity>, Failure>(UnexpectedFailure());
        }
      } else {
        return right<List<TodoEntity>, Failure>(UnexpectedFailure());
      }
    });
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
