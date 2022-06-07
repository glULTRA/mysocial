import 'package:flutter/material.dart';

class Circle extends CustomPainter {
  double radius;
  double stroke;
  
  Circle({this.radius = 10.0, this.stroke = 2.0});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(Circle oldDelegate) => false;
}
