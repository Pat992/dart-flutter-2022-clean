import 'package:get_it/get_it.dart';
import 'package:todo/application/auth/signup/signup_bloc.dart';
import 'package:todo/domain/repositories/auth_repository.dart';
import 'package:todo/infrastructure/repositories/auth_repository_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //! Blocs -> registerFactory will create a new instance on each call
  getIt.registerFactory(() => SignupBloc(authRepository: getIt()));

  //! Use cases

  //! Repositories
  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(firebaseAuth: getIt()));

  //! Data sources

  //! Extern
  final firebaseAuth = FirebaseAuth.instance;
  getIt.registerLazySingleton(() => firebaseAuth);
}
