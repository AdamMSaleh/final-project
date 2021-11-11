// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/enum_loading.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({required ChooseLoading chooseLoading, double size = 45})
      : _chooseLoading = chooseLoading,
        _size = size;

  final ChooseLoading _chooseLoading;
  final double _size;

  @override
  Widget build(BuildContext context) {
    switch (_chooseLoading) {
      case ChooseLoading.PROFILE:
        return SpinKitSpinningCircle(
          size: _size.sp,
          color: AppColors.white,
        );
      case ChooseLoading.IMAGE:
        return SpinKitFadingCircle(
          size: _size.sp,
          color: AppColors.white,
        );
      case ChooseLoading.PAGE:
        return SpinKitDoubleBounce(
          size: _size.sp,
          color: AppColors.white,
        );
      case ChooseLoading.WEBVIEW:
        return SpinKitWanderingCubes(
          size: _size.sp,
          color: AppColors.white,
        );
    }
  }
}
