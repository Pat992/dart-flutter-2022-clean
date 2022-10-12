import 'package:flutter/material.dart';
import 'package:flutter_grundlagen/presentation/widgets_examples/widgets/container_text_example.dart';
import 'package:flutter_grundlagen/presentation/widgets_examples/widgets/media_query_example.dart';
import 'package:flutter_grundlagen/presentation/widgets_examples/widgets/page_view_example.dart';
import 'package:flutter_grundlagen/presentation/widgets_examples/widgets/profile_picture.dart';
import 'package:flutter_grundlagen/presentation/widgets_examples/widgets/rect_image.dart';
import 'package:flutter_grundlagen/presentation/widgets_examples/widgets/row_expanded_example.dart';

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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: const <Widget>[
              ContainerTextExample(),
              SizedBox(height: 30),
              RowExpandedExample(),
              SizedBox(height: 30),
              ProfilePicture(),
              SizedBox(height: 30),
              RectImage(),
              SizedBox(height: 30),
              MediaQueryExample(),
              SizedBox(height: 30),
              PageViewExample(),
            ],
          ),
        ),
      ),
    );
  }
}
