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
              width: 250,
              height: 250,
              child: CustomPaint(
                painter: _CirclePainter(
                    topColor: Colors.yellow, bottomColor: Colors.green),
              ),
            ),
            const Bottle(width: 280, height: 280)
          ],
        ),
      ),
    );
  }
}

class _CirclePainter extends CustomPainter {
  final Color topColor;
  final Color bottomColor;

  _CirclePainter({required this.topColor, required this.bottomColor});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..style = PaintingStyle.fill;

    var center = Offset(size.width / 2, size.height / 2);
    var radius = min(size.width, size.height) / 2;

    //draw top half
    paint.color = Colors.black;
    canvas.drawCircle(center, radius, paint);

    //draw bottom half
    paint.color = bottomColor;
    canvas.drawCircle(center, radius, paint);

    paint.color = Colors.white;
    paint.strokeWidth = 5;
    paint.style = PaintingStyle.stroke;

    var start = Offset(
      0,
      size.width / 2,
    );
    var end = Offset(size.width, size.height / 2);
    canvas.drawLine(start, end, paint);

    // Draw top text

    var topText = const TextSpan(
      text: "TOP",
      style: TextStyle(
        textBaseline: TextBaseline.alphabetic,
        color: Colors.black,
        inherit: false,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
    var topTextPainter = TextPainter(
      textWidthBasis: TextWidthBasis.longestLine,
      textAlign: TextAlign.center,
      text: topText,
      textDirection: TextDirection.rtl,
    );
    topTextPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    topTextPainter.paint(
      canvas,
      Offset(center.dx - 10, center.dy - 100),
    );

    // Draw bottom text
    paint.color = Colors.black;

    var bottomText = const TextSpan(
      text: "Bottom",
      style: TextStyle(
        color: Colors.black,
        inherit: false,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
    var bottomTextPainter = TextPainter(
      text: bottomText,
      textDirection: TextDirection.ltr,
    );
    bottomTextPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    bottomTextPainter.paint(
      canvas,
      Offset(center.dx - 30, center.dy + 80),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
