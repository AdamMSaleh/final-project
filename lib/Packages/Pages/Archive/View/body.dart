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
import 'package:flutter_finalproject/Packages/Pages/NewProject/components/project_info.dart';
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
  List<ProjectInfo> project = [];
  int isFinishedProject = 0;

  x() async {
    ProjectInfo.project = [];
    isFinishedProject = 0;
    await ProjectInfo.getDataProject();
    if (project.isNotEmpty) {
      for (int i = 0; i < project.length; i++) {
        if (project[i].state == '0') {
          isFinishedProject++;
        }
      }
    }
    setState(() {
      ProjectInfo.project;

      isFinishedProject;
    });
  }

  @override
  initState() {
    x();
    project = ProjectInfo.project;
    isFinishedProject;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
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

                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      // SizedBox(height: 10.h),
                      //* tital
                      Text(
                        KeyLang.archive.tr(),
                        style: AppTheme.h5(context: context)
                            ?.copyWith(color: AppColors.white),
                      ).tr(),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 13.h),
            project.isNotEmpty && isFinishedProject > 0
                ? Column(
                    children: [
                      ...project.map(
                        (e) => e.state == '0'
                            ? CartFProject(
                                id: e.Projec_No!,
                                num_project: e.project_name!,
                                onTap: () => GoBack.selectScreen(
                                  context,
                                  ProjectsDetails(
                                    str: e.project_name,
                                    Owner_User_ID: e.Owner_User_ID,
                                    owner_name: e.owner_name,
                                    selectedDateEnd: e.selectedDateEnd,
                                    selectedDateStart: e.selectedDateStart,
                                    Region: e.Region,
                                    City: e.City,
                                    construction_license:
                                        e.construction_license,
                                    Projec_No: e.construction_license,
                                    project_name: e.project_name,
                                    state: e.state,
                                    user_no_eng: e.user_no_eng,
                                  ),
                                ),
                                date_receipt: e.selectedDateEnd!,
                                owner_name: e.owner_name!,
                              )
                            : Container(),
                      ),
                    ],
                  )
                : Container(
                    child: GoBack.tx(KeyLang.noProjectsArchive.tr()),
                  ),
            SizedBox(height: 13.h),
          ],
        ),
      )),
    );
  }
}
