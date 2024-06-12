import 'package:flutter/material.dart';

class CustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height);

    // First curve (left)
    final firstControlPoint = Offset(size.width * 0.2, size.height - 40);
    final firstEndPoint = Offset(size.width * 0.4, size.height - 20);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    // Middle straight line
    path.lineTo(size.width * 0.6, size.height - 20);

    // Second curve (right)
    final secondControlPoint = Offset(size.width * 0.8, size.height - 40);
    final secondEndPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
