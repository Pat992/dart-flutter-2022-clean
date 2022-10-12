import 'package:flutter/material.dart';
import 'package:flutter_grundlagen/presentation/widgets_examples/widgets/custom_button.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: const Text('Screen 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              btnColor: Colors.yellow,
              text: 'Navigate Back',
              onPressed: () => Navigator.of(context).pop(),
            ),
            const SizedBox(height: 20),
            CustomButton(
              btnColor: Colors.red,
              text: 'Navigate to Root',
              onPressed: () => Navigator.of(context)
                  .popUntil((route) => route.settings.name == '/'),
            ),
          ],
        ),
      ),
    );
  }
}
