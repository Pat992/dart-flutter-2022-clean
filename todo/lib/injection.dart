import 'package:get_it/get_it.dart';
import 'package:todo/application/auth/signup/signup_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //! Blocs -> registerFactory will create a new instance on each call
  getIt.registerFactory(() => SignupBloc());

  //! Use cases

  //! Repositories

  //! Data sources

  //! Extern
}
