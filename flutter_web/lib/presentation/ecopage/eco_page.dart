import 'package:flutter/material.dart';
import 'package:flutter_web/presentation/core/page_wrapper/page_template.dart';
import 'package:flutter_web/presentation/ecopage/widgets/ecosystem_start.dart';

class EcoPage extends StatelessWidget {
  static const String path = '/ecosystem';

  const EcoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> partBlocks = [
      const EcosystemStart(),
    ];

    return PageTemplate(
      // List view builder can be used to add animations when widgets enter the screen
      child: ListView.builder(
        itemCount: partBlocks.length,
        itemBuilder: (context, index) => partBlocks[index],
      ),
    );
  }
}
