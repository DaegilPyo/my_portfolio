import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myportfolio/main_scaffold/provider/main_provider.dart';
import 'package:myportfolio/theme/my_theme.dart';
import 'package:simple_animations/simple_animations.dart';

class ThemeModeButton extends StatefulWidget {
  const ThemeModeButton({super.key});

  @override
  State<ThemeModeButton> createState() => _ThemeModeButtonState();
}

class _ThemeModeButtonState extends State<ThemeModeButton> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, WidgetRef ref, __) {
      final provider = ref.watch(mainProvider);
      Color baseColor = Theme.of(context).baseTextColor;

      Widget icon = Icon(
        provider.themeMode == ThemeMode.dark
            ? Icons.nightlight_outlined
            : Icons.sunny,
        color: baseColor,
        size: 20,
      );

      return SizedBox(
        width: 100,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: InkWell(
            focusColor: Colors.transparent,
            overlayColor: MaterialStateProperty.resolveWith((states) {
              return Colors.transparent;
            }),
            hoverColor: Colors.transparent,
            onTap: () {
              provider.changeTheme();
            },
            onHover: (h) {
              setState(() {
                hovered = h;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                hovered
                    ? LoopAnimationBuilder<double>(
                        tween: Tween<double>(begin: 0, end: 2 * pi),
                        duration: const Duration(milliseconds: 3000),
                        builder: (_, double value, child) {
                          return Transform.rotate(
                            angle: value,
                            child: child!,
                          );
                        },
                        child: icon,
                      )
                    : icon,
                const SizedBox(
                  width: 6,
                ),
                Text(
                  'MODE',
                  style: Theme.of(context).textTheme.labelMedium,
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
