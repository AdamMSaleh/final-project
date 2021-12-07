import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/appbar/sup_appbar.dart';
import 'package:flutter_finalproject/Packages/Pages/Home/Components/btnIcon/iconbhom.dart';
import 'package:flutter_finalproject/Packages/Pages/Home/Components/mnuBox/icon_box.dart';
import 'package:flutter_finalproject/Utils/path_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddWorkers extends StatelessWidget {
  const AddWorkers({Key? key}) : super(key: key);
  static const String id = 'AddWorkers';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBSup(txt: KeyLang.addMembers),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 35.h),
              IconBox(
                chldrn: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconBHome(
                        onTap: () {},
                        imag: PathImages.currentProjects,
                        btnName: KeyLang.currentProjects,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconBHome(
                        onTap: () {},
                        imag: PathImages.currentProjects,
                        btnName: KeyLang.currentProjects,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconBHome(
                        onTap: () {},
                        imag: PathImages.currentProjects,
                        btnName: KeyLang.currentProjects,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
