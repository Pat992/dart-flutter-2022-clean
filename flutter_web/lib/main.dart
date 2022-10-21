import 'package:flutter/material.dart';
import 'package:flutter_web/router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:routemaster/routemaster.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: const RoutemasterParser(),
      routerDelegate:
          RoutemasterDelegate(routesBuilder: (BuildContext context) => router),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Web',
      builder: (context, widget) => ResponsiveWrapper.builder(
        widget,
        defaultScale: true,
        minWidth: 400,
        defaultName: MOBILE,
        // to set free space, in case it should happen
        backgroundColor: Colors.white,
        // Set breakpoints for later scaling
        breakpoints: const [
          ResponsiveBreakpoint.autoScale(450, name: MOBILE),
          ResponsiveBreakpoint.resize(600, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
      ),
    );
  }
}
