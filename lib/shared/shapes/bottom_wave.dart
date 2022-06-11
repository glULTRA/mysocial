import 'package:flutter/material.dart';

class BottomWave extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path bezierPath = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, size.height * 0.8)
      ..cubicTo(
        size.width * 0.27,
        size.height * 0.81,
        size.width * 0.13,
        size.height * 0.97,
        size.width * 0.29,
        size.height * 0.95,
      )
      ..cubicTo(
        size.width * 0.41,
        size.height * 0.95,
        size.width * 0.53,
        size.height * 0.79,
        size.width * 0.69,
        size.height * 0.89,
      )
      ..cubicTo(
        size.width * 0.790,
        size.height * 0.99,
        size.width * 0.87,
        size.height * 0.95,
        size.width,
        size.height * 0.8,
      )
      ..lineTo(size.width, size.height);

    final bezierPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        tileMode: TileMode.clamp,
        colors: [Colors.lightGreen[600]!, Colors.grey[300]!],
      ).createShader(Offset(0, (size.height * 0.9)) & size);

    canvas.drawPath(bezierPath, bezierPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
