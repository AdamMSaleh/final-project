// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/style.dart';
import 'package:flutter_finalproject/Theme/theme_status.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RichTextAuth extends StatelessWidget {
  const RichTextAuth(
      {Key? key,
      required String fword,
      required String sword,
      required Function() onTap})
      : _fword = fword,
        _sword = sword,
        _onTap = onTap,
        super(key: key);

  final String _fword;
  final String _sword;
  final Function() _onTap;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: _fword.tr(),
            style: AppStyles.styleHeadline1Light.copyWith(
              fontSize: 15.sp,
              color: AppTheme.getTheme(context: context)
                  ? Colors.white
                  : AppColors.blue,
            ),
          ),
          TextSpan(
            text: _sword.tr(),
            style: AppStyles.styleHeadline1Light.copyWith(
              fontSize: 15.sp,
              color: AppColors.red,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = _onTap,
          )
        ],
      ),
    );
  }
}
