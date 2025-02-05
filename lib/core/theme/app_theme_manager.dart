import 'package:flutter/material.dart';

import '/core/theme/color_palette.dart';

abstract class AppThemeManager {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: ColorPalette.appWhiteColor,
      textTheme: TextTheme(
          titleMedium: TextStyle(
        fontFamily: "Inter",
        fontSize: 14,
      )),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        overlayColor: Colors.transparent,
        shadowColor: Colors.transparent,
      )));

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorPalette.secondaryDarkColor,
  );
}
