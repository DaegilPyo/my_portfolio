import 'package:flutter/material.dart';
import 'package:myportfolio/helpers/helpers.dart';

TextTheme generateTextTheme(BuildContext context, TextTheme baseTheme,
    Color baseColor, String baseFontFamily) {
  double baseFontSize = Helpers.getBaseFontSize(context);
  return baseTheme.copyWith(
    headlineLarge: baseTheme.headlineLarge!.copyWith(
      fontFamily: baseFontFamily,
      fontSize: baseFontSize * 15,
      fontWeight: FontWeight.bold,
      color: baseColor,
    ),
    headlineMedium: baseTheme.headlineMedium!.copyWith(
      fontFamily: baseFontFamily,
      fontSize: baseFontSize * 10,
      fontWeight: FontWeight.bold,
      color: baseColor,
    ),
    headlineSmall: baseTheme.headlineMedium!.copyWith(
      fontFamily: baseFontFamily,
      fontSize: baseFontSize * 5,
      fontWeight: FontWeight.bold,
      color: baseColor,
    ),
    titleLarge: baseTheme.titleLarge!.copyWith(
      fontFamily: baseFontFamily,
      fontSize: baseFontSize * 12,
      color: baseColor,
    ),
    titleMedium: baseTheme.titleMedium!.copyWith(
      fontFamily: baseFontFamily,
      fontSize: baseFontSize * 8,
      color: baseColor,
    ),
    titleSmall: baseTheme.titleSmall!.copyWith(
      fontFamily: baseFontFamily,
      fontSize: baseFontSize * 4,
      color: baseColor,
    ),
    bodyLarge: baseTheme.bodyLarge!.copyWith(
      fontFamily: baseFontFamily,
      fontSize: baseFontSize * 10,
      color: baseColor,
    ),
    bodyMedium: baseTheme.bodyMedium!.copyWith(
      fontFamily: baseFontFamily,
      fontSize: baseFontSize * 8,
      color: baseColor,
    ),
    bodySmall: baseTheme.bodySmall!.copyWith(
      fontFamily: baseFontFamily,
      fontSize: baseFontSize * 4,
      color: baseColor,
    ),
    labelLarge: baseTheme.labelLarge!.copyWith(
      fontFamily: baseFontFamily,
      fontSize: baseFontSize * 6,
      fontWeight: FontWeight.bold,
      color: baseColor,
    ),
    labelMedium: baseTheme.labelMedium!.copyWith(
      fontFamily: baseFontFamily,
      fontSize: baseFontSize * 3,
      fontWeight: FontWeight.bold,
      color: baseColor,
    ),
    labelSmall: baseTheme.labelSmall!.copyWith(
      fontFamily: baseFontFamily,
      fontSize: baseFontSize * 2,
      fontWeight: FontWeight.bold,
      color: baseColor,
    ),
  );
}
