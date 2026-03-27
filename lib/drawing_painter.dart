import 'package:flutter/material.dart';

class DrawingPainter extends CustomPainter {
  List<Offset> points;
  DrawingPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint()
      ..color = Colors.black
      ..strokeWidth = 4
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != Offset.infinite && points[i + 1] != Offset.infinite) {
        canvas.drawLine(points[i], points[i + 1], pencil);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) {
    return false;
  }
}
