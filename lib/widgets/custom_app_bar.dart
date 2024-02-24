import 'package:flutter/material.dart';

class CustomAppBar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    //   path.lineTo(0, size.height - 30);
    //   path.quadraticBezierTo(
    //       size.width / 10, size.height - 10, size.width / 4.85, size.height - 20);

    //   path.quadraticBezierTo(
    //       1 * size.width - 36, size.height - 90, size.width, size.height - 10);

    //   path.lineTo(size.width, 0);
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
        size.width / 10, size.height - 25, size.width / 2.85, size.height - 49);

    path.quadraticBezierTo(3.5 / 3.5 * size.width - 55, size.height - 120,
        size.width, size.height - 70);

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
