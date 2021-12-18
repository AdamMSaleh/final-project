// ignore_for_file: prefer_const_constructors, implementation_imports, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Additions/go_back.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/appbar/sup_appbar.dart';
import 'package:flutter_finalproject/Packages/Pages/Archive/components/carts_project.dart';
import 'package:flutter_finalproject/Packages/Pages/CurrentProjects/View/projects_details.dart';

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
      //*Appbar
      appBar: AppBSup(
        txt: KeyLang.archive,
      ),

      body: SafeArea(
          child: Column(
        children: [
          CartFProject(
            id: '1',
            num_project: 'zarqa unverste',
            onTap: () =>
                GoBack.selectScreen(context, ProjectsDetails("المشروع 41")),
            date_receipt: '3/8/2021',
            owner_name: 'adam',
          ),
        ],
      )),
    );
  }
}
