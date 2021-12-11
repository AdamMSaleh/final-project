// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, implementation_imports

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Btn/simple_btn.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/app_loading.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/enum_loading.dart';
import 'package:flutter_finalproject/Packages/Components/Toast/simple_toast.dart';
import 'package:flutter_finalproject/Packages/Components/location/addres.dart';
import 'package:flutter_finalproject/Packages/Components/text_filed/simple_filed.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/theme_status.dart';
import 'package:flutter_finalproject/Utils/path_images.dart';
import 'package:flutter_finalproject/validators/app_validators.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainteneanceProject extends StatefulWidget {
  static const String id = 'MainteneanceProject';
  @override
  State<MainteneanceProject> createState() => _MainteneanceProjectState();
}

class _MainteneanceProjectState extends State<MainteneanceProject> {
  final GlobalKey<FormState> _keyFoem = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.getTheme(context: context)
          ? AppColors.black
          : AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //* header
              Container(
                height: 175.h,
                decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100.r),
                    bottomRight: Radius.circular(100.r),
                  ),
                ),
                child:
                    //* header elements
                    Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 20.h),
                        Container(
                          alignment: Alignment.center,
                          //*Image
                          child: CachedNetworkImage(
                            imageUrl: PathImages.logo,
                            //لتعديل ع صورة
                            imageBuilder: (context, jjjjj) {
                              return CircleAvatar(
                                backgroundImage: jjjjj,
                                radius: 50.r, //لتكبير
                              );
                            },
                            placeholder: (context, url) =>
                                AppLoading(chooseLoading: ChooseLoading.IMAGE),

                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        //* tital
                        Text(
                          KeyLang.oneclickhome,
                          style: AppTheme.h5(context: context)
                              ?.copyWith(color: AppColors.white),
                        ).tr(),
                      ],
                    ),
                  ],
                ),
              ),
              //* page elements
              SizedBox(height: 15.h),

              //*form

              Container(
                margin: EdgeInsets.symmetric(horizontal: 50.h),
                child: Form(
                  key: _keyFoem,
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      //* project Name
                      SimpleFiled(
                        keyboardType: TextInputType.name,
                        onValidator: (value) => AppValidators.isEmpty(value),
                        hint: KeyLang.projectName.tr(),
                        pIcon: Icon(
                          Icons.home,
                          color: AppColors.blue,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      //* administrator's name
                      SimpleFiled(
                        keyboardType: TextInputType.name,
                        hint: KeyLang.administratoName.tr(),
                        pIcon: Icon(
                          Icons.person,
                          color: AppColors.blue,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      //*Address
                      Address(),
                      SizedBox(height: 15.h),
                      //* Starting Date
                      SimpleFiled(
                        keyboardType: TextInputType.datetime,
                        onValidator: (value) => AppValidators.isEmpty(value),
                        hint: KeyLang.startingDate.tr(),
                        pIcon: IconButton(
                          icon: Icon(
                            Icons.date_range_outlined,
                            color: AppColors.blue,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      //* Expiry Date
                      SizedBox(height: 10.h),
                      SimpleFiled(
                        keyboardType: TextInputType.datetime,
                        onValidator: (value) => AppValidators.isEmpty(value),
                        hint: KeyLang.expiryDate.tr(),
                        pIcon: IconButton(
                          icon: Icon(
                            Icons.date_range_sharp,
                            color: AppColors.blue,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(height: 15.h),
                      //* the owner's name
                      SimpleFiled(
                        keyboardType: TextInputType.name,
                        onValidator: (value) => AppValidators.isname(value),
                        hint: KeyLang.ownerName.tr(),
                        pIcon: Icon(
                          Icons.person,
                          color: AppColors.blue,
                        ),
                      ),
                      SizedBox(height: 15.h),

                      //*button
                      SizedBox(height: 5.h),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15.h),
                        child: Center(
                            child: SimpleBtn(
                                btnText: KeyLang.add.toUpperCase().tr(),
                                onTap: () async {
                                  if (_keyFoem.currentState!.validate()) {
                                    simpleToast(message: 'ok');
                                  }
                                })),
                      ),
                    ],
                  ),
                ),
              ), //*
            ],
          ),
        ),
      ),
    );
  }
}
