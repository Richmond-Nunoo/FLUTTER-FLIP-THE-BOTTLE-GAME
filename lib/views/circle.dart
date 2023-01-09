import 'dart:math' as math;
import 'package:flip_the_bottle_game/views/bottle.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Flip the Bottle"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tap the bottle to flip it !!",
              style: theme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: const Size(250, 250),
                  painter: _CirclePainter(
                      topColor: Colors.yellow, bottomColor: Colors.green),
                ),
                const Bottle(width: 280, height: 280)
              ],
            ),
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
    var radius = math.min(size.width, size.height) / 2;

    paint.color = Colors.red;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), math.pi,
        math.pi, true, paint);

    paint.color = Colors.blue;

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), 0, math.pi,
        true, paint);
    // //draw top half
    // paint.color = Colors.yellow;
    // canvas.drawCircle(center, radius, paint);

    // //draw bottom half
    // paint.color = Colors.blue;
    // canvas.drawCircle(center, radius, paint);

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
        color: Colors.white,
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

    var bottomText = const TextSpan(
      text: "Bottom",
      style: TextStyle(
        color: Colors.white,
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
