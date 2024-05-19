// ignore_for_file: unused_element

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myportfolio/theme/my_theme.dart';
import 'package:simple_animations/simple_animations.dart';

List<Color> _colors = [
  Colors.yellow,
  Colors.red,
  Colors.blue,
  Colors.brown,
  Colors.green,
];
List<Curve> _curves = [
  Curves.bounceIn,
  Curves.bounceOut,
  Curves.bounceOut,
  Curves.linearToEaseOut,
  Curves.linear,
  Curves.fastOutSlowIn
];

class ParticleWidget extends StatelessWidget {
  final double left;
  const ParticleWidget({
    super.key,
    required this.left,
  });

  @override
  Widget build(BuildContext context) {
    // final Curve curve = _curves[Random().nextInt(_curves.length - 1)];
    final int time = Random().nextInt(100) * 100;
    int baseSize = 10 + Random().nextInt(20);
    // final Color color = _colors[Random().nextInt(_colors.length - 1)];
    final int left2 = Random().nextInt(100) * 10;
    return LoopAnimationBuilder(
      tween: Tween<double>(begin: 0, end: MediaQuery.of(context).size.height),
      duration: Duration(milliseconds: 1000 + time),
      curve: Curves.linear,
      // curve: curve,
      builder: (_, value, Widget? child) {
        return Positioned(
          top: value,
          left: left + value - left2,
          child: Container(
            height: baseSize.toDouble(),
            width: baseSize.toDouble(),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  // color.withOpacity(0.3),
                  Theme.of(context).baseTextColor.withOpacity(0.1),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
