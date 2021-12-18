// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_constructors, duplicate_ignore, unused_import, implementation_imports

import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/DataBase/register.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/app_loading.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/enum_loading.dart';
import 'package:flutter_finalproject/Packages/Components/user_info_secure_storage/user_save_login.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/login.dart';
import 'package:flutter_finalproject/Packages/Pages/Home/View/body.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/style.dart';
import 'package:flutter_finalproject/Utils/path_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageSplash extends StatefulWidget {
  static const String id = 'PageSplash';

  @override
  _PageSplashState createState() => _PageSplashState();
}

class _PageSplashState extends State<PageSplash> {
  @override
  void initState() {
    Register().getDataImage_user().then((String result) {
      setState(() {
        PathImages.profile = result;
      });
    });
    super.initState();
    // ignore: prefer_const_constructors
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, PageLogin.id);
      Register().splashLogin(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: PathImages.logo,
                //لتعديل ع صورة
                imageBuilder: (context, jjjjj) {
                  return CircleAvatar(
                    backgroundImage: jjjjj,
                    radius: 100.r, //لتكبير
                  );
                },
                placeholder: (context, url) =>
                    AppLoading(chooseLoading: ChooseLoading.IMAGE),
                // في حال خطاء بالاتصال بشبكة

                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              SizedBox(
                height: 20,
              ),
              Text(KeyLang.welcome,
                  style: AppStyles.welcome.copyWith(
                    color: AppColors.white,
                    fontSize: 35.h,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
