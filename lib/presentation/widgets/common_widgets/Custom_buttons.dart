import 'package:flutter/material.dart';

import '../../../domain/utilities/app_color.dart';

class CustomButtons {
  static Widget regular({
    Function()? onPressed,
    String? text,
    Widget? child,
    double? border,
    Color? borderColor,
    Color? txtColor,
    Color? background,
    EdgeInsets? margin,
    double horizontalMargin = 0,
    double verticalMargin = 0,
    double? borderRadius,
    TextStyle? textStyle,
    ButtonStyle? style,
  }) {
    return Container(
      height: 45,
      margin: margin ??
          EdgeInsets.symmetric(
              horizontal: horizontalMargin, vertical: verticalMargin),
      child: ElevatedButton(
        style: style ??
            ElevatedButton.styleFrom(
              backgroundColor: background ?? AppColors.color25A5A3,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: borderColor ?? Colors.transparent),
                borderRadius: BorderRadius.circular(borderRadius ?? 5),
              ),
            ),
        onPressed: onPressed,
        child: child ??
            Center(
              child: Text(
                (text ?? "Button Text Here").toUpperCase(),
                textAlign: TextAlign.center,
                style: textStyle ??
                  TextStyle(color: AppColors.whiteColor),
              ),
            ),
      ),
    );
  }
}
