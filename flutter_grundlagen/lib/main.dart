import 'package:flutter/material.dart';
import 'package:flutter_grundlagen/presentation/navigation_examples/screen_one.dart';
import 'package:flutter_grundlagen/presentation/navigation_examples/screen_two.dart';
import 'package:flutter_grundlagen/root.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const RootWidget(),
        '/screen1': (BuildContext context) => const ScreenOne(),
        '/screen2': (BuildContext context) => const ScreenTwo(),
      },
    );
  }
}
