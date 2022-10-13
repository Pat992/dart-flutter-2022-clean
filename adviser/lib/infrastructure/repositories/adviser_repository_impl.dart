import 'package:adviser/domain/entities/advise_entity.dart';
import 'package:adviser/domain/failures/failures.dart';
import 'package:adviser/domain/repositories/adviser_repository.dart';
import 'package:adviser/infrastructure/datasources/adviser_remote_datasource.dart';
import 'package:adviser/infrastructure/exceptions/exceptions.dart';
import 'package:dartz/dartz.dart';

class AdviserRepositoryImpl implements AdviserRepository {
  final AdviserRemoteDatasource remoteDataSource;

  AdviserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<AdviseEntity, Failure>> getAdviseFromApi() async {
    try {
      final remoteAdvise = await remoteDataSource.get();
      return Left(remoteAdvise);
    } on ServerException catch (_) {
      return Right(ServerFailure());
    } catch (_) {
      return Right(GeneralFailure());
    }
  }
}
