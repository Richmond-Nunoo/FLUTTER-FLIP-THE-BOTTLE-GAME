import 'dart:math';

import 'package:flutter/material.dart';

class Bottle extends StatefulWidget {
  final double width;
  final double height;

  const Bottle({super.key, required this.width, required this.height});

  @override
  BottleState createState() => BottleState();
}

class BottleState extends State<Bottle> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _position = 0;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flip() {
    _controller.reset();
    var random = Random();
    var end = random.nextDouble() * 2;
    _animation = CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0,
          0.5,
          curve: Curves.easeOut,
        ));
    _animation = Tween<double>(begin: 0, end: end).animate(_controller);
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _position = end;
        });
      }
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _flip();
        debugPrint("$_position");
      },
      child: RotationTransition(
        turns: _animation,
        child: Image.asset(
          "assets/bottle1.png",
          width: widget.width,
          height: widget.height,
        ),
      ),
    );
  }
}
