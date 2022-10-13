import 'package:adviser/application/adviser/adviser_bloc.dart';
import 'package:adviser/presentation/adviser/adviser_page.dart';
import 'package:adviser/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:adviser/injection.dart' as injection;
import 'package:adviser/injection.dart';

void main() async {
  // Only start app after dependency injection
  WidgetsFlutterBinding.ensureInitialized();
  // Run dependency injection
  await injection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      title: 'Adviser',
      home: BlocProvider(
        create: (context) => getIt<AdviserBloc>(),
        child: const AdviserPage(),
      ),
    );
  }
}
