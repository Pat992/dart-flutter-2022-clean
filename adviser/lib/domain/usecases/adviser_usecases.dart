import 'package:adviser/domain/entities/advise_entity.dart';
import 'package:adviser/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

class AdviserUseCases {
  Future<Either<AdviseEntity, Failure>> getAdvise() async {
    try {
      return Left(
          AdviseEntity(advise: 'This is an advise, it is an entity', id: 1));
    } catch (e) {
      return Right(ServerFailure());
    }
  }
}
