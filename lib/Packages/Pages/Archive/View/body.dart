// ignore_for_file: prefer_const_constructors, implementation_imports, duplicate_ignore

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Additions/go_back.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/app_loading.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/enum_loading.dart';
import 'package:flutter_finalproject/Packages/Pages/Archive/components/carts_project.dart';
import 'package:flutter_finalproject/Packages/Pages/CurrentProjects/View/projects_details.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/theme_status.dart';
import 'package:flutter_finalproject/Utils/path_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Archive extends StatefulWidget {
  const Archive({Key? key}) : super(key: key);
  static const String id = 'Archive';

  @override
  State<Archive> createState() => _ArchiveState();
}

class _ArchiveState extends State<Archive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          //* header
          Container(
            height: 150.h,
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
                    SizedBox(height: 10.h),
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

                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    // SizedBox(height: 10.h),
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
          SizedBox(height: 13.h),
          CartFProject(
            id: '1',
            num_project: 'zarqa unverste',
            onTap: () =>
                GoBack.selectScreen(context, ProjectsDetails("المشروع 41")),
            date_receipt: '3/8/2021',
            owner_name: 'adam',
          ),

          CartFProject(
            id: '2',
            num_project: 'Home',
            onTap: () =>
                GoBack.selectScreen(context, ProjectsDetails("المشروع 41")),
            date_receipt: '3/9/1999',
            owner_name: 'adam',
          ),
        ],
      )),
    );
  }
}
