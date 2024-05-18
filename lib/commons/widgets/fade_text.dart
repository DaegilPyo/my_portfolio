import 'package:flutter/material.dart';

class FadeText extends StatelessWidget {
  final String firstText;
  final String secondText;
  final TextStyle? firstTextStyle;
  final TextStyle? secondTextStyle;
  final double opacity;
  final Widget? firstPrefixWidget;
  final Widget? secondPrefixWidget;
  const FadeText({
    super.key,
    required this.firstText,
    required this.secondText,
    this.firstTextStyle,
    this.secondTextStyle,
    this.opacity = 0,
    this.firstPrefixWidget,
    this.secondPrefixWidget,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle firstTs =
        firstTextStyle ?? Theme.of(context).textTheme.titleMedium!;
    final TextStyle secondTs = secondTextStyle ??
        (firstTextStyle ?? Theme.of(context).textTheme.titleMedium!);
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Positioned(
          top: -(opacity * 60),
          // left: -(opacity * 60),
          child: Opacity(
            opacity: 1 - opacity,
            child: Row(
              children: [
                if (firstPrefixWidget != null) firstPrefixWidget!,
                Text(
                  firstText,
                  style: firstTs,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 60 - (opacity * 60),
          // left: 60 - (opacity * 60),
          child: Opacity(
            opacity: opacity,
            child: Row(
              children: [
                if (secondPrefixWidget != null) secondPrefixWidget!,
                Text(
                  secondText,
                  style: secondTs,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: firstTs.fontSize! + 15,
          width: 300,
        ),
      ],
    );
  }
}
