// ignore_for_file: use_key_in_widget_constructors, implementation_imports, unused_field

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NameRow extends StatelessWidget {
  const NameRow({required String name}) : _name = name;
  final String _name;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 10.w),
        Text(
          _name,
          style: AppStyles.styleHeadline3Light.copyWith(
            color: AppColors.black,
            fontSize: 25.sp,
          ),
        ).tr(),
      ],
    );
  }
}
