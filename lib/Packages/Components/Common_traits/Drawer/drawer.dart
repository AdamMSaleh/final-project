// ignore_for_file: prefer_const_constructors, duplicate_ignore, unused_local_variable, implementation_imports

import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/DataBase/register.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/Drawer/alert_dialog.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/Drawer/custom_tile.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/Drawer/drawer_header.dart';
import 'package:flutter_finalproject/Packages/Components/user_info_secure_storage/user_save_login.dart';
import 'package:flutter_finalproject/Utils/path_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _sw = MediaQuery.of(context).size.width;
    return Drawer(
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          //*header
          HeaderDrawer(),
          Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              SizedBox(
                height: 10.h,
              ),
              //* notifications
              ListTileDrawer(
                icon: PathImages.notif,
                title: KeyLang.notifications,
                onPress: () {},
              ),
              SizedBox(
                height: 30.h,
              ),
              //* language
              ListTileDrawer(
                icon: PathImages.langua,
                title: KeyLang.language,
                onPress: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return ALertDialogDrawer();
                    },
                  );
                },
              ),
              SizedBox(
                height: 30.h,
              ),
              //* theme
              ListTileDrawer(
                icon: PathImages.dark,
                title: KeyLang.darkMode,
                iconTrailing: EasyDynamicThemeSwitch(),
                onPress: () {},
              ),
              SizedBox(
                height: 30.h,
              ),
              ListTileDrawer(
                icon: PathImages.logout,
                title: KeyLang.logout,
                onPress: () {
                  UserPreferences.removeUsername();
                  UserPreferences.removePassword();
                  UserPreferences.removeUserId();
                  Register().RemovingSessionData(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
