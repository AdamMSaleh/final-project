// ignore_for_file: prefer_const_constructors, implementation_imports

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
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

class PageInfowner extends StatefulWidget {
  String email;
   PageInfowner({Key? key,required this.email }) : super(key: key);
  static const String id = 'PageInfowner';

  @override
  State<PageInfowner> createState() => _PageInfownerState();
}

class _PageInfownerState extends State<PageInfowner> {
  //*form key
  final GlobalKey<FormState> _keyFoem = GlobalKey<FormState>();
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

                      //*Address
                      SimpleFiled(
                        keyboardType: TextInputType.name,
                        onValidator: (value) => AppValidators.isEmpty(value),
                        // controller: ,
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
                                  if (_keyFoem.currentState!.validate()) {}
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
