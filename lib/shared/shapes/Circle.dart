import 'package:flutter/material.dart';

class Circle extends CustomPainter {
  double radius;
  double stroke;

  Circle({this.radius = 10.0, this.stroke = 2.0});

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint = new Paint()
      ..color = Colors.amber
      ..strokeCap = StrokeCap.round
      ..strokeWidth = stroke
      ..style = PaintingStyle.stroke
      ..shader = LinearGradient(colors: [
        Colors.red,
        Colors.blue,
      ]).createShader(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: radius,
      ));

    Path path = new Path()
      ..addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: radius,
      ));
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(Circle oldDelegate) => false;
}
