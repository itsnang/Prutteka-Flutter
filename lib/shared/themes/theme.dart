import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prutteka_flutter/shared/themes/color_theme.dart';

class PtTheme {
  PtTheme._();

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Inter',
    primaryColor: ColorTheme.primaryColor,
    colorScheme: const ColorScheme.light(
      primary: ColorTheme.tertiary,
      secondary: ColorTheme.secondary,
      tertiary: ColorTheme.tertiary,
      outline: ColorTheme.grey900,
      background: ColorTheme.grey50,
      error: ColorTheme.primaryDark,
    ),
    cardColor: ColorTheme.white,
    disabledColor: ColorTheme.grey200,
    scaffoldBackgroundColor: ColorTheme.grey50,
    appBarTheme: const AppBarTheme(
      color: ColorTheme.primaryColor,
      foregroundColor: ColorTheme.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: ColorTheme.grey900,
        letterSpacing: 0.27,
      ),
      bodySmall: TextStyle(
        color: ColorTheme.grey900,
        letterSpacing: 0.27,
      ),
      labelLarge: TextStyle(
        color: ColorTheme.grey900,
        letterSpacing: 0.27,
      ),
    ),
  );
}
