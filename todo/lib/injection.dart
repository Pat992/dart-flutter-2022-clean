import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:todo/application/auth/auth_bloc.dart';
import 'package:todo/application/auth/signup/signup_bloc.dart';
import 'package:todo/application/todo/controller/controller_bloc.dart';
import 'package:todo/application/todo/form/todo_form_bloc.dart';
import 'package:todo/application/todo/observer/observer_bloc.dart';
import 'package:todo/domain/repositories/auth_repository.dart';
import 'package:todo/domain/repositories/todo_repository.dart';
import 'package:todo/infrastructure/repositories/auth_repository_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/infrastructure/repositories/todo_repository_impl.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //! Blocs -> registerFactory will create a new instance on each call
  getIt.registerFactory(() => SignupBloc(authRepository: getIt()));
  getIt.registerFactory(() => AuthBloc(authRepository: getIt()));
  getIt.registerFactory(() => ObserverBloc(todoRepository: getIt()));
  getIt.registerFactory(() => ControllerBloc(todoRepository: getIt()));
  getIt.registerFactory(() => TodoFormBloc(todoRepository: getIt()));

  //! Use cases

  //! Repositories
  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(firebaseAuth: getIt()));
  getIt.registerLazySingleton<TodoRepository>(
      () => TodoRepositoryImpl(fireStore: getIt()));

  //! Data sources

  //! Extern
  final firebaseAuth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  getIt.registerLazySingleton(() => firebaseAuth);
  getIt.registerLazySingleton(() => fireStore);
}
