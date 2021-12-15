// ignore_for_file: unused_field, implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartFProject extends StatelessWidget {
  const CartFProject({Key? key, required Function()? onTap, required String id})
      : _onTap = onTap,
        _id = id,
        super(key: key);

  final Function()? _onTap;
  final String _id;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        GestureDetector(
          onTap: _onTap,
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
                    child: Text(
                      _id,
                      style: AppStyles.styleHeadline1Light
                          .copyWith(color: AppColors.blue, fontSize: 15.h),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  //* imeg
                  Padding(
                    padding: EdgeInsets.all(2.w),
                    child: const Image(
                      image: AssetImage(""),
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
                            "".tr(),
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
