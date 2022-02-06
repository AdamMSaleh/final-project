// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, implementation_imports, non_constant_identifier_names, unused_field

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/DataBase/register.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Btn/simple_btn.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/app_loading.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/enum_loading.dart';
import 'package:flutter_finalproject/Packages/Components/Toast/simple_toast.dart';
import 'package:flutter_finalproject/Packages/Components/text_filed/simple_filed.dart';
import 'package:flutter_finalproject/Packages/Components/user_info_secure_storage/user_save_login.dart';
import 'package:flutter_finalproject/Packages/Pages/Research/view/add_crafts.dart';
import 'package:flutter_finalproject/Packages/Pages/Research/view/body.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/theme_status.dart';
import 'package:flutter_finalproject/Utils/path_images.dart';
import 'package:flutter_finalproject/validators/app_validators.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainteneanceProject extends StatefulWidget {
  static const String id = 'MainteneanceProject';
  static String? ownerName = '', ownerId = '0';
  static TextEditingController? owner_name = TextEditingController();

  @override
  State<MainteneanceProject> createState() => _MainteneanceProjectState();
}

class _MainteneanceProjectState extends State<MainteneanceProject> {
  late Map<String, TextEditingController> controllerValue = {
    'project_name': TextEditingController(),
    'City': TextEditingController(),
    'Region': TextEditingController(),
    'selectedDateStart': TextEditingController(),
    'selectedDateEnd': TextEditingController(),
    'owner_name': TextEditingController(),
  };

  late DateTime _selectedDateStart;
  late DateTime _selectedDateEnd;

  void _datePicker({required bool starOrEndDate}) {
    var dateNow = DateTime.now();
    showDatePicker(
      context: context,
      initialDate: starOrEndDate ? dateNow.add(Duration(days: 10)) : dateNow,
      firstDate: starOrEndDate ? dateNow.add(Duration(days: 2)) : dateNow,
      lastDate: dateNow.add(Duration(days: 7300)), //365 days * 20 years
    ).then((value) {
      if (value == null) {
        return;
      }
      if (starOrEndDate) {
        _selectedDateEnd = value;
        controllerValue['selectedDateEnd']!.text = value.toString();
      } else {
        _selectedDateStart = value;
        controllerValue['selectedDateStart']!.text = value.toString();
      }
    });
  }

  final GlobalKey<FormState> _keyFoem = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    setState(() {
      controllerValue['owner_name']!.text = MainteneanceProject.ownerName ?? "";
    });
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
                          "إنشاء مشروع صيانة",
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
                        controller: controllerValue['project_name'],
                        pIcon: Icon(
                          Icons.home,
                          color: AppColors.blue,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      //*Address city
                      SimpleFiled(
                        keyboardType: TextInputType.name,
                        onValidator: (value) => AppValidators.isEmpty(value),
                        hint: KeyLang.address.tr(),
                        controller: controllerValue['City'],
                        pIcon: Icon(
                          Icons.add_location_alt_rounded,
                          color: AppColors.blue,
                        ),
                      ),

                      /******************************************/

                      SizedBox(height: 15.h),

                      /* Address  Region */
                      SimpleFiled(
                        keyboardType: TextInputType.name,
                        onValidator: (value) => AppValidators.isEmpty(value),
                        hint: "  منطقة  ",
                        controller: controllerValue['Region'],
                        pIcon: Icon(
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
                        controller: controllerValue['selectedDateStart'],
                        pIcon: IconButton(
                          icon: Icon(
                            Icons.date_range_outlined,
                            color: AppColors.blue,
                          ),
                          onPressed: () {
                            _datePicker(starOrEndDate: false);
                          },
                        ),
                      ),
                      //* Expiry Date
                      SizedBox(height: 10.h),
                      SimpleFiled(
                        keyboardType: TextInputType.datetime,
                        onValidator: (value) => AppValidators.isEmpty(value),
                        hint: KeyLang.expiryDate.tr(),
                        readOnly: true,
                        controller: controllerValue['selectedDateEnd'],
                        pIcon: IconButton(
                          icon: Icon(
                            Icons.date_range_sharp,
                            color: AppColors.blue,
                          ),
                          onPressed: () {
                            _datePicker(starOrEndDate: true);
                          },
                        ),
                      ),
                      SizedBox(height: 15.h),
                      //* the owner's name
                      SimpleFiled(
                        keyboardType: TextInputType.name,
                        onValidator: (value) => AppValidators.isEmpty(value),
                        hint: KeyLang.ownerName.tr(),
                        readOnly: true,
                        controller: MainteneanceProject.owner_name,
                        //controllerValue['owner_name'],
                        pIcon: IconButton(
                          icon: Icon(
                            Icons.person,
                            color: AppColors.blue,
                          ),
                          onPressed: () {
                            setState(() {
                              AddCrafts.isHomePage = false;
                              AddCrafts.isMainteneanceProject = true;
                              AddCrafts.isNewProject = false;
                            });
                            Navigator.pushNamed(
                              context,
                              Research.id,
                            );
                          },
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
                                onTap: () {
                                  setState(() {
                                    //  print("Upload_ImageState().bathImagereturn");
                                    //  print( Upload_ImageState().bathImagereturn??"sami" );
                                    //  print("constructionLicense");
                                    // print( NewProject.constructionLicense! + 's4s4');
                                  });

                                  if (_keyFoem.currentState!.validate()) {
                                    Register().postDataCreateNewProject(
                                      context: context,
                                      user_no_eng: UserPreferences.getUserId()!,
                                      project_name:
                                          controllerValue['project_name']!.text,
                                      City: controllerValue['City']!.text,
                                      Region: controllerValue['Region']!.text,
                                      selectedDateStart:
                                          controllerValue['selectedDateStart']!
                                              .text,
                                      selectedDateEnd:
                                          controllerValue['selectedDateEnd']!
                                              .text,
                                      Owner_User_ID:
                                          MainteneanceProject.ownerId as String,
                                      owner_name:
                                          MainteneanceProject.ownerName!,
                                      construction_license: '0',
                                    );
                                    // Map<String, TextEditingController> controllerValue = {
                                    //   'project_name': TextEditingController(),
                                    //   'City': TextEditingController(),
                                    //   'Region': TextEditingController(),
                                    //   'selectedDateStart': TextEditingController(),
                                    //   'selectedDateEnd': TextEditingController(),
                                    //   'owner_name': TextEditingController(),
                                    // };

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
