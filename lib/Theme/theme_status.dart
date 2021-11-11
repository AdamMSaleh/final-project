import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
// * status Mode
  static bool getTheme({required BuildContext context}) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  // * headline5
  static TextStyle? h5({required BuildContext context}) {
    return Theme.of(context).textTheme.headline5;
  }

  // * headline6
  static TextStyle? h6({required BuildContext context}) {
    return Theme.of(context).textTheme.headline6;
  }

  // * bodyText1
  static TextStyle? b1({required BuildContext context}) {
    return Theme.of(context).textTheme.bodyText1;
  }
}
