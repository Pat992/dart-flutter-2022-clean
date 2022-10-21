import 'package:flutter/material.dart';
import 'package:flutter_web/presentation/core/page_wrapper/page_template.dart';

class DevPage extends StatelessWidget {
  static const String path = '/development';

  const DevPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PageTemplate(child: Placeholder());
  }
}
