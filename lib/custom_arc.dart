import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArcPainter extends CustomPainter {
  final num? controlX;
  final num? controlY;
  final num? endX;
  final num? endY;
  final double? start;

  const ArcPainter({
    this.controlX,
    this.controlY,
    this.endX,
    this.endY,
    this.start,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Color(0xFFB71518)
          //..color = Colors.blue
          ..style = PaintingStyle.fill;

    final path = Path();

    // Start from top right corner
    path.moveTo(size.width, start!);

    // create arc
    path.quadraticBezierTo(
      size.width * controlX!, // Control point X
      size.height * controlY!, // Control point Y
      size.width * endX!, // End point X
      size.height, // End point Y
    );

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
