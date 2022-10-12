import 'package:flutter/material.dart';
import 'package:flutter_grundlagen/application/theme_service.dart';
import 'package:flutter_grundlagen/presentation/navigation_examples/screen_one.dart';
import 'package:flutter_grundlagen/presentation/navigation_examples/screen_two.dart';
import 'package:flutter_grundlagen/root.dart';
import 'package:flutter_grundlagen/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => ThemeService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, state, child) {
      return MaterialApp(
        theme: state.isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => const RootWidget(),
          '/screen1': (BuildContext context) => const ScreenOne(),
          '/screen2': (BuildContext context) => const ScreenTwo(),
        },
      );
    });
  }
}
