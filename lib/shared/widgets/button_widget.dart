import 'package:flutter/material.dart';
import 'package:prutteka_flutter/constants/constant.dart';
import 'package:prutteka_flutter/constants/enums/text_enum.dart';
import 'package:prutteka_flutter/shared/themes/color_theme.dart';
import 'package:prutteka_flutter/shared/themes/styles/button_style.dart';
import 'package:prutteka_flutter/shared/widgets/text_widget.dart';

class ButtonWidget {
  ButtonWidget._();

  static Widget text(
    String text, {
    Function()? onPressed,
    Color? textColor,
    double margin = 0,
    bool? isBold,
  }) {
    textColor ??= ColorTheme.white;
    isBold ??= false;
    return Padding(
      padding: EdgeInsets.all(margin),
      child: TextButton(
        onPressed: onPressed,
        child: TextWidget.body(
          text,
          color: textColor,
          isBold: isBold,
        ),
      ),
    );
  }

  static Widget outline(String text,
      {Function()? onPressed,
      Color? textColor,
      Color? backgroundColor,
      Color? borderColor,
      double margin = 0,
      TextSizeEnum fontSize = TextSizeEnum.subtitle,
      bool isFull = false,
      bool isBold = false,
      double borderRadius = Const.borderRadius,
      EdgeInsets? padding,
      bool isActive = false,
      Widget? icon}) {
    borderColor ??= ColorTheme.grey900;
    textColor ??= ColorTheme.grey900;
    final Widget textWidget;
    if (fontSize == TextSizeEnum.subtitle) {
      textWidget = TextWidget.subtitle(text, color: textColor, isBold: isBold);
    } else if (fontSize == TextSizeEnum.title) {
      textWidget = TextWidget.title(text, color: textColor, isBold: isBold);
    } else if (fontSize == TextSizeEnum.caption) {
      textWidget = TextWidget.caption(text, color: textColor, isBold: isBold);
    } else {
      textWidget = TextWidget.body(text, color: textColor, isBold: isBold);
    }

    return Padding(
      padding: EdgeInsets.only(
        left: margin,
        top: margin,
        bottom: margin,
        right: margin,
      ),
      child: icon == null
          ? TextButton(
              onPressed: onPressed,
              style: PtButtonStyle.outlineStyle(
                isFull: isFull,
                backgroundColor:
                    isActive ? ColorTheme.tertiaryLight : backgroundColor,
                borderColor: borderColor,
                borderRadius: borderRadius,
                padding: padding,
              ),
              child: textWidget,
            )
          : TextButton.icon(
              onPressed: onPressed,
              icon: icon,
              style: PtButtonStyle.outlineStyle(
                isFull: isFull,
                backgroundColor:
                    isActive ? ColorTheme.tertiaryLight : backgroundColor,
                borderColor: borderColor,
                borderRadius: borderRadius,
                padding: padding,
              ),
              label: textWidget,
            ),
    );
  }

  static Widget round(
    String text, {
    Function()? onPressed,
    Color? backgroundColor,
    Color? textColor,
    double margin = 0,
    Widget? icon,
    TextSizeEnum fontSize = TextSizeEnum.subtitle,
    bool isFull = false,
    bool isDisabled = false,
    bool? isBold,
    int? maxLines,
    double borderRadius = Const.borderRadius,
    EdgeInsets? padding,
  }) {
    textColor ??= ColorTheme.white;
    isBold ??= false;
    backgroundColor ??=
        isDisabled ? ColorTheme.primaryLight : ColorTheme.primaryColor;
    final Widget titleWidget;
    if (fontSize == TextSizeEnum.subtitle) {
      titleWidget = TextWidget.subtitle(
        text,
        color: textColor,
        isBold: isBold,
        maxLines: maxLines,
      );
    } else if (fontSize == TextSizeEnum.title) {
      titleWidget = TextWidget.title(
        text,
        color: textColor,
        isBold: isBold,
        maxLines: maxLines,
      );
    } else if (fontSize == TextSizeEnum.caption) {
      titleWidget = TextWidget.caption(
        text,
        color: textColor,
        isBold: isBold,
        maxLines: maxLines,
      );
    } else {
      titleWidget = TextWidget.body(
        text,
        color: textColor,
        isBold: isBold,
        maxLines: maxLines,
      );
    }

    final Widget button;
    if (icon != null) {
      button = TextButton.icon(
        onPressed: isDisabled ? null : onPressed,
        style: PtButtonStyle.roundStyle(
          backgroundColor: backgroundColor,
          borderRadius: borderRadius,
          padding: padding,
        ),
        icon: icon,
        label: titleWidget,
      );
    } else {
      button = TextButton(
        onPressed: isDisabled ? null : onPressed,
        style: PtButtonStyle.roundStyle(
          backgroundColor: backgroundColor,
          isFull: isFull,
          borderRadius: borderRadius,
          padding: padding,
        ),
        child: titleWidget,
      );
    }

    return Padding(
      padding: EdgeInsets.only(
        left: margin,
        top: margin,
        bottom: margin,
        right: margin,
      ),
      child: button,
    );
  }
}
