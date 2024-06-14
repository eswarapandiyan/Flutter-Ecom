import 'package:flutter/material.dart';

class CustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // Start from the top left corner
    path.moveTo(0, 0);

    // Draw a line to the top right corner
    path.lineTo(size.width, 0);

    // Draw a line to the bottom right corner, leaving space for the curve
    path.lineTo(size.width, size.height - 20);

    // Draw the bottom right curve
    var secondControlPoint = Offset(size.width - 20, size.height);
    var secondEndPoint = Offset(size.width - 40, size.height);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    // Draw a line to the bottom left curve, leaving space for the curve
    path.lineTo(40, size.height);

    // Draw the bottom left curve
    var firstControlPoint = Offset(20, size.height);
    var firstEndPoint = Offset(0, size.height - 20);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    // Draw a line back to the start point (top left corner)
    path.lineTo(0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
