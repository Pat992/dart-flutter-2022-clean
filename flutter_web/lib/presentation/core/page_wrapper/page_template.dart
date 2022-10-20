import 'package:flutter/material.dart';
import 'package:flutter_web/presentation/core/menu/menu_bar.dart';

class PageTemplate extends StatelessWidget {
  final Widget child;
  const PageTemplate({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 66),
        child: MenuBar(),
      ),
      body: child,
    );
  }
}
