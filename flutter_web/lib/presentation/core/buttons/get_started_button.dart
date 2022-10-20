import 'package:flutter/material.dart';
import 'package:flutter_web/constants.dart';

class GetStartedButton extends StatelessWidget {
  final bool inDrawer;

  const GetStartedButton({Key? key, required this.inDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => print('button pressed'),
        child: Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: inDrawer ? background : primaryDark,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Get started',
                style: TextStyle(
                  fontFamily: fontFamily,
                  fontSize: 15,
                  color: inDrawer ? primary : textPrimaryDark,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
