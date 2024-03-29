// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, unused_element, implementation_imports, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Btn/simple_btn.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/app_loading.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/enum_loading.dart';
import 'package:flutter_finalproject/Packages/Components/richText/rich_text.dart';
import 'package:flutter_finalproject/Packages/Components/text_filed/simple_filed.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/forgot.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/register.dart';
import 'package:flutter_finalproject/Packages/Pages/Home/View/body.dart';

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

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  //*form key
  final GlobalKey<FormState> _keyFoem = GlobalKey<FormState>();
  //*icon
  bool _obscureText = true;
  FaIcon _iconSuffix = PathIcons.eyeIcon;

  @override
  Widget build(BuildContext context) {
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
                              child: Center(
                                  child: SimpleBtn(
                                onTap: () {
                                  if (_keyFoem.currentState!.validate()) {
                                    Navigator.pushNamed(
                                      context,
                                      PageHome.id,
                                    );
                                  }
                                },
                                btnText: KeyLang.login,
                              )),
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
}
