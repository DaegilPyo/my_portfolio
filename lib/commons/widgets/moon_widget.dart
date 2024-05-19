import 'package:flutter/material.dart';

class MoonWidget extends StatefulWidget {
  const MoonWidget({super.key});

  @override
  State<MoonWidget> createState() => _MoonWidgetState();
}

class _MoonWidgetState extends State<MoonWidget> {
  Offset baseOffSet = const Offset(50, 50);

  static const int baseTime = 200;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      height: 200,
      width: 200,
      top: baseOffSet.dx,
      left: baseOffSet.dy,
      duration: const Duration(milliseconds: baseTime),
      curve: Curves.linear,
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (baseOffSet.dx == 50) {
              baseOffSet = const Offset(500, 300);
            } else {
              baseOffSet = const Offset(50, 50);
            }
          });
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                      colors: [Colors.white, Colors.transparent])),
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.yellow.shade300, shape: BoxShape.circle),
            )
          ],
        ),
      ),
    );
  }
}
