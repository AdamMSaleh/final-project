// ignore_for_file: prefer_const_constructors, implementation_imports

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/app_loading.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/enum_loading.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/style.dart';
import 'package:flutter_finalproject/Utils/path_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AskUs extends StatelessWidget {
  const AskUs({Key? key}) : super(key: key);
  static const String id = 'AskUs';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CachedNetworkImage(
                imageUrl: PathImages.logo,
                //لتعديل ع صورة
                imageBuilder: (context, jjjjj) {
                  return CircleAvatar(
                    backgroundImage: jjjjj,
                    radius: 95.r, //لتكبير
                  );
                },
                placeholder: (context, url) =>
                    AppLoading(chooseLoading: ChooseLoading.IMAGE),
                // في حال خطاء بالاتصال بشبكة

                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            //* name
            Text(KeyLang.oneclickhome.tr(),
                style: AppStyles.welcome.copyWith(
                  color: AppColors.white,
                  fontSize: 35.h,
                )),
            SizedBox(
              height: 40,
            ),
            Card(
              elevation: 20,
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: AppColors.blue,
                ),
                title: Text(
                  'AdamMusaSaleh@gmail.com',
                  style: AppStyles.styleBodyText1Light
                      .copyWith(color: AppColors.blue, fontSize: 13.h),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            //طريقه الاسرع
            Card(
              elevation: 20,
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: AppColors.blue,
                ),
                title: Text(
                  '00962781149656',
                  style: AppStyles.styleBodyText1Light
                      .copyWith(color: AppColors.blue, fontSize: 13.h),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
