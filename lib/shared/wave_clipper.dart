import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  final int? number_of_curve;
  WaveClipper({this.number_of_curve});
  @override
  Path getClip(Size size) {
    // Making a new path.
    Path path = new Path();

    // Start drawing path from 0 to height.
    path.lineTo(0.0, size.height);

    // First Quadratic beziar curve.
    var firstStart = Offset(size.width / 5.0, size.height - 100);
    var firstEnd = Offset(size.width / 2.50,
        size.height - 40); // Size.width = To the end of the screen

    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart = Offset(size.width / 2.50, size.height - 40);
    var secondEnd = Offset(size.width, size.height);
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
        

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}
