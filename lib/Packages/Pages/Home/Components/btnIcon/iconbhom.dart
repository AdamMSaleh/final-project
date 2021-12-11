// ignore_for_file: unused_field, use_key_in_widget_constructors, unused_import, prefer_const_constructors, avoid_unnecessary_containers, implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Packages/Pages/NewProject/components/BoxDialog/dialog.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/style.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconBHome extends StatelessWidget {
  const IconBHome(
      {void Function()? onTap, required String btnName, required String imag})
      : _onTap = onTap,
        _btnName = btnName,
        _imag = imag;

  final void Function()? _onTap;
  final String _btnName;
  final String _imag;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.blue,
            radius: 45.r,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Image(
                  image: AssetImage(_imag),
                ),
              ],
            ),
          ),
          Text(
            _btnName.tr(),
            style: AppStyles.styleHeadline3Light.copyWith(
              color: AppColors.blue,
              fontSize: 20.sp,
            ),
          ),
        ],
      ),
    );
  }
}
