// ignore_for_file: prefer_const_constructors, unused_element

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static final TextStyle h1 = TextStyle();

  // * * * * * * * * * * * * *** font type *** * * * * * * * * * * *
  //لتغير الخط
  static TextStyle _fontType({TextStyle? style}) {
    return GoogleFonts.aBeeZee(textStyle: style);
    //
  }

  static TextStyle _fontT({TextStyle? style}) {
    return GoogleFonts.aladin(textStyle: style);
  }
  //

  static TextStyle _fontwelcome({TextStyle? style}) {
    return GoogleFonts.playfairDisplay(textStyle: style);
  }

  // ?----------------------------- style Ligth ----------------------

  // *********************** Headers ********************************
  static TextStyle styleHeadline1Light = _fontType();
  static TextStyle styleHeadline2Light = _fontType();
  static TextStyle styleHeadline3Light = _fontT();
  static TextStyle styleHeadline4Light = _fontType();
  static TextStyle styleHeadline5Light = _fontType();
  static TextStyle styleHeadline6Light = _fontType();
  // *********************** Subtitle ********************************
  static TextStyle styleSubtitle1Light = _fontType();
  static TextStyle styleSubtitle2Light = _fontType();
  // *********************** BodyText ********************************
  static TextStyle styleBodyText1Light = _fontType();
  static TextStyle styleBodyText2Light = _fontType();
  // *********************** Button ********************************
  static TextStyle styleButtonLight = _fontType();

  // ?-------------------------- Style Dark --------------------------
  // *********************** Headers ********************************
  static TextStyle styleHeadline1Dark = _fontType();
  static TextStyle styleHeadline2Dark = _fontType();
  static TextStyle styleHeadline3Dark = _fontType();
  static TextStyle styleHeadline4Dark = _fontType();
  static TextStyle styleHeadline5Dark = _fontType();
  static TextStyle styleHeadline6Dark = _fontType();
  // *********************** Subtitle ********************************
  static TextStyle styleSubtitle1Dark = _fontType();
  static TextStyle styleSubtitle2Dark = _fontType();
  // *********************** BodyText ********************************
  static TextStyle styleBodyText1Dark = _fontType();
  static TextStyle styleBodyText2Dark = _fontType();
  // *********************** Button ********************************
  static TextStyle styleButtonDark = _fontType();
  // *********************** wolcomSplash ***************************
  static TextStyle welcome = _fontwelcome();
}
