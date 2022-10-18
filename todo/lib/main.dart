import 'package:flutter/material.dart';
import 'package:todo/application/auth/signup/signup_bloc.dart';
import 'package:todo/presentation/signup/signup_page.dart';
import 'package:todo/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/injection.dart' as injection;
import 'package:todo/injection.dart';

void main() async {
  // Only start app after dependency injection
  WidgetsFlutterBinding.ensureInitialized();
  // Run dependency injection
  await injection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => getIt<SignupBloc>())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        title: 'Todo',
        home: const SignupPage(),
      ),
    );
  }
}
