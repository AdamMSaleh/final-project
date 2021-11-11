// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, implementation_imports, unused_import, must_be_immutable, sized_box_for_whitespace, duplicate_ignore

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/Drawer/drawer.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/app_loading.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/enum_loading.dart';
import 'package:flutter_finalproject/Packages/Components/cach_image/image_user.dart';
import 'package:flutter_finalproject/Packages/Pages/Archive/View/body.dart';
import 'package:flutter_finalproject/Packages/Pages/CurrentProjects/View/body.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/appbar.dart';
import 'package:flutter_finalproject/Packages/Pages/NewProject/View/new_project.dart';

import 'package:flutter_finalproject/Packages/Pages/Profile/View/profile.dart';
import 'package:flutter_finalproject/Packages/Pages/Research/view/body.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/style.dart';
import 'package:flutter_finalproject/Utils/path_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageHome extends StatefulWidget {
  static const String id = 'PageHome';

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //*Appbar
      appBar: AppBHome(),
      //*drawer
      drawer: DrawerHome(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 35.w),
                  Column(
                    children: [
                      SizedBox(height: 35.h),
                      //*new project
                      CircleAvatar(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  NewProject.id,
                                );
                              },
                              child: Image(
                                image: AssetImage(
                                    'assets/icons/Project-icon (1).png'),
                              ),
                            ),
                          ],
                        ),
                        radius: 50.r,
                      ),
                      SizedBox(height: 7.h),
                      Text(KeyLang.newProject,
                          style: AppStyles.styleHeadline3Light.copyWith(
                            color: AppColors.blue,
                            fontSize: 20.sp,
                          )).tr(),
                      //*Search
                      SizedBox(height: 30.h),
                      CircleAvatar(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  Research.id,
                                );
                              },
                              child: Image(
                                image:
                                    AssetImage('assets/icons/search-icon.png'),
                              ),
                            ),
                          ],
                        ),
                        radius: 50.r,
                      ),
                      SizedBox(height: 7.h),
                      Text(KeyLang.research,
                          style: AppStyles.styleHeadline3Light.copyWith(
                            color: AppColors.blue,
                            fontSize: 20.sp,
                          )).tr(),
                    ],
                  ),
                  //* right side
                  SizedBox(width: 115.w),
                  Column(
                    children: [
                      SizedBox(height: 35.h),
                      //*Current projects
                      CircleAvatar(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  CurrentProjects.id,
                                );
                              },
                              child: Image(
                                image: AssetImage(
                                    'assets/icons/Current projects-icon.png'),
                              ),
                            ),
                          ],
                        ),
                        radius: 50.r,
                      ),
                      SizedBox(height: 7.h),
                      Text(KeyLang.currentProjects,
                          style: AppStyles.styleHeadline3Light.copyWith(
                            color: AppColors.blue,
                            fontSize: 20.sp,
                          )).tr(),
                      //*Profile
                      SizedBox(height: 30.h),
                      CircleAvatar(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  Profile.id,
                                );
                              },
                              child: Image(
                                image:
                                    AssetImage('assets/icons/Profile-icon.png'),
                              ),
                            ),
                          ],
                        ),
                        radius: 50.r,
                      ),
                      SizedBox(height: 7.h),
                      Text(KeyLang.profile,
                          style: AppStyles.styleHeadline3Light.copyWith(
                            color: AppColors.blue,
                            fontSize: 20.sp,
                          )).tr(),
                    ],
                  )
                ],
              ),
              SizedBox(height: 30.h),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 35.w),
                  //*Work Archive

                  Column(
                    children: [
                      CircleAvatar(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  Archive.id,
                                );
                              },
                              child: Image(
                                image:
                                    AssetImage('assets/icons/archive-icon.png'),
                              ),
                            ),
                          ],
                        ),
                        radius: 50.r,
                      ),
                      SizedBox(height: 7.h),
                      Text(KeyLang.archive,
                          style: AppStyles.styleHeadline3Light.copyWith(
                            color: AppColors.blue,
                            fontSize: 20.sp,
                          )).tr(),
                    ],
                  ),
                  //*ask us
                  SizedBox(width: 120.w),
                  Column(
                    children: [
                      CircleAvatar(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  Archive.id,
                                );
                              },
                              child: Image(
                                image: AssetImage(PathImages.ask),
                              ),
                            ),
                          ],
                        ),
                        radius: 50.r,
                      ),
                      SizedBox(height: 7.h),
                      Text(KeyLang.ask,
                          style: AppStyles.styleHeadline3Light.copyWith(
                            color: AppColors.blue,
                            fontSize: 20.sp,
                          )).tr(),
                    ],
                  ),
                  //* end ask us
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
