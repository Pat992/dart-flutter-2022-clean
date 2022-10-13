import 'package:adviser/application/adviser/adviser_bloc.dart';
import 'package:adviser/domain/repositories/adviser_repository.dart';
import 'package:adviser/domain/usecases/adviser_usecases.dart';
import 'package:adviser/infrastructure/datasources/adviser_remote_datasource.dart';
import 'package:adviser/infrastructure/repositories/adviser_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

Future<void> init() async {
  //! Blocs
  getIt.registerFactory(() => AdviserBloc(useCases: getIt()));

  //! Use cases -> Singleton will not create new objects, since they do not have a state, lazy creates only when needed
  getIt
      .registerLazySingleton(() => AdviserUseCases(adviserRepository: getIt()));

  //! Repositories
  getIt.registerLazySingleton<AdviserRepository>(
      () => AdviserRepositoryImpl(remoteDataSource: getIt()));

  //! Data sources
  getIt.registerLazySingleton<AdviserRemoteDatasource>(
      () => AdviserRemoteDatasourceImpl(client: getIt()));

  //! Extern
  getIt.registerLazySingleton(() => http.Client());
}
