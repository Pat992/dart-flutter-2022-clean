import 'package:flutter/material.dart';
import 'package:flutter_grundlagen/presentation/widgets_examples/widgets/container_text_example.dart';
import 'package:flutter_grundlagen/presentation/widgets_examples/widgets/custom_button.dart';
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
            children: <Widget>[
              const ContainerTextExample(),
              const SizedBox(height: 30),
              const RowExpandedExample(),
              const SizedBox(height: 30),
              const ProfilePicture(),
              const SizedBox(height: 30),
              const RectImage(),
              const SizedBox(height: 30),
              const MediaQueryExample(),
              const SizedBox(height: 30),
              const PageViewExample(),
              const SizedBox(height: 30),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.home),
                hoverColor: Colors.yellow,
                splashColor: Colors.orange,
              ),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'It is I, the Text-Button!!!',
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),
              CustomButton(
                onPressed: () => Navigator.of(context).pushNamed('/screen1'),
                text: 'Go to Screen 1',
                btnColor: Colors.blue[200]!,
              ),
              const SizedBox(height: 30),
              CustomButton(
                btnColor: Colors.yellow,
                onPressed: () => print('Gaga Bubu'),
                text: 'Gaga Button',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
