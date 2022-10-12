import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color btnColor;
  const CustomButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.btnColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 25,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => onPressed(),
        child: Container(
          height: 35,
          width: 100,
          decoration: BoxDecoration(
            color: btnColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
