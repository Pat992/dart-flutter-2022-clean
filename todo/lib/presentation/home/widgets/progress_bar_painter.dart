import 'package:flutter/material.dart';

class ProgressBarPainter extends CustomPainter {
  double barWidth;
  double barHeight;
  double donePercent;
  Color bkgColor;
  Color percentageColor;

  ProgressBarPainter({
    required this.barWidth,
    required this.barHeight,
    required this.donePercent,
    required this.bkgColor,
    required this.percentageColor,
  });

  Paint getPaint(Color color) {
    return Paint()
      ..color = color
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint defaultBarPaint = getPaint(bkgColor);
    Paint percentageBarPaint = getPaint(percentageColor);
    final offsetX = -(barWidth / 2);
    final offsetY = -(barHeight / 2);

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Offset(offsetX, offsetY) & Size(barWidth, barHeight),
        Radius.circular(barHeight / 2),
      ),
      defaultBarPaint,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Offset(offsetX, offsetY) & Size(barWidth * donePercent, barHeight),
        Radius.circular(barHeight / 2),
      ),
      percentageBarPaint,
    );
  }

  // needs to be repainted if some values change
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
