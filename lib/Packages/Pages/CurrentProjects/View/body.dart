// ignore_for_file: prefer_const_constructors, implementation_imports, duplicate_ignore

import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Packages/Components/Additions/go_back.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/app_loading.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/enum_loading.dart';
import 'package:flutter_finalproject/Packages/Pages/Archive/components/carts_project.dart';
import 'package:flutter_finalproject/Packages/Pages/CurrentProjects/View/projects_details.dart';
import 'package:flutter_finalproject/Packages/Pages/Invoice/Components/design.dart';
import 'package:flutter_finalproject/Packages/Pages/NewProject/components/project_info.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/theme_status.dart';
import 'package:flutter_finalproject/Utils/path_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrentProjects extends StatefulWidget {
  const CurrentProjects({Key? key}) : super(key: key);
  static const String id = 'CurrentProjects';
  static String titel = '';

  @override
  State<CurrentProjects> createState() => _CurrentProjectsState();
}

class _CurrentProjectsState extends State<CurrentProjects> {
  List<ProjectInfo> project = [];
  int isStartedProject = 0;

  x() async {
    ProjectInfo.project = [];
    isStartedProject = 0;
    await ProjectInfo.getDataProject();
    if (project.isNotEmpty) {
      for (int i = 0; i < project.length; i++) {
        if (project[i].state == '1') {
          isStartedProject++;
        }
      }
    }
    setState(() {
      ProjectInfo.project;

      isStartedProject;
    });
  }

  @override
  initState() {
    x();
    project = ProjectInfo.project;
    isStartedProject;


/****************************************************/
    Timer(Duration(seconds: 3), () {
      Navigator.pop(context); //pop dialog
    });
/****************************************************/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
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
                          CurrentProjects.titel,
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
                child:
                    // Column(children: [
                    //
                    // ],)

                    Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // projectt()

                    // Container(
                    //   padding: EdgeInsets.all(5),
                    //   color: project_color('efcba7'),
                    //   child: Table(
                    //     border:
                    //         TableBorder.all(color: Colors.black, width: 1.5),
                    //     children: const [
                    //       TableRow(
                    //         children: [
                    //           Text(
                    //             ' الرقم ',
                    //             style: TextStyle(
                    //                 fontSize: 15, color: Colors.black),
                    //           ),
                    //           Text(
                    //             ' اسم المشروع ',
                    //             style: TextStyle(
                    //                 fontSize: 15, color: Colors.black),
                    //           ),
                    //           Text(
                    //             ' اسم المالك ',
                    //             style: TextStyle(
                    //                 fontSize: 15, color: Colors.black),
                    //           ),
                    //           Text(
                    //             ' حالة المشروع ',
                    //             style: TextStyle(
                    //                 fontSize: 15, color: Colors.black),
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Container(
                      //padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(3),
                    ),
                    project.isNotEmpty
                        ? Column(
                            children: [
                              ...project.map(
                                (e) => CurrentProjects.titel ==
                                        'المشاريع الحالية'
                                    ? e.state == '1'
                                        ? CartFProject(
                                            id: e.Projec_No!,
                                            num_project: e.project_name!,
                                            onTap: () => GoBack.selectScreen(
                                              context,
                                              ProjectsDetails(
                                                str: e.project_name,
                                                Owner_User_ID: e.Owner_User_ID,
                                                owner_name: e.owner_name,
                                                selectedDateEnd:
                                                    e.selectedDateEnd,
                                                selectedDateStart:
                                                    e.selectedDateStart,
                                                Region: e.Region,
                                                City: e.City,
                                                construction_license:
                                                    e.construction_license,
                                                Projec_No: e.Projec_No,
                                                project_name: e.project_name,
                                                state: e.state,
                                                user_no_eng: e.user_no_eng,
                                                Project_Type: e.Project_Type,
                                              ),
                                            ),
                                            date_receipt: e.selectedDateStart!,
                                            owner_name: e.owner_name!,
                                          )
                                        // Container(
                                        //         padding: EdgeInsets.all(5),
                                        //         child: Table(
                                        //           border: TableBorder.all(
                                        //               color: Colors.black),
                                        //           children: [
                                        //             TableRow(
                                        //               children: [
                                        //                 InkWell(
                                        //                   onTap: () =>
                                        //                       GoBack.selectScreen(
                                        //                     context,
                                        //                     ProjectsDetails(
                                        //                       str: e.project_name,
                                        //                       Owner_User_ID:
                                        //                           e.Owner_User_ID,
                                        //                       owner_name: e.owner_name,
                                        //                       selectedDateEnd:
                                        //                           e.selectedDateEnd,
                                        //                       selectedDateStart:
                                        //                           e.selectedDateStart,
                                        //                       Region: e.Region,
                                        //                       City: e.City,
                                        //                       construction_license: e
                                        //                           .construction_license,
                                        //                       Projec_No: e
                                        //                           .construction_license,
                                        //                       project_name:
                                        //                           e.project_name,
                                        //                       state: e.state,
                                        //                       user_no_eng:
                                        //                           e.user_no_eng,
                                        //                     ),
                                        //                   ),
                                        //                   child: Center(
                                        //                     child: GoBack.rowOfProject(
                                        //                       int.parse(e.Projec_No!),
                                        //                       e.project_name!,
                                        //                       e.owner_name!,
                                        //                       e.state == '1'
                                        //                           ? true
                                        //                           : false,
                                        //                     ),
                                        //                   ),
                                        //                 ),
                                        //               ],
                                        //             ),
                                        //           ],
                                        //         ),
                                        //       )
                                        : Container()
                                    : e.state == '0'
                                        ? CartFProject(
                                            id: e.Projec_No!,
                                            num_project: e.project_name!,
                                            onTap: () => GoBack.selectScreen(
                                              context,
                                              ProjectsDetails(
                                                str: e.project_name,
                                                Owner_User_ID: e.Owner_User_ID,
                                                owner_name: e.owner_name,
                                                selectedDateEnd:
                                                    e.selectedDateEnd,
                                                selectedDateStart:
                                                    e.selectedDateStart,
                                                Region: e.Region,
                                                City: e.City,
                                                construction_license:
                                                    e.construction_license,
                                                Projec_No: e.Projec_No,
                                                project_name: e.project_name,
                                                state: e.state,
                                                user_no_eng: e.user_no_eng,
                                                Project_Type: e.Project_Type,
                                              ),
                                            ),
                                            date_receipt: e.selectedDateStart!,
                                            owner_name: e.owner_name!,
                                          )
                                        : Container(),
                              ),
                            ],
                          )
                        : Container(
                            child: GoBack.tx('   لا يوجد مشاريع   '),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  dig(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              CircularProgressIndicator(),
              Text("Loading"),
            ],
          ),
        );
      },
    );
  }
}
