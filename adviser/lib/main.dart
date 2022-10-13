import 'package:adviser/application/adviser/adviser_bloc.dart';
import 'package:adviser/presentation/adviser/adviser_page.dart';
import 'package:adviser/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
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
        create: (context) => AdviserBloc(),
        child: const AdviserPage(),
      ),
    );
  }
}
