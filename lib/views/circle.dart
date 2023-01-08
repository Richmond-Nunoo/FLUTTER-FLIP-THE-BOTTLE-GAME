import 'dart:math';
import 'package:flip_the_bottle_game/views/bottle.dart';
import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  const Circle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Flip the Bottle"),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: CustomPaint(
                painter: _CirclePainter(color: Colors.blue),
              ),
            ),
            const Bottle(width: 180, height: 180)
          ],
        ),
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

    var start = Offset(
      0,
      size.width / 2,
    );
    var end = Offset(size.width, size.height / 2);
    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
