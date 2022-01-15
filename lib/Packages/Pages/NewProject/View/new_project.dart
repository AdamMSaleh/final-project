// ignore_for_file: prefer_const_constructors, implementation_imports, duplicate_ignore, sized_box_for_whitespace, prefer_final_fields, avoid_unnecessary_containers, unused_import, unused_field

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Add_Image/alert_choose.dart';
import 'package:flutter_finalproject/Packages/Components/Additions/go_back.dart';
import 'package:flutter_finalproject/Packages/Components/Btn/simple_btn.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/app_loading.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/enum_loading.dart';
import 'package:flutter_finalproject/Packages/Components/Toast/simple_toast.dart';
import 'package:flutter_finalproject/Packages/Components/location/addres.dart';
import 'package:flutter_finalproject/Packages/Components/text_filed/simple_filed.dart';
import 'package:flutter_finalproject/Packages/Components/upload_image_php/img_upload.dart';
import 'package:flutter_finalproject/Packages/Pages/NewProject/components/Button/but_up.dart';
import 'package:flutter_finalproject/Packages/Pages/Research/view/add_crafts.dart';
import 'package:flutter_finalproject/Packages/Pages/Research/view/body.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/style.dart';
import 'package:flutter_finalproject/Theme/theme_status.dart';
import 'package:flutter_finalproject/Utils/path_images.dart';
import 'package:flutter_finalproject/validators/app_validators.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class NewProject extends StatefulWidget {

   NewProject({Key? key}) : super(key: key);
  static const String id = 'NewProject';
   static String? ownerName='';
   static int? ownerId=0;
   @override
  State<NewProject> createState() => _NewProjectState();
  static String? constructionLicense  ;
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
  Map<String, TextEditingController> controllerValue = {
    'first_name': TextEditingController(),
    'last_name': TextEditingController(),
    'age': TextEditingController(),
    'email': TextEditingController(),
    'owmersName': TextEditingController(),
    //test gui not importint
    'selectedDateStart': TextEditingController(),
    'selectedDateEnd': TextEditingController(),
    // "city_user": TextEditingController(),
    // 'account_type': TextEditingController(),
  };

  late DateTime _selectedDateStart;
  late DateTime _selectedDateEnd;
  bool validatorToConstructionLicense = false;


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
  void initState() {
    controllerValue['owmersName']!.text=NewProject.ownerName!;

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
                        pIcon: Icon(
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
                        onValidator: (value) => AppValidators.isname(value),
                        hint: KeyLang.ownerName.tr(),
                        readOnly: true,
                        controller: controllerValue['owmersName'],
                        pIcon: IconButton(
                          icon: Icon(
                            Icons.person,
                            color: AppColors.blue,
                          ),
                          onPressed: (){
                            setState(() {
                              AddCrafts.isHomePage=false;
                              AddCrafts.isNewProject=true;
                            });
                            Navigator.pushNamed(
                              context,
                              Research.id,
                            );
                          },
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

                      // Validator to construction_license
                      validatorToConstructionLicense
                          ? Container(
                              margin: EdgeInsets.symmetric(horizontal: 25.h),
                              child: GoBack.tx('   من فضلك حمل رخصة البناء    ',
                                  sizee: 15, textColor: Colors.red),
                            )
                          : Container(),

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
                                  setState(() {

                                   //  print("Upload_ImageState().bathImagereturn");
                                   //  print( Upload_ImageState().bathImagereturn??"sami" );
                                   //  print("constructionLicense");
                                   // print( NewProject.constructionLicense! + 's4s4');
                                  });


                                  if (_keyFoem.currentState!.validate()) {


                                    if ( NewProject.constructionLicense != null &&
                                        NewProject.constructionLicense!.length > 10) {
                                      setState(() {
                                        validatorToConstructionLicense = false;
                                      });


                                    } else {
                                      setState(() {
                                        validatorToConstructionLicense = true;
                                      });
                                    }
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
