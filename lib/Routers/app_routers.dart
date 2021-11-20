// ignore_for_file: prefer_const_constructors, avoid_web_libraries_in_flutter, unused_impor

import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Packages/Pages/Archive/View/body.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/Info_User/Info_User_Eng.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/Info_User/infi_professionals.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/Info_User/info_mechanice.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/Info_User/info_owner.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/Info_User/info_shop.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/Info_User/info_workers.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/forgot.dart';

import 'package:flutter_finalproject/Packages/Pages/Auth/Views/login.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/register.dart';
import 'package:flutter_finalproject/Packages/Pages/CurrentProjects/View/body.dart';
import 'package:flutter_finalproject/Packages/Pages/Home/View/body.dart';
import 'package:flutter_finalproject/Packages/Pages/NewProject/View/maintenance_project.dart';
import 'package:flutter_finalproject/Packages/Pages/NewProject/View/new_project.dart';
import 'package:flutter_finalproject/Packages/Pages/Profile/View/profile.dart';
import 'package:flutter_finalproject/Packages/Pages/Research/view/body.dart';
import 'package:flutter_finalproject/Packages/Pages/Splash/View/body.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    PageSplash.id: (context) => PageSplash(),
    PageHome.id: (context) => PageHome(),
    PageRegister.id: (context) => PageRegister(),
    PageLogin.id: (context) => PageLogin(),
    PageInfoShope.id: (context) => PageInfoShope(),
    PageForgetPass.id: (context) => PageForgetPass(),
    PageInfoEng.id: (context) => PageInfoEng(),
    PageInfoPr.id: (context) => PageInfoPr(),
    PageInfoworker.id: (context) => PageInfoworker(),
    PageInfowner.id: (context) => PageInfowner(),
    PageInfoMech.id: (context) => PageInfoMech(),
    Research.id: (context) => Research(),
    Profile.id: (context) => Profile(),
    NewProject.id: (context) => NewProject(),
    CurrentProjects.id: (context) => CurrentProjects(),
    Archive.id: (context) => Archive(),
    MainteneanceProject.id: (context) => MainteneanceProject(),
  };
}
