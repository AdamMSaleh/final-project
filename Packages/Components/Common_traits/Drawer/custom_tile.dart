// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListTileDrawer extends StatelessWidget {
  final String _icon;
  final String _title;
  final Widget? _iconTrailing;
  final Function() _onPress;

  ListTileDrawer(
      {required String icon,
      required String title,
      Widget? iconTrailing,
      required Function() onPress})
      : _icon = icon,
        _title = title,
        _iconTrailing = iconTrailing,
        _onPress = onPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image(
        width: 50.w,
        image: AssetImage(
          _icon,
        ),
      ),
      title: Text(
        _title.tr(),
        style: AppStyles.styleHeadline1Light.copyWith(
          color: AppColors.blue,
          fontSize: 20.sp,
        ),
      ),
      trailing: _iconTrailing ?? Container(width: 5),
      onTap: _onPress,
    );
  }
}
