import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/core/errors/errors.dart';
import 'package:todo/domain/repositories/auth_repository.dart';
import 'package:todo/injection.dart';

extension FirestoreExtension on FirebaseFirestore {
  Future<DocumentReference> userDocument() async {
    final userOption = getIt<AuthRepository>().getSignedIn();

    final user = userOption.getOrElse(() => throw NotAuthenticatedError());

    return FirebaseFirestore.instance.collection('users').doc(user.id.value);
  }
}

extension DocumentReferenceEtension on DocumentReference {
  CollectionReference<Map<String, dynamic>> get todoCollection =>
      collection('todos');
}
