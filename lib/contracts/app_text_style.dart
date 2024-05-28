import 'package:flutter/material.dart';

class AppTextStyle {
  const AppTextStyle({required this.textStyle, required this.padding, required this.textAlign});

  final TextStyle textStyle;
  final EdgeInsets padding;
  final TextAlign textAlign;
}

extension AppTextStyleCopyWith on AppTextStyle {
  AppTextStyle copyWith({
    EdgeInsets? padding,
    TextAlign? textAlign,
    TextStyle? textStyle,
  }) {
    return AppTextStyle(
      padding: padding ?? this.padding,
      textAlign: textAlign ?? this.textAlign,
      textStyle: textStyle ?? this.textStyle,
    );
  }
}
