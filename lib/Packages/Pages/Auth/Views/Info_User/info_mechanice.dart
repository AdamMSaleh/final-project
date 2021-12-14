// ignore_for_file: prefer_const_constructors, implementation_imports, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/DataBase/register.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Add_Image/alert_choose.dart';
import 'package:flutter_finalproject/Packages/Components/Add_Image/info_imeg.dart';
import 'package:flutter_finalproject/Packages/Components/Btn/simple_btn.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/app_loading.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/enum_loading.dart';
import 'package:flutter_finalproject/Packages/Components/text_filed/simple_filed.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/theme_status.dart';
import 'package:flutter_finalproject/Utils/path_images.dart';
import 'package:flutter_finalproject/validators/app_validators.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageInfoMech extends StatefulWidget {
  const PageInfoMech({Key? key}) : super(key: key);
  static const String id = "PageInfoMech";

  @override
  State<PageInfoMech> createState() => _PageInfoMechState();
}

class _PageInfoMechState extends State<PageInfoMech> {
  //*form key
  final GlobalKey<FormState> _keyFoem = GlobalKey<FormState>();
  Map<String, TextEditingController> controllerValue = {
    'license_no': TextEditingController(),
    'Type': TextEditingController(),
    'city_user': TextEditingController(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //* header
              Container(
                height: 175.h,
                decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(100.r)),
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
              SizedBox(height: 10.h),
              //*imag
              InfoImage(),
              //*form

              Container(
                margin: EdgeInsets.symmetric(horizontal: 50.h),
                child: Form(
                  key: _keyFoem,
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      //*type mechanice.dart
                      SimpleFiled(
                        controller: controllerValue['Type'],
                        keyboardType: TextInputType.name,
                        onValidator: (value) => AppValidators.isEmpty(value),
                        hint: KeyLang.typeMechanice.tr(),
                        pIcon: Icon(
                          Icons.agriculture,
                          color: AppColors.blue,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      //*license Number
                      SimpleFiled(
                        controller: controllerValue['license_no'],
                        keyboardType: TextInputType.name,
                        onValidator: (value) => AppValidators.isEmpty(value),
                        hint: KeyLang.licenseNumber.tr(),
                        pIcon: Icon(
                          Icons.badge_sharp,
                          color: AppColors.blue,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      //*boutton updata

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              KeyLang.uploadlicense,
                              style: AppTheme.h5(context: context)?.copyWith(
                                  color: AppColors.blue, fontSize: 20.sp),
                            ).tr(),
                          ),
                          SizedBox(width: 10.w),
                          Container(
                            width: 50.w,
                            height: 30.h,
                            // height: 100.w,
                            decoration: BoxDecoration(
                              color: AppColors.blue,
                              borderRadius: BorderRadius.all(
                                Radius.circular(100.r),
                              ),
                            ),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              alignment: Alignment.center,
                              onPressed: () {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) => AlertChooseImage(
                                    bathImage: 'Driver_license',
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.backup_rounded,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10.h),

                      //*Address
                      SimpleFiled(
                        controller: controllerValue['city_user'],
                        keyboardType: TextInputType.name,
                        onValidator: (value) => AppValidators.isEmpty(value),
                        hint: KeyLang.address.tr(),
                        pIcon: Icon(
                          Icons.add_location_alt_rounded,
                          color: AppColors.blue,
                        ),
                      ),

                      SizedBox(height: 25.h),

                      //*button
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 25.h),
                        child: Center(
                            child: SimpleBtn(
                                btnText: KeyLang.register.toUpperCase().tr(),
                                onTap: () async {
                                  if (_keyFoem.currentState!.validate()) {
                                    Register().postDataDrivers(
                                        city_user:
                                            controllerValue['city_user']!,
                                        Type: controllerValue['Type']!,
                                        license_no:
                                            controllerValue['license_no']!,
                                        context: context);
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
