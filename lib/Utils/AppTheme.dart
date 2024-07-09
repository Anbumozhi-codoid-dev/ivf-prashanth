import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'AppThemeManager.dart';

abstract class AppTheme{

  static const Color white=Color(0xFFFFFFFF);
  static const Color white1=Color(0xFFe5e5e5);
  static const Color pageBackgroundWhite=Color(0xFFFFFFFF);
   static const Color themeBlue =Color(0xFF0066BE);


  // static const Color fontBlack=Color.fromRGBO(42, 42, 42, 1);
  static const Color black=Colors.black;
  static const Color black2=Colors.black54;

  static  Color? gery300 = Colors.grey[300];
  static  Color? borderGrey = Colors.grey;
  static  Color? fontGrey = Color(0xFF808080);

  static const Color primaryColor1=Colors.red;
  // static const Color primaryColor1=Color(0xFFF79C37);
  static const Color whiteColor=Color(0xFFFFFFFF);
  // static const Color primaryColor2=Color(0xFFF26639);
  static const Color primaryColor2=Color(0xFFF26639);
  static const Color blackColor = Color(0xFF000000);
  static const Color LightGrey = Color(0xFFE5E4E2);
  static const Color backgroundColor = Color(0x00ffffff);
  static const Color themeLightGrey = Color(0xFF959393);
  static const Color themeDarkGrey = Color(0xFF555454);
  static const Color FontGrey = Color(0xFF626262);
  static const Color fontBlack = Color.fromRGBO(42,42,42, 1);
  static const Color themePink = Color(0xFFF451A0);
  static const Color arrowPink = Color(0xFFED72AD);
  static const Color dashboardBG = Color(0xFFFEF9FC);
  // static const Color themePink = Color(0xFFF555A2);
  static const Color bloodDropRed = Color(0xFFFF5454);
  static const Color bloodLineRed = Color(0xFFFFBFBF);
  static const Color textPink = Color(0xFFE8388D);
  static const Color textPurple = Color(0xFF752B8E);
  static const Color formFieldGrey = Color(0xFFF4F4F4);
  static const Color bloodRed = Color(0xFFFF5454);
  static const Color normalGreen = Color(0xFF049825);
  static const Color grey = Color(0xFF707070);
  static const Color lightPink = Color(0xFFFFE1F0);
  static const Color gradientPink = Color(0xFFE8388D);
  static const Color gradientPurple = Color(0xFF752B8E);
  static const Color circleGrey = Color(0xFFF5F5F5);





  static TextStyle customTextStyleWithSize(
      {required double size,
        FontWeight weight = FontWeight.bold,
        Color? color,
        double lineSpace = 1.0,
        bool isUnderlined = false,
        Color? underlineColor,
        double underlineThickness = 1.0}) {
    return TextStyle(
      fontFamily: AppThemeManager.defaultFontMetro,
      fontSize: 12.0.sp,
      letterSpacing: 0.3.sp,
      fontWeight: FontWeight.w500,
      color: AppTheme.primaryColor1,
      decoration: isUnderlined ? TextDecoration.underline : TextDecoration.none,
      decorationColor: underlineColor,
      decorationThickness: underlineThickness,
      backgroundColor: AppTheme.backgroundColor,
    );
  }



}