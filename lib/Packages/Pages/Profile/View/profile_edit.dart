// ignore_for_file: prefer_final_fields, sized_box_for_whitespace, prefer_const_constructors, implementation_imports

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Add_Image/alert_choose.dart';
import 'package:flutter_finalproject/Packages/Components/Additions/go_back.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/appbar/sup_appbar.dart';
import 'package:flutter_finalproject/Packages/Components/cach_image/image_user.dart';
import 'package:flutter_finalproject/Packages/Components/text_filed/simple_filed.dart';
import 'package:flutter_finalproject/Packages/Pages/Profile/Components/profile_information.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'profile_for_workers.dart';

class ProfileEdit extends StatefulWidget {
  static String? image1;
  static String? firstName1;

  static String? lastName1;

  static String? occupation1;

  static String? age1;

  static String? region1;
  static String? phoneNumber1;

  ProfileEdit({
    Key? key,
    image,
    firstName,
    lastName,
    occupation,
    age,
    region,
    phoneNumber,
    File? imageFile,
  }) : super(key: key) {
    if (firstName != null &&
        lastName != null &&
        occupation != null &&
        age != null &&
        region != null &&
        phoneNumber != null) {
      firstName1 = firstName;
      lastName1 = lastName;
      occupation1 = occupation;
      age1 = age;
      region1 = region;
      phoneNumber1 = phoneNumber;
      image1 = image;
    } else {
      firstName1 = 'غير معروف';
      lastName1 = 'غير معروف';
      occupation1 = 'غير معروف';
      age1 = 'غير معروف';
      region1 = 'غير معروف';
      phoneNumber1 = '0780808080';
      image1 = image;
    }
  }

  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  var _controllerFirstName1 = TextEditingController();
  final _newFirstName1 = ProfileEdit.firstName1;

/*-------------------------------------------------------*/
  var _controllerLastName1 = TextEditingController();
  final _newLastName1 = ProfileEdit.lastName1;

/*-------------------------------------------------------*/
  var _controllerOccupation1 = TextEditingController();
  final _newOccupation1 = ProfileEdit.occupation1;

/*-------------------------------------------------------*/
  var _controllerAge1 = TextEditingController();
  final _newAge1 = ProfileEdit.age1;

/*-------------------------------------------------------*/
  var _controllerRegion1 = TextEditingController();
  final _newRegion1 = ProfileEdit.region1;

/*-------------------------------------------------------*/
  var _controllerPhoneNumber1 = TextEditingController();
  final _newPhoneNumber1 = ProfileEdit.phoneNumber1;

/*-------------------------------------------------------*/
  void getValue() {
    _controllerFirstName1.value = TextEditingValue(
      text: _newFirstName1!,
      selection: TextSelection.fromPosition(
        TextPosition(offset: _newFirstName1!.length),
      ),
    );
    _controllerLastName1.value = TextEditingValue(
      text: _newLastName1!,
      selection: TextSelection.fromPosition(
        TextPosition(offset: _newLastName1!.length),
      ),
    );
    _controllerOccupation1.value = TextEditingValue(
      text: _newOccupation1!,
      selection: TextSelection.fromPosition(
        TextPosition(offset: _newOccupation1!.length),
      ),
    );
    _controllerAge1.value = TextEditingValue(
      text: _newAge1!,
      selection: TextSelection.fromPosition(
        TextPosition(offset: _newAge1!.length),
      ),
    );
    _controllerRegion1.value = TextEditingValue(
      text: _newRegion1!,
      selection: TextSelection.fromPosition(
        TextPosition(offset: _newRegion1!.length),
      ),
    );
    _controllerPhoneNumber1.value = TextEditingValue(
      text: _newPhoneNumber1!,
      selection: TextSelection.fromPosition(
        TextPosition(offset: _newPhoneNumber1!.length),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    getValue();
    return Scaffold(
      appBar: AppBSup(txt: KeyLang.editProfile),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //* imag
            SizedBox(height: 20.h),
            Stack(
              children: [
                Container(
                  height: 125.w,
                  width: 125.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 3,
                      color: AppColors.blue,
                    ),
                  ),
                  child: ImageUser(
                    image: ProfileInformation.picture_user!,
                    radius: 15.r,
                    sizeLoading: 20.r,
                  ),
                ),
                Positioned(
                  bottom: 1,
                  right: 10,
                  child: Container(
                    width: 30.w,
                    height: 30.w,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.center,
                      onPressed: () {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => AlertChooseImage(),
                        );
                      },
                      icon: Icon(
                        Icons.add,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 35.h),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 40.h),
                child: Column(
                  children: [
                    //*first Name
                    SimpleFiled(
                      controller: _controllerFirstName1,
                      keyboardType: TextInputType.name,
                      hint: KeyLang.firstName,
                      pIcon: Icon(
                        Icons.person,
                        color: AppColors.blue,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    //* last name
                    SimpleFiled(
                      controller: _controllerLastName1,
                      keyboardType: TextInputType.name,
                      hint: KeyLang.lastName,
                      pIcon: Icon(
                        Icons.person,
                        color: AppColors.blue,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    //* Age
                    SimpleFiled(
                      controller: _controllerAge1,
                      keyboardType: TextInputType.number,
                      hint: KeyLang.lastName,
                      pIcon: Icon(
                        Icons.filter_vintage_outlined,
                        color: AppColors.blue,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    //*profession
                    SimpleFiled(
                      controller: _controllerOccupation1,
                      keyboardType: TextInputType.name,
                      hint: KeyLang.professionName,
                      pIcon: Icon(
                        Icons.work,
                        color: AppColors.blue,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    //*Address
                    SimpleFiled(
                      controller: _controllerRegion1,
                      keyboardType: TextInputType.name,
                      hint: KeyLang.address,
                      pIcon: Icon(
                        Icons.add_location_alt_rounded,
                        color: AppColors.blue,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    //*phone
                    SimpleFiled(
                      keyboardType: TextInputType.phone,
                      controller: _controllerPhoneNumber1,
                      hint: KeyLang.phoneNumber,
                      pIcon: Icon(
                        Icons.phone,
                        color: AppColors.blue,
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),

            IconButton(
                onPressed: () => GoBack.selectScreen(
                      context,
                      ProfileForWorkers(
                        firstName: _controllerFirstName1.text,
                        lastName: _controllerLastName1.text,
                        occupation: _controllerOccupation1.text,
                        age: _controllerAge1.text,
                        region: _controllerRegion1.text,
                        phoneNumber: _controllerPhoneNumber1.text,
                      ),
                    ),
                icon: Icon(Icons.save)),
          ],
        ),
      ),
    );
  }
}
