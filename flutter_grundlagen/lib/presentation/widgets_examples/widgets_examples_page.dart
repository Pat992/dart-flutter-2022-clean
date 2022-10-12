import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_grundlagen/presentation/widgets_examples/widgets/container_text_example.dart';

class WidgetsExamplesPage extends StatelessWidget {
  const WidgetsExamplesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[200],
        leading: const Icon(Icons.home),
        title: const Text('Widgets Example'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: <Widget>[
              const ContainerTextExample(),
              const SizedBox(height: 10),
              Container(
                color: Colors.yellow,
                //width: 100,
                height: 100,
              ),
              const SizedBox(height: 10),
              Container(
                color: Colors.green,
                //width: 100,
                height: 100,
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
