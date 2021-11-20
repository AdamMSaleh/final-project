// ignore_for_file: prefer_const_constructors, implementation_imports, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_import

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Pages/NewProject/View/maintenance_project.dart';
import 'package:flutter_finalproject/Packages/Pages/NewProject/View/new_project.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/style.dart';
import 'package:flutter_finalproject/Utils/path_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoxDialog extends StatelessWidget {
  const BoxDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(0),
      title: Text(
        KeyLang.projectType.tr(),
        style: AppStyles.styleHeadline3Light.copyWith(
          color: AppColors.blue,
          fontSize: 20.sp,
        ),
        textAlign: TextAlign.center,
      ),
      content: Container(
        height: 120.h,
        child: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //* maintenance
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      MainteneanceProject.id,
                    );
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        PathIcons.maintenance,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        KeyLang.maintenance.tr(),
                        style: AppStyles.styleHeadline3Light.copyWith(
                          color: AppColors.blue,
                          fontSize: 20.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                //* building

                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      NewProject.id,
                    );
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Image.asset(
                          PathIcons.building,
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          KeyLang.building.tr(),
                          style: AppStyles.styleHeadline3Light.copyWith(
                            color: AppColors.blue,
                            fontSize: 20.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        OutlinedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            KeyLang.cancel.tr(),
            style: AppStyles.styleHeadline3Light.copyWith(
              color: AppColors.blue,
              fontSize: 20.sp,
            ),
          ),
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.sp),
            ),
          ),
        )
      ],
    );
  }
}
