import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/core/failures/failures.dart';
import 'package:todo/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth firebaseAuth;

  AuthRepositoryImpl({required this.firebaseAuth});

  @override
  Future<Either<Unit, Failure>> registerWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return left(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return right(EmailAlreadyInUseFailure());
      }
      return right(AuthFailure());
    } catch (e) {
      return right(AuthFailure());
    }
  }

  @override
  Future<Either<Unit, Failure>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return left(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        return right(InvalidEmailOrPasswordFailure());
      }
      return right(AuthFailure());
    } catch (e) {
      return right(AuthFailure());
    }
  }
}
