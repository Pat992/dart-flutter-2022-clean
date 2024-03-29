import 'package:flutter/material.dart';
import 'package:flutter_web/presentation/core/buttons/custom_button.dart';
import 'package:flutter_web/presentation/core/menu/widgets/flutter_home_logo.dart';
import 'package:flutter_web/presentation/core/menu/widgets/menu_item.dart';
import 'package:flutter_web/presentation/devpage/dev_page.dart';
import 'package:flutter_web/presentation/ecopage/eco_page.dart';

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
            color: Colors.black45,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          const FlutterHomeLogo(),
          const Spacer(),
          const MenuTextItem(text: 'Docs', inDrawer: false, path: ''),
          const MenuTextItem(text: 'Showcase', inDrawer: false, path: ''),
          const MenuTextItem(
              text: 'Development', inDrawer: false, path: DevPage.path),
          const MenuTextItem(
              text: 'Ecosystem', inDrawer: false, path: EcoPage.path),
          CustomButton(
              inDrawer: false,
              inPage: false,
              text: 'Get started',
              callback: () {}),
        ],
      ),
    );
  }
}
