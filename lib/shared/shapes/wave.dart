import 'dart:ui';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Wave extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path bezierPath = Path()
      ..lineTo(0, size.height * 0.5)
      ..quadraticBezierTo(
        size.width * 0.20,
        size.height * 0.31,
        size.width * 0.39,
        size.height * 0.48,
      )
      ..quadraticBezierTo(
        size.width * 0.55,
        size.height * 0.63,
        size.width * 0.70,
        size.height * 0.40,
      )
      ..quadraticBezierTo(
        size.width * 0.80,
        size.height * 0.27,
        size.width,
        size.height * 0.55,
      )
      ..lineTo(size.width, 0);

    final bezierPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        tileMode: TileMode.clamp,
        colors: [Colors.redAccent[400]!, Colors.grey[300]!],
      ).createShader(Offset(0, -(size.height / 4)) & size);

    canvas.drawPath(bezierPath, bezierPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
