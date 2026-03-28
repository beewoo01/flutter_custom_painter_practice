import 'package:custom_painter_practice/drawing_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugRepaintRainbowEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: DrawingPage(),
    );
  }
}

class DrawingPage extends StatelessWidget {
  DrawingPage({super.key});

  final pointsListenable = ValueNotifier<List<Offset>>([]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DrawingPage')),
      body: GestureDetector(
        onPanStart: (details) => pointsListenable.value = [
          ...pointsListenable.value,
          details.localPosition,
        ],
        onPanUpdate: (details) {
          pointsListenable.value = [
            ...pointsListenable.value,
            details.localPosition,
          ];
        },
        onPanEnd: (details) {
          pointsListenable.value = [...pointsListenable.value, Offset.infinite];
        },
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: RepaintBoundary(
            child: CustomPaint(
              painter: DrawingPainter(pointsListenable),
              child: const SizedBox.shrink(),
            ),
          ),
        ),
      ),
    );
  }
}
