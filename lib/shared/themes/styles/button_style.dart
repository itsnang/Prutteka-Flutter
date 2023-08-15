import 'package:flutter/material.dart';

class PtButtonStyle {
  PtButtonStyle._();

  static ButtonStyle roundStyle({
    Color? backgroundColor,
    bool isFull = false,
    EdgeInsets? padding,
    required double borderRadius,
  }) {
    return ButtonStyle(
      fixedSize: isFull
          ? MaterialStateProperty.all(
              const Size(
                double.maxFinite,
                double.infinity,
              ),
            )
          : null,
      padding: MaterialStateProperty.all(
        padding ??
            const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 12,
              bottom: 12,
            ),
      ),
      backgroundColor: MaterialStateProperty.all(
        backgroundColor,
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }

  static ButtonStyle outlineStyle({
    Color borderColor = Colors.black,
    bool isFull = false,
    Color? backgroundColor,
    required double borderRadius,
    EdgeInsets? padding,
    Color? iconColor,
  }) {
    return ButtonStyle(
      fixedSize: isFull
          ? MaterialStateProperty.all(
              const Size(
                double.maxFinite,
                double.infinity,
              ),
            )
          : null,
      padding: MaterialStateProperty.all(
        padding ??
            const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      side: MaterialStateProperty.all(
        BorderSide(color: borderColor),
      ),
      iconColor: MaterialStateProperty.all(iconColor),
      backgroundColor: MaterialStateProperty.all(backgroundColor),
    );
  }
}
