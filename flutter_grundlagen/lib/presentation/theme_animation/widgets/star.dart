import 'dart:math';

import 'package:flutter/material.dart';

class Star extends StatelessWidget {
  const Star({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final radius = Random().nextDouble() * (3 - 1) + 1;
    final spreadRadius = Random().nextDouble() * (6 - 4) + 4;
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFFC9E9FC),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFC9E9FC).withOpacity(0.5),
              spreadRadius: spreadRadius,
              blurRadius: 7,
              offset: const Offset(0, 0),
            ),
          ]),
    );
  }
}
