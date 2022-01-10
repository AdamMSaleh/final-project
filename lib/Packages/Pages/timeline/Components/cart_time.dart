// ignore_for_file: use_key_in_widget_constructors, implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Pages/Home/Components/mnuBox/icon_box.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardTime extends StatelessWidget {
  const CardTime(
      {required String startDate,
      required String expiryDate,
      required Function()? onTap})
      : _startDate = '  ' + startDate,
        _expiryDate = '  ' + expiryDate,
        _onTap = onTap;
  //* values

  final String _startDate;
  final Function()? _onTap;
  final String _expiryDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _onTap,
          child: Container(
            height: 90.h,
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            child: Card(
              elevation: 10,
              //* Methode represents her location in home/components/mnuBox/icon_box.dart'
              child: IconBox(
                hrizntl: 15,
                chldrn: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //* StartDate
                            Expanded(
                              child: Text(
                                KeyLang.startingDate.tr(),
                                style: AppStyles.styleHeadline1Light.copyWith(
                                    color: AppColors.blue, fontSize: 18.h),
                              ),
                            ),
                            //* startDate
                            Expanded(
                              child: Center(
                                child: Text(
                                  _startDate,
                                  style: AppStyles.styleHeadline1Light.copyWith(
                                      color: AppColors.blue, fontSize: 15.h),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //* expiryDate
                            Expanded(
                              child: Text(
                                KeyLang.expiryDate.tr(),
                                style: AppStyles.styleHeadline1Light.copyWith(
                                    color: AppColors.blue, fontSize: 18.h),
                              ),
                            ),
                            //* expiryDate
                            Expanded(
                              child: Center(
                                child: Text(
                                  _expiryDate,
                                  style: AppStyles.styleHeadline1Light.copyWith(
                                      color: AppColors.blue, fontSize: 15.h),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
