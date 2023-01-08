import 'dart:async';
import 'dart:math';
import 'package:flip_the_bottle_game/views/bottle.dart';
import 'package:flip_the_bottle_game/views/circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // double _angle = 0.0;
  // double _force = 0.0;
  // int _score = 0;
  // late Timer _landingTimer;
  // bool _isFlipping = false;
  // bool _hasLanded = false;
  // final Size _bottleSize = Size.zero;
  // Size _screenSize = Size.zero;

  // void _startListeningForLandings() {
  //   // Check if the bottle has landed every 10 milliseconds
  //   _landingTimer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
  //     if (_isFlipping) {
  //       // Calculate the new angle of the bottle based on the physics simulation
  //       _angle = _calculateNewAngle();
  //       setState(() {});
  //       if (_hasLanded) {
  //         // If the bottle has landed, stop the timer and reset the game
  //         timer.cancel();
  //         _isFlipping = false;
  //         _hasLanded = false;
  //         _startListeningForLandings();
  //       }
  //     }
  //   });
  // }

  // @override
  // void initState() {
  //   _startListeningForLandings();
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _landingTimer.cancel();
  //   super.dispose();
  // }

  // double _calculateNewAngle() {
  //   final simulation = SpringSimulation(
  //     SpringDescription.withDampingRatio(
  //       mass: 1.0,
  //       stiffness: 200.0,
  //       ratio: 0.5,
  //     ),
  //     _angle,
  //     0.0,
  //     _force,
  //   );
  //   final elapsed =
  //       DateTime.now().difference(DateTime.now()).inMicroseconds / 1000;
  //   return simulation.x(elapsed);
  // }

  // void _flipBottle(double force) {
  //   // Start the flipping animation by setting the force and flagging the bottle as flipping
  //   setState(() {
  //     _force = force;
  //     _isFlipping = true;
  //   });
  //   _checkIfBottleLanded();
  // }

  // void _checkIfBottleLanded() {
  //   const landedThreshold = 0.1;
  //   if (_angle.abs() < landedThreshold) {
  //     _hasLanded = true;
  //     _score++;
  //   } else if (_angle.abs() > (180 - landedThreshold).toDouble()) {
  //     _hasLanded = true;
  //     _score--;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var random = Random();
    var result = random.nextBool() ? 'top' : 'bottom';
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Circle(color: Colors.blue, width: 200, height: 200),
            const SizedBox(
              height: 20,
            ),
            const Bottle(width: 50, height: 20),
            const SizedBox(
              height: 20,
            ),
            Text(result)
          ],
        ),
      ),
      // bottomSheet: SizedBox(
      //   height: 100.0,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       ElevatedButton(
      //         onPressed: () {},
      //         child: const Text('Flip to top'),
      //       ),
      //       ElevatedButton(
      //         onPressed: () {},
      //         child: const Text('Flip to bottom'),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
