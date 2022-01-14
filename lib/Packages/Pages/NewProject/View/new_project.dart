// ignore_for_file: prefer_const_constructors, implementation_imports, duplicate_ignore, sized_box_for_whitespace, prefer_final_fields, avoid_unnecessary_containers, unused_import, unused_field

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Add_Image/alert_choose.dart';
import 'package:flutter_finalproject/Packages/Components/Btn/simple_btn.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/app_loading.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/enum_loading.dart';
import 'package:flutter_finalproject/Packages/Components/Toast/simple_toast.dart';
import 'package:flutter_finalproject/Packages/Components/location/addres.dart';
import 'package:flutter_finalproject/Packages/Components/text_filed/simple_filed.dart';
import 'package:flutter_finalproject/Packages/Pages/NewProject/components/Button/but_up.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/style.dart';
import 'package:flutter_finalproject/Theme/theme_status.dart';
import 'package:flutter_finalproject/Utils/path_images.dart';
import 'package:flutter_finalproject/validators/app_validators.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class NewProject extends StatefulWidget {
  const NewProject({Key? key}) : super(key: key);
  static const String id = 'NewProject';

  @override
  State<NewProject> createState() => _NewProjectState();
}

class _NewProjectState extends State<NewProject> {
  //*form key
  final GlobalKey<FormState> _keyFoem = GlobalKey<FormState>();
  var _items = <String>[
    KeyLang.maintenance,
    KeyLang.building,
  ];
  var z = 0;
  var b = 0;
  void _datePicker({required bool starOrEndDate}) {
   var dateNow=DateTime.now();
    showDatePicker(
      context: context,
      initialDate: dateNow,
      firstDate: starOrEndDate? dateNow.add(Duration(days: 10)):dateNow,
      lastDate: dateNow.add(Duration(days: 7300)),//365 days * 20 years
    );
  }
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
                      SizedBox(height: 15.h),
                      //*Address
                    SimpleFiled(
                      keyboardType: TextInputType.name,
                      onValidator: (value) => AppValidators.isEmpty(value),
                      hint: KeyLang.address.tr(),
                      pIcon:  Icon(
                          Icons.add_location_alt_rounded,
                          color: AppColors.blue,
                        ),

                    ),

                      /******************************************/

                      SizedBox(height: 15.h),

                    /* Region */
                    SimpleFiled(
                      keyboardType: TextInputType.name,
                      onValidator: (value) => AppValidators.isEmpty(value),
                      hint: "  منطقة  ",
                      pIcon:  Icon(
                          Icons.add_location_alt_rounded,
                          color: AppColors.blue,
                        ),

                    ),
                      /*******************************/
                      SizedBox(height: 15.h),
                      //* Starting Date
                      SimpleFiled(
                        keyboardType: TextInputType.datetime,
                        onValidator: (value) => AppValidators.isEmpty(value),
                        hint: KeyLang.startingDate.tr(),
                        readOnly: true,
                        pIcon: IconButton(
                          icon: Icon(
                            Icons.date_range_outlined,
                            color: AppColors.blue,
                          ),
                          onPressed: () {_datePicker(starOrEndDate: false);},
                        ),
                      ),
                      //* Expiry Date
                      SizedBox(height: 10.h),
                      SimpleFiled(
                        keyboardType: TextInputType.datetime,
                        onValidator: (value) => AppValidators.isEmpty(value),
                        hint: KeyLang.expiryDate.tr(),
                        readOnly: true,
                        pIcon: IconButton(
                          icon: Icon(
                            Icons.date_range_sharp,
                            color: AppColors.blue,
                          ),
                          onPressed: () {_datePicker(starOrEndDate: true);},
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
                      //*construction license
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 25.h),
                        child: Center(
                            child: SimpleBtnUp(
                          btnText: KeyLang.constructionLicense.tr(),
                          onTap: () {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) => AlertChooseImage(
                                bathImage: 'construction_license',
                              ),
                            );
                            b = 1;
                          },
                        )),
                      ),

                      SizedBox(height: 15.h),


                      // //* schemes
                      // Container(
                      //   margin: EdgeInsets.symmetric(horizontal: 25.h),
                      //   child: Center(
                      //       child: SimpleBtnUp(
                      //     btnText: KeyLang.schemes.tr(),
                      //     onTap: () {
                      //       showDialog(
                      //         barrierDismissible: false,
                      //         context: context,
                      //         builder: (context) => AlertChooseImage(
                      //           bathImage: 'schemes',
                      //         ),
                      //       );
                      //       b = 2;
                      //     },
                      //   )),
                      // ),
                      // SizedBox(height: 15.h),

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
