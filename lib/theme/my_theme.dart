import 'package:flutter/material.dart';

import 'package:myportfolio/theme/constants/darkTheme.dart';
import 'package:myportfolio/theme/constants/lightTheme.dart';

class MyTheme {
  static ThemeData getTheme(BuildContext context, ThemeMode themeModeEnum) {
    switch (themeModeEnum) {
      case ThemeMode.dark:
        return darkTheme(context);
      case ThemeMode.light:
      default:
        return lightTheme(context);
    }
  }
}

extension ExtraThemeExtenstion on ThemeData {
  Color get baseTextColor => textTheme.headlineLarge!.color!;
  Color get primaryTextColor => primaryTextTheme.headlineLarge!.color!;
}
