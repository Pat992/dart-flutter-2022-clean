import 'package:flutter/material.dart';

class ColorEntity {
  final Color color;

  static const List<Color> predefinedColors = [
    Color(0xfffa8072),
    Color(0xff87BCDE),
    Color(0xff805E73),
    Color(0xfffca3b7),
    Color(0xff997950),
    Color(0xff2D4654),
  ];

  ColorEntity({required this.color});
}
