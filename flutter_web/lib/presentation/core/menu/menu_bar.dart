import 'package:flutter/material.dart';
import 'package:flutter_web/presentation/core/buttons/get_started_button.dart';
import 'package:flutter_web/presentation/core/menu/widgets/flutter_home_logo.dart';
import 'package:flutter_web/presentation/core/menu/widgets/menu_item.dart';

class MenuBar extends StatelessWidget {
  const MenuBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: const <Widget>[
          FlutterHomeLogo(),
          Spacer(),
          MenuTextItem(text: 'Docs'),
          MenuTextItem(text: 'Showcase'),
          MenuTextItem(text: 'Development'),
          MenuTextItem(text: 'Ecosystem'),
          GetStartedButton(),
        ],
      ),
    );
  }
}
