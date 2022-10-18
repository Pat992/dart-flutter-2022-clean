import 'package:dartz/dartz.dart';
import 'package:todo/core/failures/failures.dart';

abstract class AuthRepository {
  Future<Either<Unit, Failure>> registerWithEmailAndPassword(
      {required String email, required String password});

  Future<Either<Unit, Failure>> signInWithEmailAndPassword(
      {required String email, required String password});

  Future<void> signOut();
}
