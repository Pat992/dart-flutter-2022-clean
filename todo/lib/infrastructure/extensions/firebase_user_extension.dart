import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/domain/entities/auth/id_entity.dart';
import 'package:todo/domain/entities/auth/user_entity.dart';

extension FirebaseUserModel on User {
  UserEntity toDomain() {
    return UserEntity(id: IdEntity.fromUniqueString(uid));
  }
}
