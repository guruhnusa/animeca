import 'package:flutter/material.dart';

class ParallelogramClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height - 30);
    path.lineTo(0, size.height - 150);
    path.lineTo(size.width, size.height - 220);
    path.lineTo(size.width, size.height - 100);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}