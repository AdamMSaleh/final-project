// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, implementation_imports, unused_import, must_be_immutable, sized_box_for_whitespace, duplicate_ignore, avoid_unnecessary_containers

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/DataBase/register.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/Drawer/drawer.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/app_loading.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/enum_loading.dart';
import 'package:flutter_finalproject/Packages/Components/cach_image/image_user.dart';
import 'package:flutter_finalproject/Packages/Pages/Archive/View/body.dart';
import 'package:flutter_finalproject/Packages/Pages/CurrentProjects/View/body.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/appbar/appbar.dart';
import 'package:flutter_finalproject/Packages/Pages/Home/Components/btnIcon/iconbhom.dart';
import 'package:flutter_finalproject/Packages/Pages/Home/Components/mnuBox/icon_box.dart';
import 'package:flutter_finalproject/Packages/Pages/NewProject/View/new_project.dart';
import 'package:flutter_finalproject/Packages/Pages/NewProject/components/BoxDialog/dialog.dart';

import 'package:flutter_finalproject/Packages/Pages/Profile/View/profile.dart';
import 'package:flutter_finalproject/Packages/Pages/Research/Components/support/support_class.dart';
import 'package:flutter_finalproject/Packages/Pages/Research/view/add_crafts.dart';
import 'package:flutter_finalproject/Packages/Pages/Research/view/body.dart';
import 'package:flutter_finalproject/Packages/Pages/ask_us/body.dart';
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
  x() async {
    await Register().loadData();
  }

  @override
  // ignore: must_call_super
  void initState() {

    x();
  }

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
              //* row 1
              SizedBox(height: 35.h),
              IconBox(
                chldrn: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //*new project
                      IconBHome(
                        onTap: () {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return BoxDialog();
                            },
                          );
                        },
                        imag: PathImages.newProject,
                        btnName: KeyLang.newProject,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //*Current projects
                      IconBHome(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            CurrentProjects.id,
                          );
                        },
                        imag: PathImages.currentProjects,
                        btnName: KeyLang.currentProjects,
                      ),
                    ],
                  )
                ],
              ),
              //* row 2
              SizedBox(height: 35.h),
              IconBox(
                chldrn: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //*Search
                      IconBHome(
                        onTap: () {
                          setState(() {
                            AddCrafts.isHomePage=true;

                          });
                          Navigator.pushNamed(
                            context,
                            Research.id,
                          );
                        },
                        imag: PathImages.search,
                        btnName: KeyLang.research,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //*Profile
                      IconBHome(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Profile.id,
                          );
                        },
                        imag: PathImages.profileicon,
                        btnName: KeyLang.profile,
                      ),
                    ],
                  )
                ],
              ),
              //* row 3
              SizedBox(height: 35.h),
              IconBox(
                chldrn: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //* Work Archive
                      IconBHome(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Archive.id,
                          );
                        },
                        imag: PathImages.archive,
                        btnName: KeyLang.archive,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //* ask us
                      IconBHome(
                        onTap: () async {
                          Navigator.pushNamed(
                            context,
                            AskUs.id,
                          );
                        },
                        imag: PathImages.ask,
                        btnName: KeyLang.ask,
                        //hello
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
