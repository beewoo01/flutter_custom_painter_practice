import 'dart:ui';

import 'package:flutter/material.dart';

class DrawingPainter extends CustomPainter {
  ValueNotifier<List<Offset>> points; // 사용자가 그린 점 목록

  DrawingPainter(this.points) : super(repaint: points);

  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint()
      ..color = Colors.black
      ..strokeWidth = 4
      //선 굵기
      ..isAntiAlias = true
      // 부드럽게 처리
      ..strokeCap = StrokeCap.round;
    // 선 끝 모양: 둥글게

    // 점 목록을 순회하면 연속된 점들 ㄹ사시에 선을 그림
    for (int i = 0; i < points.value.length - 1; i++) {
      // Offset.infinite는 선의 끝을 의미하므로 건너뜀
      if (points.value[i] != Offset.infinite &&
          points.value[i + 1] != Offset.infinite) {
        canvas.drawLine(points.value[i], points.value[i + 1], pencil);
      } else if (points.value[i] != Offset.infinite &&
          points.value[i + 1] == Offset.infinite) {
        canvas.drawPoints(PointMode.points, [points.value[i]], pencil);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) {
    return false;
  }

  @override
  bool? hitTest(Offset position) {
    return null;
  }
}
