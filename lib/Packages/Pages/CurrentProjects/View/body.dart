// ignore_for_file: prefer_const_constructors, implementation_imports, duplicate_ignore

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Additions/go_back.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/app_loading.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/enum_loading.dart';

import 'package:flutter_finalproject/Packages/Pages/CurrentProjects/View/projects_details.dart';
import 'package:flutter_finalproject/Packages/Pages/Invoice/Components/design.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/theme_status.dart';
import 'package:flutter_finalproject/Utils/path_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrentProjects extends StatefulWidget {
  const CurrentProjects({Key? key}) : super(key: key);
  static const String id = 'CurrentProjects';

  @override
  State<CurrentProjects> createState() => _CurrentProjectsState();
}

class _CurrentProjectsState extends State<CurrentProjects> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //* header
              Container(
                height: 170.h,
                decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60.r),
                    bottomRight: Radius.circular(60.r),
                  ),
                ),
                child:
                    //* header elements
                    Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 15.h),
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
              SizedBox(height: 40.h),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: project_color('741b47').withOpacity(0.8),
                      spreadRadius: 2,
                      blurRadius: 12,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      color: project_color('efcba7'),
                      child: Table(
                        border:
                            TableBorder.all(color: Colors.black, width: 1.5),
                        children: const [
                          TableRow(
                            children: [
                              Text(
                                ' الرقم ',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                              Text(
                                ' اسم المشروع ',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                              Text(
                                ' اسم المالك ',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                              Text(
                                ' حالة المشروع ',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      //padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(3),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Table(
                        border: TableBorder.all(color: Colors.black),
                        children: [
                          TableRow(
                            children: [
                              InkWell(
                                onTap: () => GoBack.selectScreen(
                                    context, ProjectsDetails("المشروع 2")),
                                child: Center(
                                  child: GoBack.rowOfProject(
                                    456,
                                    'اسم المشروع2 ',
                                    '2اسم المالك',
                                    true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              InkWell(
                                onTap: () => GoBack.selectScreen(
                                    context, ProjectsDetails("المشروع 41")),
                                child: Center(
                                  child: GoBack.rowOfProject(
                                      52, 'اسم المشروع4 ', '4اسم المالك', true),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                /*
Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () => GoBack.selectScreen(
                          context, ProjectsDetails("المشروع 1")),
                      child: Center(
                        child: GoBack.rowOfProject(
                            -1, 'اسم المشروع ', 'اسم المالك', true),
                      ),
                    ),
                    InkWell(
                      onTap: () => GoBack.selectScreen(
                          context, ProjectsDetails("المشروع 2")),
                      child: Center(
                        child: GoBack.rowOfProject(
                            456, 'اسم المشروع2 ', '2اسم المالك', true),
                      ),
                    ),
                    InkWell(
                      onTap: () => GoBack.selectScreen(
                          context, ProjectsDetails("المشروع 31")),
                      child: Center(
                        child: GoBack.rowOfProject(
                            453, 'اسم المشروع3 ', '3اسم المالك', false),
                      ),
                    ),
                    InkWell(
                      onTap: () => GoBack.selectScreen(
                          context, ProjectsDetails("المشروع 41")),
                      child: Center(
                        child: GoBack.rowOfProject(
                            52, 'اسم المشروع4 ', '4اسم المالك', true),
                      ),
                    ),
                  ],
                ),

                */
              ),
            ],
          ),
        ),
      ),
    );
  }
}
