// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, unused_element, implementation_imports, prefer_const_constructors, unused_import, must_be_immutable, prefer_typing_uninitialized_variables

import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/DataBase/register.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Btn/simple_btn.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/app_loading.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/enum_loading.dart';
import 'package:flutter_finalproject/Packages/Components/richText/rich_text.dart';
import 'package:flutter_finalproject/Packages/Components/text_filed/simple_filed.dart';
import 'package:flutter_finalproject/Packages/Components/user_info_secure_storage/user_save_login.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/forgot.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/register.dart';
import 'package:flutter_finalproject/Packages/Pages/Home/View/body.dart';
import 'package:flutter_finalproject/Packages/Pages/Profile/Components/profile_information.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/style.dart';
import 'package:flutter_finalproject/Theme/theme_status.dart';
import 'package:flutter_finalproject/Utils/path_icons.dart';
import 'package:flutter_finalproject/Utils/path_images.dart';
import 'package:flutter_finalproject/validators/app_validators.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PageLogin extends StatefulWidget {
  static const String id = 'PageLogin';
  DateTime startTime = DateTime.now();
  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  //*form key
  final GlobalKey<FormState> _keyFoem = GlobalKey<FormState>();
  // firebase
  //  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance ;

  //*icon

  bool _obscureText = true;
  FaIcon _iconSuffix = PathIcons.eyeIcon;
  Map<String, TextEditingController> controllerValue = {
    'email': TextEditingController(),
    'password': TextEditingController(),
  };

  void gggg() async {
    controllerValue['email']!.text = UserPreferences.getUsername() ?? '';
    controllerValue['password']!.text = UserPreferences.getPassword() ?? '';
    // if (UserSecureStorage.getUsername().toString() ==
    //     "Instance of 'Future<String?>'") {
    //
    // } else {
    //   controllerValue['email']!.text =
    //   await UserSecureStorage.getUsername().toString();
    //   controllerValue['password']!.text =
    //   await UserSecureStorage.getPassword().toString();
    // }
    // super.initState();
  }

  @override
  void initState() {
    // _firebaseMessaging.getToken().then((token) {
    //   print("Token is "+token!);
    //   token1=token;
    //   setState(() {
    //
    //   });
    // });
    super.initState();
    // WidgetsBinding.instance.
    gggg();
  }

  bool processing = false;
  // gggg();
  @override
  Widget build(BuildContext context) {
    // setState(() {
    //   processing = Register.cicul;
    //   // ignore: avoid_print
    //   print('processing' + processing.toString());
    // });

    // if(widget.startTime.second-DateTime.now().second>5){
    //   print('startTime.second-DateTime.now().second');
    //   print(widget.startTime.second-DateTime.now().second);
    //     processing = false;
    //
    // }
    return Scaffold(
        backgroundColor: AppColors.blue,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 35.h),
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
                    SizedBox(height: 10.h),
                    //*tital
                    Text(KeyLang.oneclickhome,
                        style: AppStyles.styleHeadline1Light.copyWith(
                          color: AppColors.white,
                          fontSize: 35.sp,
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
                            //* tital box
                            SizedBox(height: 10.h),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 15.h),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                KeyLang.login,
                                style: AppStyles.styleHeadline1Light.copyWith(
                                  color: AppColors.blue,
                                  fontSize: 30.sp,
                                ),
                              ).tr(),
                            ),
                            SizedBox(height: 15.h),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 25.h),
                              child: Form(
                                key: _keyFoem,
                                child: Column(
                                  children: [
                                    //*email
                                    SimpleFiled(
                                      controller: controllerValue['email'],
                                      onValidator: (value) =>
                                          AppValidators.isEmail(value),
                                      keyboardType: TextInputType.emailAddress,
                                      hint: KeyLang.email,
                                      pIcon: Icon(
                                        Icons.email,
                                        color: AppColors.blue,
                                      ),
                                    ),

                                    SizedBox(height: 20.h),
                                    //*password
                                    SimpleFiled(
                                        controller: controllerValue['password'],
                                        onValidator: (value) =>
                                            AppValidators.isPass(value),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        hint: KeyLang.password,
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

                                    //*forgotPass
                                    TextButton(
                                      onPressed: () => _navForget(context),
                                      child: Container(
                                        //margin: EdgeInsets.symmetric(horizontal: 15),
                                        alignment: Alignment.centerRight,
                                        child: Text(KeyLang.forgotPass,
                                            style: AppStyles.styleHeadline1Light
                                                .copyWith(
                                              color: AppColors.red,
                                              fontSize: 15.sp,
                                              decoration:
                                                  TextDecoration.underline,
                                            )).tr(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //* Button
                            SizedBox(height: 5.h),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 25.h),
                              child: witcicullogin(),
                              // !processing ?
                            ),

                            SizedBox(height: 25.h),
                            //*notAccount
                            RichTextAuth(
                              fword: KeyLang.notAccount,
                              sword: KeyLang.register,
                              onTap: () => _navReg(context),
                            ),
                            SizedBox(height: 40.h),
                          ],
                        )),
                    SizedBox(height: 35.h),
                  ]),
            ),
          ),
        ));
  }

  // * Navigator Register
  void _navReg(BuildContext context) {
    Navigator.pushNamed(
      context,
      PageRegister.id,
    );
  }

  // * Navigator Forget
  void _navForget(BuildContext context) {
    Navigator.pushNamed(
      context,
      PageForgetPass.id,
    );
  }

  witcicullogin() {
    var wigt;
    if (!processing) {
      wigt = Center(
          child: SimpleBtn(
              btnText: KeyLang.login,
              onTap: () async {
                // setState(() {
                //   processing = Register.cicul;
                //   // ignore: avoid_print
                //   print('processing' +
                //       processing.toString());
                // });

                // await Register().notification(token1);
                // print(
                //     controllerValue['email']!.text +
                //         '5s5sa5sas');
                // print(controllerValue['password']!
                //         .text +
                //     '5s5sa5sas');
                // if(UserSecureStorage.getUsername().toString()=="Instance of 'Future<String?>'"){
                // setState( () { processing = !processing ; } ) ;
                if (_keyFoem.currentState!.validate()) {
                  // await Register().loadData();
                  setState(() {
                    processing = true;
                  });

                  // print("msaidjasoidjfoasif oijfodijfopsdijf d[ifj[asdifj[sdjfj[ijffj ");
                  // print(ProfileInformation.first_name);
                  // processing = !processing;
                  Register().postLogin(
                    email: controllerValue['email']!.text,
                    password: controllerValue['password']!.text,
                    context: context,
                  );

                  // setState(() {
                  //   processing = Register.cicul;
                  //   // ignore: avoid_print
                  //   print('processing' +
                  //       processing.toString());
                  // });

                  // await UserPreferences.setUsername(
                  //     controllerValue['email']!.text);
                  // await UserPreferences.setPassword(
                  //     controllerValue['password']!
                  //         .text);
                  // Navigator.pushReplacementNamed(
                  //   context,
                  //   PageHome.id,
                  // );
                  // await UserSecureStorage.setUsername(controllerValue['email']!.text);
                  //  await UserSecureStorage.setPassword(controllerValue['password']!.text);
                }
                //   }else{
                //     // controllerValue['email']!.text=await UserSecureStorage().getUsername().toString();
                //     //     controllerValue['password']!.text=await UserSecureStorage().getPassword().toString();
                //         print('samisamsismaismaismsimasiamsiamsasimsaimsaimasm');
                //   }
                //   print(await UserSecureStorage.getUsername());
                //   UserSecureStorage.setUsername(controllerValue['email']!.text);
                //   UserSecureStorage.setUsername(controllerValue['password']!.text);
                //
                // }
              }));
    } else {
      wigt = CircularProgressIndicator(
          backgroundColor: Colors.black38, color: Colors.black45);
      Timer(Duration(seconds: 3), () {
        setState(() {
          processing = false;
        });
      });
    }
    return wigt;
  }
}

mixin HEAD {}
