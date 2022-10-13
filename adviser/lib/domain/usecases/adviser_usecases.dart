import 'package:adviser/domain/entities/advise_entity.dart';
import 'package:adviser/domain/failures/failures.dart';
import 'package:adviser/domain/repositories/adviser_repository.dart';
import 'package:dartz/dartz.dart';

class AdviserUseCases {
  final AdviserRepository adviserRepository;

  AdviserUseCases({required this.adviserRepository});

  Future<Either<AdviseEntity, Failure>> getAdvise() async {
    return await adviserRepository.getAdviseFromApi();
  }
}
