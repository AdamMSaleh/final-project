// ignore_for_file: unused_element, sized_box_for_whitespace, prefer_const_constructors, implementation_imports, unused_field, prefer_final_fields, prefer_const_literals_to_create_immutables, unused_import, avoid_print, avoid_unnecessary_containers, non_constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:flutter_finalproject/DataBase/register.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Btn/simple_btn.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/app_loading.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/enum_loading.dart';
import 'package:flutter_finalproject/Packages/Components/Toast/simple_toast.dart';
import 'package:flutter_finalproject/Packages/Components/drop_down/drop_down.dart';
import 'package:flutter_finalproject/Packages/Components/richText/rich_text.dart';
import 'package:flutter_finalproject/Packages/Components/text_filed/simple_filed.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/Info_User/infi_professionals.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/Info_User/info_mechanice.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/Info_User/info_owner.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/Info_User/info_shop.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/Info_User/info_user_Eng.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/Info_User/info_workers.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/login.dart';
import 'package:flutter_finalproject/Packages/Pages/Home/View/body.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/style.dart';
import 'package:flutter_finalproject/Theme/theme_status.dart';
import 'package:flutter_finalproject/Utils/path_icons.dart';
import 'package:flutter_finalproject/Utils/path_images.dart';
import 'package:flutter_finalproject/validators/app_validators.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PageRegister extends StatefulWidget {
  static const String id = 'PageRegister';
  static String accType = '';
  const PageRegister({Key? key}) : super(key: key);

  @override
  State<PageRegister> createState() => _PageRegister();
}

class _PageRegister extends State<PageRegister> {
  //*form key
  final GlobalKey<FormState> _keyFoem = GlobalKey<FormState>();

  //* icon
  bool _obscureText = true;
  FaIcon _iconSuffix = PathIcons.eyeIcon;

  // controller of smpel Taxt
  Map<String, TextEditingController> controllerValue = {
    'first_name': TextEditingController(),
    'last_name': TextEditingController(),
    'age': TextEditingController(),
    'email': TextEditingController(),
    'password': TextEditingController(),
    //test gui not importint
    'passwordAgin': TextEditingController(),
    'phone_number': TextEditingController(),
    // "city_user": TextEditingController(),
    // 'account_type': TextEditingController(),
  };

  var account_type = "";

  // * pass
  String _pass = " ";

  //* RadioValue
  int _radiovalue = 0;

  int _pontar = 0;

  //* method

  //*Dropdown Menu
  var _items = <String>[
    KeyLang.engineer,
    KeyLang.practitioner,
    KeyLang.worker,
    KeyLang.shopkeeper,
    KeyLang.machineowners,
    KeyLang.realestateowner
  ];
  int s = 0;

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
          return true;
        }
      },
      child: Scaffold(
          backgroundColor: AppColors.blue,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //*image
                      Container(
                        alignment: Alignment.topCenter,
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

                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      //*tital
                      Text(KeyLang.oneclickhome,
                          style: AppStyles.styleHeadline1Light.copyWith(
                            color: AppColors.white,
                            fontSize: 40.h,
                          )).tr(),
                      SizedBox(height: 20.h),
                      //*box
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.h),
                          // height: 500,
                          decoration: BoxDecoration(
                            color: AppTheme.getTheme(context: context)
                                ? AppColors.black
                                : AppColors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50.r),
                              topRight: Radius.circular(50.r),
                            ),
                          ),
                          child: Column(
                            children: [
                              //*tital box
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 15.h),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  KeyLang.register,
                                  style: AppStyles.styleHeadline1Light.copyWith(
                                    color: AppColors.blue,
                                    fontSize: 30.h,
                                  ),
                                ).tr(),
                              ),
                              SizedBox(height: 10.h),

                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 25.h),
                                child: Form(
                                  key: _keyFoem,
                                  child: Column(
                                    children: [
                                      //* first name
                                      SimpleFiled(
                                        keyboardType: TextInputType.name,
                                        controller:
                                            controllerValue['first_name'],
                                        onValidator: (value) =>
                                            AppValidators.isname(value),
                                        hint: KeyLang.firstName.tr(),
                                        pIcon: Icon(
                                          Icons.person,
                                          color: AppColors.blue,
                                        ),
                                      ),
                                      SizedBox(height: 20.h),
                                      //* last name
                                      SimpleFiled(
                                        keyboardType: TextInputType.name,
                                        controller:
                                            controllerValue['last_name'],
                                        onValidator: (value) =>
                                            AppValidators.isname(value),
                                        hint: KeyLang.lastName.tr(),
                                        pIcon: Icon(
                                          Icons.person,
                                          color: AppColors.blue,
                                        ),
                                      ),
                                      SizedBox(height: 20.h),
                                      //*age
                                      SimpleFiled(
                                        keyboardType: TextInputType.number,
                                        controller: controllerValue['age'],
                                        onValidator: (value) =>
                                            AppValidators.isAge(value),
                                        hint: KeyLang.age,
                                        pIcon: Icon(
                                          Icons.filter_vintage_outlined,
                                          color: AppColors.blue,
                                        ),
                                      ),

                                      SizedBox(height: 20.h),
                                      //*email
                                      SimpleFiled(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        controller: controllerValue['email'],
                                        onValidator: (value) =>
                                            AppValidators.isEmail(value),
                                        hint: KeyLang.email.tr(),
                                        pIcon: Icon(
                                          Icons.email,
                                          color: AppColors.blue,
                                        ),
                                      ),

                                      SizedBox(height: 20.h),

                                      //*password
                                      SimpleFiled(
                                          controller:
                                              controllerValue['passwordAgin'],
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          onValidator: (value) =>
                                              AppValidators.isPass(value),
                                          onChanged: (value) => _pass = value,
                                          hint: KeyLang.password.tr(),
                                          isObscureText: _obscureText,
                                          pIcon: Icon(
                                            Icons.lock,
                                            color: AppColors.blue,
                                          ),
                                          sIcon: Padding(
                                            padding: EdgeInsets.all(10.0.w),
                                            child: _iconSuffix,
                                          ),
                                          onSIcon: () {
                                            setState(() {
                                              if (_obscureText) {
                                                _iconSuffix =
                                                    PathIcons.eyeSlashIcon;
                                                _obscureText = false;
                                              } else {
                                                _iconSuffix = PathIcons.eyeIcon;
                                                _obscureText = true;
                                              }
                                            });
                                          }),

                                      SizedBox(height: 20.h),
                                      //* Confirem Password
                                      SimpleFiled(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          onValidator: (value) =>
                                              AppValidators.isEqualPass(
                                                  value, _pass),
                                          controller:
                                              controllerValue['password'],
                                          hint: KeyLang.cpass.tr(),
                                          isObscureText: _obscureText,
                                          pIcon: Icon(
                                            Icons.lock,
                                            color: AppColors.blue,
                                          ),
                                          sIcon: Padding(
                                            padding: EdgeInsets.all(10.0.w),
                                            child: _iconSuffix,
                                          ),
                                          onSIcon: () {
                                            setState(() {
                                              if (_obscureText) {
                                                _iconSuffix =
                                                    PathIcons.eyeSlashIcon;
                                                _obscureText = false;
                                              } else {
                                                _iconSuffix = PathIcons.eyeIcon;
                                                _obscureText = true;
                                              }
                                            });
                                          }),
                                      SizedBox(height: 20.h),
                                      //*phone
                                      SimpleFiled(
                                        keyboardType: TextInputType.phone,
                                        controller:
                                            controllerValue['phone_number'],
                                        onValidator: (value) =>
                                            AppValidators.isPhoneNumber(value),
                                        hint: KeyLang.phoneNumber.tr(),
                                        pIcon: Icon(
                                          Icons.phone,
                                          color: AppColors.blue,
                                        ),
                                      ),
                                      SizedBox(height: 20.h),

                                      //* Dropdown Menu
                                      Container(
                                        child: DropDown<String>(
                                          showUnderline: false,
                                          dropDownType: DropDownType.Button,
                                          items: _items,
                                          icon: Icon(
                                            Icons.expand_more,
                                            color: Colors.blue,
                                          ),
                                          customWidgets: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Text(KeyLang.engineer,
                                                    style: AppStyles
                                                        .styleHeadline1Light
                                                        .copyWith(
                                                      color: AppColors.blue,
                                                      fontSize: 15.sp,
                                                    )).tr()
                                              ],
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Text(KeyLang.practitioner,
                                                    style: AppStyles
                                                        .styleHeadline1Light
                                                        .copyWith(
                                                      color: AppColors.blue,
                                                      fontSize: 15.sp,
                                                    )).tr(),
                                              ],
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Text(KeyLang.worker,
                                                    style: AppStyles
                                                        .styleHeadline1Light
                                                        .copyWith(
                                                      color: AppColors.blue,
                                                      fontSize: 15.sp,
                                                    )).tr(),
                                              ],
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Text(KeyLang.shopkeeper,
                                                    style: AppStyles
                                                        .styleHeadline1Light
                                                        .copyWith(
                                                      color: AppColors.blue,
                                                      fontSize: 15.sp,
                                                    )).tr(),
                                              ],
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Text(KeyLang.machineowners,
                                                    style: AppStyles
                                                        .styleHeadline1Light
                                                        .copyWith(
                                                      color: AppColors.blue,
                                                      fontSize: 15.sp,
                                                    )).tr(),
                                              ],
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Text(KeyLang.realestateowner,
                                                    style: AppStyles
                                                        .styleHeadline1Light
                                                        .copyWith(
                                                      color: AppColors.blue,
                                                      fontSize: 15.sp,
                                                    )).tr(),
                                              ],
                                            ),
                                          ],
                                          hint: Text(
                                              KeyLang.typeOfProfession.tr(),
                                              style: AppStyles
                                                  .styleHeadline1Light
                                                  .copyWith(
                                                      color: AppColors.blue,
                                                      fontSize: 15.sp)),
                                          onChanged: (value) => {
                                            if (value ==
                                                KeyLang.realestateowner)
                                              {
                                                s = 6,
                                              }
                                            else if (value == KeyLang.engineer)
                                              {
                                                s = 1,
                                              }
                                            else if (value ==
                                                KeyLang.practitioner)
                                              {
                                                s = 2,
                                              }
                                            else if (value == KeyLang.worker)
                                              {
                                                s = 3,
                                              }
                                            else if (value ==
                                                KeyLang.shopkeeper)
                                              {
                                                s = 4,
                                              }
                                            else if (value ==
                                                KeyLang.machineowners)
                                              {
                                                s = 5,
                                              }
                                          },
                                        ),
                                      ),
                                      //*finash dropdown

                                      SizedBox(height: 30.h),
                                      //*button
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 25.h),
                                        child: Center(
                                            child: SimpleBtn(
                                                btnText: KeyLang.next
                                                    .toUpperCase()
                                                    .tr(),
                                                onTap: () async {
                                                  if (account_type == '0') {
                                                    simpleToast(
                                                      message: KeyLang
                                                          .massegRegister
                                                          .tr(),
                                                    );
                                                  } else {
                                                    if (_keyFoem.currentState!
                                                        .validate()) {
                                                      print(
                                                          'under buttton in register');
                                                      PageRegister.accType =
                                                          s.toString();
                                                      Register().postData(
                                                        first_name:
                                                            controllerValue[
                                                                'first_name']!,
                                                        last_name:
                                                            controllerValue[
                                                                'last_name']!,
                                                        email: controllerValue[
                                                            'email']!,
                                                        password:
                                                            controllerValue[
                                                                'password']!,
                                                        phone_number:
                                                            controllerValue[
                                                                'phone_number']!,
                                                        account_type:
                                                            s.toString(),
                                                        context: context,
                                                      );
                                                    }
                                                  }
                                                })),
                                      ),

                                      SizedBox(height: 10.h),
                                      //*Rich Text
                                      RichTextAuth(
                                          fword: KeyLang.haveAccount,
                                          sword: KeyLang.login,
                                          onTap: () =>
                                              Navigator.pushReplacementNamed(
                                                  context, PageLogin.id)),
                                      SizedBox(height: 20.h),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(height: 35.h),
                    ]),
              ),
            ),
          )),
    );
  }
}
