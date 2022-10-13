import 'package:adviser/domain/entities/advise_entity.dart';
import 'package:adviser/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AdviserRepository {
  Future<Either<AdviseEntity, Failure>> getAdviseFromApi();
}
