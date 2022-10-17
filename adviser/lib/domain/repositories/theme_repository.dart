import 'package:adviser/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ThemeRepository {
  Future<Either<bool, Failure>> getTheme();
  Future<void> setTheme({required bool themeMode});
  Future<Either<bool, Failure>> getUseSystemTheme();
  Future<void> setUseSystemTheme({required bool useSystemTheme});
}
