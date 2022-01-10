// ignore_for_file: non_constant_identifier_names, implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartTask extends StatelessWidget {
  const CartTask({
    Key? key,
    required Function()? onTap,
    required String id,
    required String manager_name,
    required String operation,
    required String starting_date,
    required String expiry_date,
  })  : _onTap = onTap,
        _id = id,
        _manager_name = manager_name,
        _operation = operation,
        _starting_date = starting_date,
        _expiry_date = expiry_date,
        super(key: key);

  final Function()? _onTap;
  final String _id;
  final String _manager_name;

  final String _operation;
  final String _starting_date;
  final String _expiry_date;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5.h),
        GestureDetector(
          onTap: _onTap,
          child: Container(
            height: 90.h,
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            child: Card(
              elevation: 10,
              child: Row(
                children: [
                  // * stage number
                  Padding(
                    padding: EdgeInsets.all(8.w),
                    child: Text(
                      _id,
                      style: AppStyles.styleHeadline1Light
                          .copyWith(color: AppColors.blue, fontSize: 15.h),
                    ),
                  ),

                  SizedBox(width: 10.w),
                  //* 2colum
                  Padding(
                    padding: EdgeInsets.all(8.0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //* THE OPERATION
                        Expanded(
                          child: Text(
                            _operation,
                            style: AppStyles.styleHeadline1Light.copyWith(
                                color: AppColors.blue, fontSize: 20.h),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        //* manager name
                        Expanded(
                          child: Text(
                            _manager_name,
                            style: AppStyles.styleHeadline1Light.copyWith(
                                color: AppColors.blue, fontSize: 15.h),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20.w),
                  //* 3colum
                  Padding(
                    padding: EdgeInsets.all(8.0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //* Starting date string
                        Expanded(
                          child: Text(
                            KeyLang.startingDate.tr(),
                            style: AppStyles.styleHeadline1Light.copyWith(
                                color: AppColors.blue, fontSize: 15.h),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        //* Expiry Date String
                        Expanded(
                          child: Text(
                            KeyLang.expiryDate.tr(),
                            style: AppStyles.styleHeadline1Light.copyWith(
                                color: AppColors.blue, fontSize: 15.h),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5.w),
                  //* 4colum
                  Padding(
                    padding: EdgeInsets.all(8.0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //* Starting date
                        Expanded(
                          child: Text(
                            _starting_date,
                            style: AppStyles.styleHeadline1Light.copyWith(
                                color: AppColors.blue, fontSize: 13.h),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        //* Expiry Date
                        Expanded(
                          child: Text(
                            _expiry_date,
                            style: AppStyles.styleHeadline1Light.copyWith(
                                color: AppColors.blue, fontSize: 13.h),
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
