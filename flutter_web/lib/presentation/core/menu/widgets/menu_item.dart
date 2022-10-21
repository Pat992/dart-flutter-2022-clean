import 'package:flutter/material.dart';
import 'package:flutter_web/constants.dart';
import 'package:routemaster/routemaster.dart';

class MenuTextItem extends StatelessWidget {
  final String path;
  final String text;
  final bool inDrawer;
  const MenuTextItem(
      {Key? key,
      required this.text,
      required this.inDrawer,
      required this.path})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => Routemaster.of(context).push(path),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            text,
            style: TextStyle(
              fontFamily: fontFamily,
              fontSize: 15,
              color: inDrawer ? textPrimaryDark : textPrimaryLight,
            ),
          ),
        ),
      ),
    );
  }
}
