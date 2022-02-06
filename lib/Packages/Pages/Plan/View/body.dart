// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, implementation_imports, unused_import, must_be_immutable, sized_box_for_whitespace, duplicate_ignore, deprecated_member_use, avoid_unnecessary_containers, slash_for_doc_comments, unnecessary_null_comparison, avoid_print, non_constant_identifier_names, unused_element

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_finalproject/DataBase/register.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Additions/go_back.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/Drawer/drawer.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/appbar/sup_appbar.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/app_loading.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/enum_loading.dart';
import 'package:flutter_finalproject/Packages/Components/Photo_View/photo_view.dart';
import 'package:flutter_finalproject/Packages/Components/Toast/simple_toast.dart';
import 'package:flutter_finalproject/Packages/Components/cach_image/image_user.dart';
import 'package:flutter_finalproject/Packages/Pages/Archive/View/body.dart';
import 'package:flutter_finalproject/Packages/Pages/CurrentProjects/View/body.dart';
import 'package:flutter_finalproject/Packages/Pages/CurrentProjects/View/projects_details.dart';
import 'package:flutter_finalproject/Packages/Pages/Invoice/Components/design.dart';
import 'package:flutter_finalproject/Packages/Pages/NewProject/View/new_project.dart';
import 'package:flutter_finalproject/Packages/Pages/NewProject/components/BoxDialog/dialog.dart';
import 'package:flutter_finalproject/Packages/Pages/Plan/Components/fill_plan.dart';
import 'package:flutter_finalproject/Packages/Pages/Plan/Components/plan_info.dart';
import 'package:flutter_finalproject/Packages/Pages/Profile/View/profile.dart';
import 'package:flutter_finalproject/Packages/Pages/Profile/View/upload_image.dart';
import 'package:flutter_finalproject/Packages/Pages/Research/view/body.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/style.dart';
import 'package:flutter_finalproject/Utils/path_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../Components/planInformion.dart';

class PlanUpload extends StatefulWidget {
  static const String id = 'Plan';
  static String Projec_No = '';

  @override
  State<PlanUpload> createState() => _PlanUploadState();
}

Color w = Colors.white;
Color b = Colors.black;
Color o = Colors.orange;
Color t = Colors.teal;
Color l = Colors.lime;
Color g = Colors.green;
Color r = Colors.red;
Color p = Colors.pink;
Color bl = Colors.blue;



class _PlanUploadState extends State<PlanUpload> {

  List<PlanInfo> planData = [];


  x() async {
    PlanInfo.plan = [];

    await PlanInfo.getDataPlan();

    setState(() {
      PlanInfo.plan;
      print(PlanInfo.plan);
      // isStartedProject;
    });
  }

  @override
  initState() {
    x();
    planData = PlanInfo.plan;
    // isStartedProject;

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //*Appbar
      appBar: AppBSup(txt: KeyLang.schemes),

      body:

          Column(
        children: [
          Container(
            height: (MediaQuery.of(context).size.height) * 0.77,
            color: project_color('efcba7'),
            child: planData.isNotEmpty
                ? ListView(
                    // padding: EdgeInsets.all(5),
                    children: [
                      ...planData.map(
                        (e) => Container(
                          margin: EdgeInsets.all(10),
                          child: Card(
                            child: Column(
                              children: [
                                //space row
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(10),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Plan Name : ',
                                      style: TextStyle(
                                        color: project_color('741b47'),
                                      ),
                                    ),
                                    Text(e.Scheme_name!),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Office Name : ',
                                      style: TextStyle(
                                        color: project_color('741b47'),
                                      ),
                                    ),
                                    Text(e.Engineering_office_name!)
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Designer Name :',
                                      style: TextStyle(
                                        color: project_color('741b47'),
                                      ),
                                    ),
                                    Text(e.designer_name!)
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Code Number : ',
                                      style: TextStyle(
                                        color: project_color('741b47'),
                                      ),
                                    ),
                                    Text(e.Scheme_encoding!)
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'chart_type : ',
                                      style: TextStyle(
                                        color: project_color('741b47'),
                                      ),
                                    ),
                                    Text(e.chart_type!)
                                  ],
                                ),
                                //space row
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(10),
                                    ),
                                  ],
                                ),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Plan Image :',
                                      style: TextStyle(
                                        color: project_color('741b47'),
                                      ),
                                    ),
                                    Container(
                                      child: e.chart_picture!.length < 15
                                          ? FlatButton(
                                              onPressed: () {
                                                GoBack.selectScreen(
                                                    context,
                                                    ImageView(
                                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgaE5uDsb9aBw7dcDlZzcZHk6GlgOYv-a2zb7lEWkQXZlEjFMsGsozB_-r2mhy61GKES0&usqp=CAU'));
                                              },
                                              child: Image.network(
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgaE5uDsb9aBw7dcDlZzcZHk6GlgOYv-a2zb7lEWkQXZlEjFMsGsozB_-r2mhy61GKES0&usqp=CAU',
                                                height: 150,
                                              ),
                                            )
                                          : FlatButton(
                                        onPressed: () {
                                          GoBack.selectScreen(
                                              context,
                                              ImageView(
                                                  e.chart_picture!
                                              ));
                                        },
                                        child: Image.network(
                                          e.chart_picture!,
                                          height: 150,
                                        ),
                                      )

                                    ),
                                  ],
                                ),
                                //space row
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(10),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                : Center(
                    child: GoBack.tx('لا يوجد مخططات'),
                  ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
          ),
          backgroundColor: project_color('741b47'),
          onPressed: () {
            // print(ProjectsDetails.state1);
            if (ProjectsDetails.state1 == '1') {
              Fill_plane_page.Projec_No = ProjectsDetails.Projec_No1!;
              Navigator.pushNamed(
                context,
                Fill_plane_page.id,
              );
              // print('Fill_plane_page.Projec_No'+Fill_plane_page.Projec_No);
            } else {
              simpleToast(message: ' لا يمكن اضافة مخطط لأن المشروع منتهي ');
            }
          }),
    );
  }


}
