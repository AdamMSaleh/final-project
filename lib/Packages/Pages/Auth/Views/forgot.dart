// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_constructors, unused_field, implementation_imports, unused_local_variable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Btn/simple_btn.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/app_loading.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/enum_loading.dart';
import 'package:flutter_finalproject/Packages/Components/text_filed/simple_filed.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/style.dart';
import 'package:flutter_finalproject/Theme/theme_status.dart';
import 'package:flutter_finalproject/Utils/path_images.dart';
import 'package:flutter_finalproject/validators/app_validators.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageForgetPass extends StatelessWidget {
  static const String id = 'PageForgetPass';

  //*form key
  final GlobalKey<FormState> _keyFoem = GlobalKey<FormState>();
  //*email
  String? _email;

  @override
  Widget build(BuildContext context) {
    // * access Provider AuthService
    DateTime timeBackPressed = DateTime.now();
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  //*Image
                  child: CachedNetworkImage(
                    imageUrl: PathImages.logo,
                    //لتعديل ع صورة
                    imageBuilder: (context, jjjjj) {
                      return CircleAvatar(
                        backgroundImage: jjjjj,
                        radius: 75.r, //لتكبير
                      );
                    },
                    placeholder: (context, url) =>
                        AppLoading(chooseLoading: ChooseLoading.IMAGE),

                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                //*tital
                Text(KeyLang.oneclickhome,
                    style: AppStyles.styleHeadline1Light.copyWith(
                      color: AppColors.white,
                      fontSize: 40.sp,
                    )).tr(),
                SizedBox(height: 20.h),
                //*box
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                      color: AppTheme.getTheme(context: context)
                          ? AppColors.black
                          : AppColors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50.r),
                        topRight: Radius.circular(50.r),
                      ),
                    ),
                    child: Form(
                      key: _keyFoem,
                      child: Column(
                        children: [
                          //* tital box
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15.w),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              KeyLang.forgot,
                              style: AppStyles.styleHeadline1Light.copyWith(
                                color: AppColors.blue,
                                fontSize: 30.sp,
                              ),
                            ).tr(),
                          ),
                          SizedBox(height: 7.h),
                          //*text
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15.w),
                            alignment: Alignment.center,
                            child: Text(
                              KeyLang.hintResetPass,
                              style: AppStyles.styleHeadline1Light.copyWith(
                                color: AppTheme.getTheme(context: context)
                                    ? AppColors.white
                                    : AppColors.black,
                                fontSize: 20.sp,
                              ),
                            ).tr(),
                          ),
                          SizedBox(height: 15.h),
                          //*email
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 25.w),
                            alignment: Alignment.center,
                            child: SimpleFiled(
                              keyboardType: TextInputType.emailAddress,
                              onValidator: (value) =>
                                  AppValidators.isEmail(value),
                              onSaved: (value) => _email = value ?? '',
                              hint: KeyLang.email,
                              pIcon: Icon(
                                Icons.email,
                                color: AppColors.blue,
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          //*button
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 25.w),
                            child: Center(
                              child: SimpleBtn(
                                onTap: () {
                                  if (_keyFoem.currentState!.validate()) {}
                                },
                                btnText: KeyLang.send.toUpperCase().tr(),
                              ),
                            ),
                          ),

                          SizedBox(height: 25.h),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
