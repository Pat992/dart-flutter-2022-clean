import 'package:flutter/material.dart';
import 'package:flutter_web/constants.dart';

class CustomButton extends StatelessWidget {
  final bool inDrawer;
  final bool inPage;
  final String text;
  final Function callback;

  const CustomButton({
    Key? key,
    required this.inDrawer,
    required this.text,
    required this.inPage,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => callback(),
        child: Material(
          elevation: inPage ? 0 : 6,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: inDrawer || inPage ? background : primaryDark,
              borderRadius: BorderRadius.circular(20),
              border: inPage ? Border.all(color: primary) : null,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: fontFamily,
                  fontSize: 15,
                  color: inDrawer || inPage ? primary : textPrimaryDark,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
