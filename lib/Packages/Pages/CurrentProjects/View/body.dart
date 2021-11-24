// ignore_for_file: prefer_const_constructors, implementation_imports, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Additions/go_back.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/appbar/sup_appbar.dart';

import 'package:flutter_finalproject/Packages/Pages/CurrentProjects/View/projects_details.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () =>
                    GoBack.selectScreen(context, ProjectsDetails("المشروع 1")),
                child: Center(
                  child: GoBack.rowOfProject(
                      -1, 'اسم المشروع ', 'اسم المالك', true),
                ),
              ),
              InkWell(
                onTap: () =>
                    GoBack.selectScreen(context, ProjectsDetails("المشروع 2")),
                child: Center(
                  child: GoBack.rowOfProject(
                      456, 'اسم المشروع2 ', '2اسم المالك', true),
                ),
              ),
              InkWell(
                onTap: () =>
                    GoBack.selectScreen(context, ProjectsDetails("المشروع 31")),
                child: Center(
                  child: GoBack.rowOfProject(
                      453, 'اسم المشروع3 ', '3اسم المالك', false),
                ),
              ),
              InkWell(
                onTap: () =>
                    GoBack.selectScreen(context, ProjectsDetails("المشروع 41")),
                child: Center(
                  child: GoBack.rowOfProject(
                      52, 'اسم المشروع4 ', '4اسم المالك', true),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
