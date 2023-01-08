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

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flip() {
    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flip,
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
