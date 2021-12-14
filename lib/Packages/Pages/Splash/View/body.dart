// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_constructors, duplicate_ignore, unused_import, implementation_imports

import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/app_loading.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/enum_loading.dart';
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
    super.initState();
    // ignore: prefer_const_constructors
    /* Timer(Duration(seconds: 7), () {
      Navigator.pushReplacementNamed(context, PageLogin.id);
    });*/
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
              Center(
                child: Container(
                  height: 175.w,
                  width: 175.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2,
                      color: Colors.white,
                    ),
                    image: DecorationImage(
                      image: AssetImage(PathImages.projectIcon),
                      fit: BoxFit.fill,
                    ),
                  ),
                ), //لتكبير
              ),
              SizedBox(
                height: 20,
              ),
              Text(KeyLang.welcome.tr(),
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
