import 'package:flutter/material.dart';
import 'package:flutter_web/presentation/homepage/home_page.dart';
import 'package:routemaster/routemaster.dart';

class FlutterHomeLogo extends StatelessWidget {
  const FlutterHomeLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => Routemaster.of(context).push(HomePage.path),
        child: Image.asset(
          'assets/images/flutter_logo_text.png',
          height: 37,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
