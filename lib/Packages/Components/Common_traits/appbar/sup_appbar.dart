// ignore_for_file: use_key_in_widget_constructors, unused_field, prefer_const_constructors_in_immutables, no_logic_in_create_state, implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBSup extends StatefulWidget implements PreferredSizeWidget {
  AppBSup({required txt}) : _txt = txt;
  final String _txt;
  @override
  State<AppBSup> createState() => _AppBSupState(txt: _txt);

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class _AppBSupState extends State<AppBSup> {
  _AppBSupState({required txt}) : _txt = txt;
  final String _txt;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.blue,
      toolbarHeight: 60.h,
      title: Text(_txt,
          style: AppStyles.styleHeadline3Light.copyWith(
            color: AppColors.white,
            fontSize: 23.sp,
          )).tr(),
    );
  }
}
