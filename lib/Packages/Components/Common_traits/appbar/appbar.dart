// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, implementation_imports, unused_import

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/DataBase/register.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/cach_image/image_user.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/style.dart';
import 'package:flutter_finalproject/Utils/path_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBHome extends StatefulWidget implements PreferredSizeWidget {
  @override
  State<AppBHome> createState() => _AppBHomeState();

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class _AppBHomeState extends State<AppBHome> {
  @override
  void initState() {
    Register().getDataImage_user().then((String result){
      setState(() {
        PathImages.profile = result;
      });
    });
    super.initState();
    // ignore: prefer_const_constructors

  }
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.blue,
      toolbarHeight: 65.h,
      title: Text('Relax'),
      // Text(KeyLang.oneclickhome,
      //     style: AppStyles.styleHeadline3Light.copyWith(
      //       color: AppColors.white,
      //       fontSize: 25.sp,
      //     )).tr(),
      actions: [
        Padding(
          padding: EdgeInsets.all(3.w),
          child: ImageUser(
              image: PathImages.profile, radius: 25.r, sizeLoading: 25.r),
        ),
        SizedBox(
          width: 7.w,
        )
      ],
    );
  }
}
