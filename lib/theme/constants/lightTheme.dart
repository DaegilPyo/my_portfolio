// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:myportfolio/main_scaffold/provider/main_constants.dart';
import 'package:myportfolio/theme/constants/get_text_theme.dart';
import 'package:myportfolio/theme/constants/theme_constants.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData().copyWith(
    primaryColor: ThemeConstants.darkPrimaryColor,
    primaryColorLight: ThemeConstants.darkPrimaryColorLight,
    textTheme: generateTextTheme(
      context,
      ThemeData.light().textTheme,
      Colors.black,
      MainConstants.regularBaseFontFamily,
    ),
    scaffoldBackgroundColor: Colors.white,
  );
}
