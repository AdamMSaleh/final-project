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
            SizedBox(height: 7.h),
            Container(
              height: 105.w,
              width: 105.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 3,
                  color: AppColors.blue,
                ),
              ),
              child: ImageUser(
                image: PathImages.logo,
                radius: 15.r,
                sizeLoading: 20.r,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
