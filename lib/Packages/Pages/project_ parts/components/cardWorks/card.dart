// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields, use_key_in_widget_constructors, must_be_immutable, implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cardwork extends StatelessWidget {
  const Cardwork({required String typ, required String imge})
      : _typ = typ,
        _imge = imge;
  //* values
  final String _imge;
  final String _typ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 90.h,
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            child: Card(
              elevation: 10,
              child: Row(
                children: [
                  // * id App
                  Padding(
                    padding: EdgeInsets.all(8.w),
                    child: Text('1'),
                  ),
                  SizedBox(width: 10.w),
                  //* imeg
                  Padding(
                    padding: EdgeInsets.all(2.w),
                    child: Image(
                      image: AssetImage(_imge),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Padding(
                    padding: EdgeInsets.all(8.0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //* name
                        Expanded(
                          child: Text(
                            'adam',
                            style: AppStyles.styleHeadline1Light.copyWith(
                                color: AppColors.blue, fontSize: 15.h),
                          ),
                        ),
                        //* typ
                        Expanded(
                          child: Text(
                            _typ.tr(),
                            style: AppStyles.styleHeadline1Light.copyWith(
                                color: AppColors.blue, fontSize: 15.h),
                          ),
                        ),
                        //* start
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                '5',
                                style: AppStyles.styleHeadline1Light.copyWith(
                                    color: AppColors.blue, fontSize: 15.h),
                              ),
                              Icon(
                                Icons.star,
                                size: 15.sp,
                                color: AppColors.blue,
                              ),
                              SizedBox(width: 12.w),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
