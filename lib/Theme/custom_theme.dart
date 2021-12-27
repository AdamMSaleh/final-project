// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/style.dart';

class CustomTheme {
  // * * * * * * * * * * * * *** Light *** * * * * * * * * * * * *
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      color: AppColors.blue,
      iconTheme: IconThemeData(color: AppColors.white, size: 35),
      centerTitle: true,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.white,
    ),
    textTheme: TextTheme(
      headline1: AppStyles.styleHeadline1Light,
      headline2: AppStyles.styleHeadline2Light,
      headline3: AppStyles.styleHeadline3Light,
      headline4: AppStyles.styleHeadline4Light,
      headline5: AppStyles.styleHeadline5Light,
      headline6: AppStyles.styleHeadline6Light,
      subtitle1: AppStyles.styleSubtitle1Light,
      subtitle2: AppStyles.styleSubtitle2Light,
      bodyText1: AppStyles.styleBodyText1Light,
      bodyText2: AppStyles.styleBodyText2Light,
      button: AppStyles.styleButtonLight,
    ).apply(displayColor: Colors.black, bodyColor: Colors.black),
  );

  // * * * * * * * * * * * * *** Dark *** * * * * * * * * * * * *
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      color: AppColors.blue,
      iconTheme: IconThemeData(color: AppColors.white, size: 35),
      centerTitle: true,
    ),
    textTheme: TextTheme(
      headline1: AppStyles.styleHeadline1Dark,
      headline2: AppStyles.styleHeadline2Dark,
      headline3: AppStyles.styleHeadline3Dark,
      headline4: AppStyles.styleHeadline4Dark,
      headline5: AppStyles.styleHeadline5Dark,
      headline6: AppStyles.styleHeadline6Dark,
      subtitle1: AppStyles.styleSubtitle1Dark,
      subtitle2: AppStyles.styleSubtitle2Dark,
      bodyText1: AppStyles.styleBodyText1Dark,
      bodyText2: AppStyles.styleBodyText2Dark,
      button: AppStyles.styleButtonDark,
    ).apply(displayColor: Colors.white, bodyColor: Colors.white),
  );
}
