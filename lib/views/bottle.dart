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
      animationBehavior: AnimationBehavior.preserve,
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
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
        0.9,
        curve: Curves.linear,
      ),
    );
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
          filterQuality: FilterQuality.high,
          fit: BoxFit.contain,
          width: 200,
          height: 90,
        ),
      ),
    );
  }
}
