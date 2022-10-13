import 'package:adviser/domain/entities/advise_entity.dart';
import 'package:adviser/domain/failures/failures.dart';
import 'package:adviser/domain/repositories/adviser_repository.dart';
import 'package:adviser/infrastructure/repositories/adviser_repository_impl.dart';
import 'package:dartz/dartz.dart';

class AdviserUseCases {
  final AdviserRepository _adviserRepository = AdviserRepositoryImpl();

  Future<Either<AdviseEntity, Failure>> getAdvise() async {
    return await _adviserRepository.getAdviseFromApi();
  }
}
