import 'package:flutter/material.dart';

import '../../contracts.dart';

class AppThemeImpl implements AppTheme {
  final _textStyle = const TextStyle(fontSize: 14, fontWeight: FontWeight.normal);
  final _padding = const EdgeInsets.all(5.0);
  final _textAlign = TextAlign.center;

  @override
  AppTextStyle get mainTextStyle => AppTextStyle(
        textStyle: _textStyle,
        padding: _padding,
        textAlign: _textAlign,
      );

  @override
  AppTextStyle get titleTextStyle =>
      mainTextStyle.copyWith(textStyle: _textStyle.copyWith(fontSize: 24, fontWeight: FontWeight.bold));

  @override
  AppTextStyle get helpTextStyle => mainTextStyle.copyWith(textStyle: _textStyle.copyWith(fontWeight: FontWeight.w400));

  @override
  AppTextStyle get confidenceTextStyle =>
      mainTextStyle.copyWith(textStyle: _textStyle.copyWith(fontWeight: FontWeight.w300));
}
