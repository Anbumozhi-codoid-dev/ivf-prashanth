
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'AppTheme.dart';

abstract class AppThemeManager{
  AppThemeManager._();
  static String defaultFont = 'Nunito';
  static String defaultFontMetro = 'Nunito';
  static TextStyle customTextStyleWithSize({required double size,
    FontWeight weight = FontWeight.normal,
    Color? color,
    double lineSpace = 1.0,
    bool isUnderlined = false,
    Color? underlineColor,
    double underlineThickness = 1.0}) {
    return TextStyle(
      fontFamily: AppThemeManager.defaultFont,
      height: lineSpace.sp,
      color: color ?? AppTheme.primaryColor1,
      fontWeight: weight,
      fontSize: size.sp,
      decoration: isUnderlined ? TextDecoration.underline : TextDecoration.none,
      decorationColor: underlineColor,
      decorationThickness: underlineThickness,
    );
  }

}