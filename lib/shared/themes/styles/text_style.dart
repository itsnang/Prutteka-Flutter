import 'package:flutter/widgets.dart';
import 'package:prutteka_flutter/constants/enums/text_enum.dart';
import 'package:prutteka_flutter/constants/text_size.dart';
import 'package:prutteka_flutter/shared/themes/color_theme.dart';

class PtTextStyle {
  PtTextStyle._();

  static TextStyle tiny({
    Color? color,
    TextSizeEnum fontSize = TextSizeEnum.tiny,
    bool isBold = false,
  }) {
    return basedTextStyle(
        fontSize: fontSize.value, color: color ?? ColorTheme.grey900);
  }

  static TextStyle caption({
    Color? color,
    TextSizeEnum fontSize = TextSizeEnum.caption,
    bool isBold = false,
  }) {
    return basedTextStyle(
      color: color,
      fontSize: fontSize.value,
      isBold: isBold,
    );
  }

  static TextStyle body({
    Color? color,
    TextSizeEnum fontSize = TextSizeEnum.body,
    bool isBold = false,
  }) {
    return basedTextStyle(
      color: color,
      fontSize: fontSize.value,
      isBold: isBold,
    );
  }

  static TextStyle subtitle({
    Color? color,
    TextSizeEnum fontSize = TextSizeEnum.subtitle,
    bool isBold = false,
  }) {
    return basedTextStyle(
      color: color,
      fontSize: fontSize.value,
      isBold: isBold,
    );
  }

  static TextStyle title({
    Color? color,
    TextSizeEnum fontSize = TextSizeEnum.title,
    bool isBold = false,
  }) {
    return basedTextStyle(
      color: color,
      fontSize: fontSize.value,
      isBold: isBold,
    );
  }

  static TextStyle custom({
    Color? color,
    double fontSize = TextSize.TEXT_SIZE_BODY,
    bool isBold = false,
    double? height,
    TextDecoration? decoration,
  }) {
    return basedTextStyle(
      color: color,
      fontSize: fontSize,
      isBold: isBold,
      height: height,
      decoration: decoration,
    );
  }

  static TextStyle basedTextStyle({
    Color? color,
    required double fontSize,
    bool isBold = false,
    double? height,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: 'Inter',
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontSize: fontSize,
      color: color,
      height: height,
      decoration: decoration,
    );
  }
}
