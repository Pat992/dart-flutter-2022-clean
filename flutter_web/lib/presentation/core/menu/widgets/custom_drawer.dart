import 'package:flutter/material.dart';
import 'package:flutter_web/constants.dart';
import 'package:flutter_web/presentation/core/buttons/custom_button.dart';
import 'package:flutter_web/presentation/core/menu/widgets/menu_item.dart';

import 'flutter_home_logo.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryDark,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    const FlutterHomeLogo(),
                    const Spacer(),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.close,
                        color: textPrimaryDark,
                        size: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                const MenuTextItem(text: 'Docs', inDrawer: true),
                const SizedBox(height: 20),
                const MenuTextItem(text: 'Showcase', inDrawer: true),
                const SizedBox(height: 20),
                const MenuTextItem(text: 'Development', inDrawer: true),
                const SizedBox(height: 20),
                const MenuTextItem(text: 'Ecosystem', inDrawer: true),
              ],
            ),
            Column(
              children: const <Widget>[
                Spacer(),
                CustomButton(
                    inDrawer: true, inPage: false, text: 'Get started'),
                SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
