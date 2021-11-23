// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Packages/Components/cach_image/image_user.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Utils/path_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderDrawer extends StatelessWidget {
  const HeaderDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _sw = MediaQuery.of(context).size.width;
    return SizedBox(
      width: _sw,
      child: DrawerHeader(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.blue),
          ),
        ),
        child: Column(
          children: [
            ImageUser(
              image: PathImages.profile,
              radius: 45.r,
              sizeLoading: 40.r,
            ),
            /* SizedBox(height: 10.h),
            Text(
              KeyLang.name.tr(),
              style: AppStyles.styleHeadline3Light.copyWith(
                color: AppColors.blue,
                fontSize: 20.sp,
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
