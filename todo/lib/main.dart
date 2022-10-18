import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo/application/auth/auth_bloc.dart';
import 'package:todo/application/auth/signup/signup_bloc.dart';
import 'package:todo/presentation/routes/router.gr.dart' as r;
import 'package:todo/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/injection.dart' as injection;
import 'package:todo/injection.dart';

void main() async {
  // Only start app after dependency injection
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize firebase
  await Firebase.initializeApp();
  // Run dependency injection
  await injection.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = r.AppRouter();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<SignupBloc>()),
        BlocProvider(create: (context) => getIt<AuthBloc>()),
      ],
      child: MaterialApp.router(
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(),
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        title: 'Todo',
      ),
    );
  }
}
