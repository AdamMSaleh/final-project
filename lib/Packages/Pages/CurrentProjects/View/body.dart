// ignore_for_file: prefer_const_constructors, implementation_imports, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Additions/go_back.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/appbar/sup_appbar.dart';

import 'package:flutter_finalproject/Packages/Pages/CurrentProjects/View/projects_details.dart';
import 'package:flutter_finalproject/Packages/Pages/Invoice/Components/design.dart';

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
      //*Appbar
      appBar: AppBSup(txt: KeyLang.currentProjects),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: project_color('76b5c5').withOpacity(0.8),
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
                    border: TableBorder.all(color: Colors.black, width: 1.5),
                    children: const [
                      TableRow(
                        children: [
                          Text(
                            ' الرقم ',
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            ' اسم المشروع ',
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            ' اسم المالك ',
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            ' حالة المشروع ',
                            style: TextStyle(fontSize: 15),
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
                                  456, 'اسم المشروع2 ', '2اسم المالك', true),
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
        ),
      ),
    );
  }
}
