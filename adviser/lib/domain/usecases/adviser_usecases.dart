import 'package:adviser/domain/entities/advise_entity.dart';

class AdviserUseCases {
  Future<AdviseEntity> getAdvise() async {
    return AdviseEntity(advise: 'This is an advise, it is an entity', id: 1);
  }
}
