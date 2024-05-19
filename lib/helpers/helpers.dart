import 'package:flutter/material.dart';
import 'package:myportfolio/helpers/enums.dart';
import 'package:myportfolio/theme/constants/theme_constants.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Helpers {
  static double getBaseFontSize(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).isTablet) {
      return 3.0;
    } else if (ResponsiveBreakpoints.of(context).isMobile) {
      return 2.5;
    } else {
      return 4;
    }
  }

  static String getSkillsText(Skills skill) {
    switch (skill) {
      case Skills.javaScript:
        return 'Java Script';
      case Skills.typeScript:
        return 'Type Script';
      case Skills.flutter:
        return 'Flutter';
      case Skills.dart:
        return 'Dart';
      case Skills.nodeJs:
        return 'Node Js';
      case Skills.nestJs:
        return 'Nest Js';
      case Skills.firebase:
        return 'Firebase';
      case Skills.db2:
        return 'DB2';
    }
  }

  static Color getSkillsColor(Skills skill) {
    switch (skill) {
      case Skills.javaScript:
        return ThemeConstants.softBlue;
      case Skills.typeScript:
        return ThemeConstants.softGreen;
      case Skills.flutter:
        return Colors.lightBlue.withOpacity(0.3);
      case Skills.dart:
        return ThemeConstants.softTeal;
      case Skills.nodeJs:
        return ThemeConstants.softYellow;
      case Skills.nestJs:
        return ThemeConstants.softRed;
      case Skills.firebase:
        return ThemeConstants.softYellow;
      case Skills.db2:
        return Colors.lightBlue.withOpacity(0.3);
    }
  }

  static Offset getWidgetPosition(GlobalKey key) =>
      (key.currentContext!.findRenderObject() as RenderBox)
          .localToGlobal(Offset.zero);

  static double getMQHeight({required BuildContext context}) =>
      MediaQuery.of(context).size.height;
  static double getMQWidth({required BuildContext context}) =>
      MediaQuery.of(context).size.width;
}
