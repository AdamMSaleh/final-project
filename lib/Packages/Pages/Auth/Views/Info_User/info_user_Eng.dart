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
import 'package:flutter_finalproject/Packages/Pages/NewProject/components/Button/but_up.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/theme_status.dart';
import 'package:flutter_finalproject/Utils/path_images.dart';
import 'package:flutter_finalproject/validators/app_validators.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    DateTime timeBackPressed = DateTime.now();
    return WillPopScope(
        onWillPop: () async {
          final difference = DateTime.now().difference(timeBackPressed);
          final isExitWarning = difference >= Duration(seconds: 2);

          timeBackPressed = DateTime.now();
          if (isExitWarning) {
            const message = 'Press back again to exit';
            Fluttertoast.showToast(msg: message, fontSize: 18);
            return false;
          } else {
            Fluttertoast.cancel();
            return false;
          }
        },
        child: Scaffold(
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
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100.r),
                          bottomRight: Radius.circular(100.r)),
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
                                placeholder: (context, url) => AppLoading(
                                    chooseLoading: ChooseLoading.IMAGE),

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
                  InfoImageState(),
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
                            onValidator: (value) =>
                                AppValidators.engnumber(value),
                            hint: KeyLang.engnumber.tr(),
                            pIcon: Icon(
                              Icons.assignment_ind,
                              color: AppColors.blue,
                            ),
                          ),

                          SizedBox(height: 15.h),
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
                            onValidator: (value) =>
                                AppValidators.isEmpty(value),
                            hint: KeyLang.address.tr(),
                            pIcon: Icon(
                              Icons.add_location_alt_rounded,
                              color: AppColors.blue,
                            ),
                          ),
                          SizedBox(height: 15.h),
                          //*button up data Image
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 25.h),
                            child: Center(
                                child: SimpleBtnUp(
                              btnText: KeyLang.uploadlicense.tr(),
                              onTap: () {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) => AlertChooseImage(
                                    bathImage: 'syndicate_card',
                                  ),
                                );
                              },
                            )),
                          ),
                          SizedBox(height: 25.h),

                          //*button
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 25.h),
                            child: Center(
                                child: SimpleBtn(
                                    btnText:
                                        KeyLang.register.toUpperCase().tr(),
                                    onTap: () async {
                                      if (_keyFoem.currentState!.validate()) {
                                        Register().postDataEngineer(
                                          city_user:
                                              controllerValue["city_user"]!,
                                          Guild_number:
                                              controllerValue["Guild_number"]!,
                                          office_name:
                                              controllerValue["office_name"]!,
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
        ));
  }
}
