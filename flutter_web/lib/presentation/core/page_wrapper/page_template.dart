import 'package:flutter/material.dart';
import 'package:flutter_web/constants.dart';

class PageTemplate extends StatelessWidget {
  final Widget child;
  const PageTemplate({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Web',
          style: TextStyle(fontFamily: fontFamily),
        ),
      ),
      body: child,
    );
  }
}
