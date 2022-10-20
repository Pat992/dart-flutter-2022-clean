import 'package:flutter/material.dart';

class ColorEntity {
  final Color color;

  static const List<Color> predefinedColors = [
    Color(0xffFEA82F),
    Color(0xffF07B3F),
    Color(0xffEA5455),
    Color(0xffB83B5E),
    Color(0xff6A2C70),
    Color(0xff3282B8),
  ];

  ColorEntity({required this.color});
}
