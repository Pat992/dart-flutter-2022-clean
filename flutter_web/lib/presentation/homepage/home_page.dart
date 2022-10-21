import 'package:flutter/material.dart';
import 'package:flutter_web/presentation/core/page_wrapper/centered_constrained_wrapper.dart';
import 'package:flutter_web/presentation/core/page_wrapper/page_template.dart';
import 'package:flutter_web/presentation/homepage/widgets/developer_experience.dart';
import 'package:flutter_web/presentation/homepage/widgets/multi_platform.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> partBlocks = [
      const CenteredConstrainedWrapper(child: MultiPlatform()),
      const SizedBox(height: 60),
      const CenteredConstrainedWrapper(child: DeveloperExperience()),
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
