import 'package:flutter/material.dart';
import 'package:flutter_grundlagen/presentation/counter_app/counter_app_page.dart';
import 'package:flutter_grundlagen/presentation/theme_animation/theme_animation_page.dart';
import 'package:flutter_grundlagen/presentation/widgets_examples/widgets_examples_page.dart';

class RootWidget extends StatefulWidget {
  const RootWidget({Key? key}) : super(key: key);

  @override
  State<RootWidget> createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // VERY INTERESTING, keeps state while moving between pages
      body: IndexedStack(
        index: _index,
        children: const <Widget>[
          WidgetsExamplesPage(),
          CounterAppPage(),
          ThemeAnimationPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => setState(() {
          _index = index;
        }),
        currentIndex: _index,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Examples',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Counter App',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.color_lens),
            label: 'Theme',
          ),
        ],
      ),
    );
  }
}
