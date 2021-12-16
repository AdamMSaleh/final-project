// ignore_for_file: file_names, sized_box_for_whitespace, duplicate_ignore, prefer_const_constructors, prefer_const_literals_to_create_immutables, implementation_imports

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

class PageInfoEng extends StatefulWidget {
  // ignore: unused_import
  const PageInfoEng({Key? key}) : super(key: key);
  static const String id = 'PageInfoEng';

  @override
  State<PageInfoEng> createState() => _PageInfoEngState();
}

class _PageInfoEngState extends State<PageInfoEng> {
  //*form key
  final GlobalKey<FormState> _keyFoem = GlobalKey<FormState>();
  Map<String, TextEditingController> controllerValue = {
    //Address
    'city_user': TextEditingController(),
    //eng_office_name
    'Guild_number': TextEditingController(),
    // eng_number
    'office_name': TextEditingController(),
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

                          // onPressed: () { Upload_ImageState().btnplane(context); },
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
                      //* eng number
                      SimpleFiled(
                        controller: controllerValue["Guild_number"],
                        keyboardType: TextInputType.name,
                        onValidator: (value) => AppValidators.engnumber(value),
                        hint: KeyLang.engnumber.tr(),
                        pIcon: Icon(
                          Icons.assignment_ind,
                          color: AppColors.blue,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      //*button up data Image
                      // syndicate_card
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  'upload Syndicate Card',
                                  style: AppTheme.h5(context: context)?.copyWith(
                                      color: AppColors.blue, fontSize: 20.sp),
                                ).tr(),
                              ),
                            ],
                          ),
                          SizedBox(width: 10.w),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                                        bathImage: 'syndicate_card',
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
                        ],
                      ),

                      SizedBox(height: 10.h),
                      //* eng office name
                      SimpleFiled(
                        controller: controllerValue["office_name"],
                        keyboardType: TextInputType.name,
                        onValidator: (value) => AppValidators.isname(value),
                        hint: KeyLang.engOfficeName.tr(),
                        pIcon: Icon(
                          Icons.account_balance,
                          color: AppColors.blue,
                        ),
                      ),

                      SizedBox(height: 15.h),
                      //*Address
                      SimpleFiled(
                        controller: controllerValue["city_user"],
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

                                    Register().postDataEngineer(
                                      city_user: controllerValue["city_user"]!,
                                      Guild_number:
                                          controllerValue["Guild_number"]!,
                                      office_name: controllerValue["office_name"]!,
                                      context: context,
                                    );
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
