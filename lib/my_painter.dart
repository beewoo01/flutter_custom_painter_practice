import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(75, 75), 50, Paint()..color = Colors.brown);
    canvas.drawLine(
      Offset(300, 1),

      /// 선의 시작 점 (x: 300, y: 1)
      Offset(300, 150),

      /// 선의 끝 점 (x: 300, y: 150)
      Paint()
        ..color = Colors.blue
        ..strokeWidth = 5
        ..isAntiAlias = true
        ..strokeCap = StrokeCap.round,
    );
    canvas.drawRect(Rect.fromPoints(Offset.zero, Offset(30, 30)), Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
