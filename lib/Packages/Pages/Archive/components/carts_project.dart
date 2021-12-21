// ignore_for_file: unused_field, implementation_imports, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Packages/Components/cach_image/image_user.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/style.dart';
import 'package:flutter_finalproject/Utils/path_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartFProject extends StatelessWidget {
  const CartFProject({
    Key? key,
    required Function()? onTap,
    required String id,
    required String owner_name,
    required String num_project,
    required String date_receipt,
  })  : _onTap = onTap,
        _id = id,
        _owner_name = owner_name,
        _num_project = num_project,
        _date_receipt = date_receipt,
        super(key: key);

  final Function()? _onTap;
  final String _id;
  final String _owner_name;

  final String _num_project;
  final String _date_receipt;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h),
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
                          .copyWith(color: AppColors.blue, fontSize: 20.h),
                    ),
                  ),

                  //* logo
                  Container(
                    height: 65.w,
                    width: 65.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 2,
                        color: AppColors.blue,
                      ),
                    ),
                    child: ImageUser(
                      image: PathImages.logo,
                      radius: 20.r,
                      sizeLoading: 20.r,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  //* nn
                  Padding(
                    padding: EdgeInsets.all(8.0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //* name project
                        Expanded(
                          child: Text(
                            _num_project,
                            style: AppStyles.styleHeadline1Light.copyWith(
                                color: AppColors.blue, fontSize: 20.h),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        //* owner name
                        Expanded(
                          child: Text(
                            _owner_name,
                            style: AppStyles.styleHeadline1Light.copyWith(
                                color: AppColors.blue, fontSize: 15.h),
                          ),
                        ),
                        //* date_receipt
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                _date_receipt,
                                style: AppStyles.styleHeadline1Light.copyWith(
                                    color: AppColors.blue, fontSize: 10.h),
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
