// ignore_for_file: use_key_in_widget_constructors, implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimpleBtnUp extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  SimpleBtnUp({void Function()? onTap, required String btnText})
      : _onTap = onTap,
        _btnText = btnText;

  final void Function()? _onTap;
  final String _btnText;
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return InkWell(
        // borderRadius: BorderRadius.circular(20.r),
        onTap: _onTap,
        child: Container(
          width: _size.width,
          height: 35.h,
          decoration: BoxDecoration(
            color: AppColors.blue,
            /*  borderRadius: BorderRadius.all(
              Radius.circular(100.r),
            ),*/
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_btnText,
                  style: AppStyles.styleHeadline1Light.copyWith(
                    color: AppColors.white,
                    fontSize: 20.sp,
                  )).tr(),
              Icon(
                Icons.backup_rounded,
                color: AppColors.white,
              ),
            ],
          ),
        ));
  }
}
