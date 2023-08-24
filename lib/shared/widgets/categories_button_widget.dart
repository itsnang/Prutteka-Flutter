import 'package:flutter/material.dart';
import 'package:prutteka_flutter/shared/themes/color_theme.dart';
import 'package:prutteka_flutter/shared/themes/styles/button_style.dart';
import 'package:prutteka_flutter/shared/themes/theme.dart';
import 'package:prutteka_flutter/shared/widgets/text_widget.dart';

class CategoriesBtnWidget extends StatelessWidget {
  CategoriesBtnWidget(
    this.text, {
    super.key,
    this.isActive = false,
    required this.onPressed,
    this.isFull = false,
    this.margin = 0,
  });
  final String text;
  Function()? onPressed;
  bool isActive;
  bool isFull;
  double margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: margin,
        top: margin,
        bottom: margin,
        right: margin,
      ),
      child: TextButton(
        onPressed: onPressed,
        style: PtButtonStyle.outlineStyle(
          borderRadius: 30,
          borderColor: isActive ? context.primaryColor : context.disableColor,
          isFull: isFull,
          backgroundColor:
              isActive ? ColorTheme.primaryLight : context.backgroundColor,
        ),
        child: TextWidget.subtitle(
          text,
          isBold: isActive ? true : false,
          color: isActive ? context.primaryColor : context.outlineColor,
        ),
      ),
    );
  }
}
