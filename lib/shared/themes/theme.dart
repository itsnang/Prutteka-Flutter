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
    disabledColor: ColorTheme.grey100,
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

extension ContextThemeExt on BuildContext {
  ///background app color
  Color get backgroundColor => Theme.of(this).scaffoldBackgroundColor;

  ///card color (White color in Light Theme)
  Color get cardColor => Theme.of(this).cardColor;

  ///Primary color
  Color get primaryColor => Theme.of(this).primaryColor;

  Color get primaryLightColor => Theme.of(this).primaryColorLight;

  ///Secondary Color
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;

  ///Yello Color
  Color get tertiaryColor => Theme.of(this).colorScheme.tertiary;

  ///Grey Color
  Color get disableColor => Theme.of(this).disabledColor;

  ///Outline Color
  Color get outlineColor => Theme.of(this).colorScheme.outline;

  ///DarkPrimary Color
  Color get errorColor => Theme.of(this).colorScheme.error;

  ///Text 1st Color (Default Text Color)
  Color get textPrimaryColor => Theme.of(this).textTheme.bodyMedium!.color!;

  ///Text 2nd Color (lighter than Text 1st Color)
  Color get textSecondaryColor => Theme.of(this).textTheme.bodySmall!.color!;

  ///Text 3rd Color (lighter than Text 2nd Color)
  Color get textTertiaryColor => Theme.of(this).textTheme.labelLarge!.color!;
}
