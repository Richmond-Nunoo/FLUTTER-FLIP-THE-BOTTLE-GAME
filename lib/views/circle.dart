import 'dart:math';
import 'package:flutter/material.dart';


class Circle extends StatelessWidget {
  final Color color;
  final double width;
  final double height;

  const Circle({super.key, required this.color, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: _CirclePainter(color: color),
      ),
    );
  }
}

class _CirclePainter extends CustomPainter {
  final Color color;

  _CirclePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    var center = Offset(size.width / 2, size.height / 2);
    var radius = min(size.width, size.height) / 2;

    canvas.drawCircle(center, radius, paint);

    paint.color = Colors.white;
    paint.strokeWidth = 2;
    paint.style = PaintingStyle.stroke;

    var start = Offset(size.width / 2, 0);
    var end = Offset(size.width / 2, size.height);
    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}