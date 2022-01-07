import 'package:flutter/material.dart';

class AppColors {
  // * Convert Color from Hex to type Flutter 0xFFdddddd

  static Color _colorFromHex(String hexColor) {
    final _color = hexColor.replaceAll('#', ''); //  #ffffff -> ffffff
    return Color(int.parse('FF$_color', radix: 16)); //  0-9 ABCDEF
  }

  // background   Color
  static Color blue = _colorFromHex('#741b47');
  static Color black = _colorFromHex('#141313');

  // fonte Color
  static Color white = _colorFromHex('#f0f1f5');
  static Color red = _colorFromHex('#e80914');
}
