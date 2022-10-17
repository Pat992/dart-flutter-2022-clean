import 'package:adviser/domain/failures/failures.dart';
import 'package:adviser/domain/repositories/theme_repository.dart';
import 'package:adviser/infrastructure/datasources/theme_local_datasource.dart';
import 'package:dartz/dartz.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeLocalDatasource themeLocalDatasource;

  ThemeRepositoryImpl({required this.themeLocalDatasource});

  @override
  Future<Either<bool, Failure>> getTheme() async {
    try {
      final themeMode = await themeLocalDatasource.getThemeData();
      return Left(themeMode);
    } catch (e) {
      return Right(CacheFailure());
    }
  }

  @override
  Future<void> setTheme({required bool themeMode}) {
    return themeLocalDatasource.setThemeData(mode: themeMode);
  }

  @override
  Future<Either<bool, Failure>> getUseSystemTheme() async {
    try {
      final useSystemTheme = await themeLocalDatasource.getUseSystemTheme();
      return Left(useSystemTheme);
    } catch (e) {
      return Right(CacheFailure());
    }
  }

  @override
  Future<void> setUseSystemTheme({required bool useSystemTheme}) {
    return themeLocalDatasource.setThemeData(mode: useSystemTheme);
  }
}
