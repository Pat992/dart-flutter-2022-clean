import 'package:uuid/uuid.dart';

class IdEntity {
  final String value;

  const IdEntity._(this.value);

  factory IdEntity() {
    return IdEntity._(const Uuid().v1());
  }

  factory IdEntity.fromUniqueString(String uniqueId) {
    return IdEntity._(uniqueId);
  }
}
