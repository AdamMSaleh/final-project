// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Language/config/config_lang.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/Drawer/custom_flag.dart';
import 'package:flutter_finalproject/Utils/path_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ALertDialogDrawer extends StatelessWidget {
  const ALertDialogDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return AlertDialog(
      contentPadding: EdgeInsets.all(0),
      title: Text(
        KeyLang.selectLanguage.tr(),
        textAlign: TextAlign.center,
      ),
      content: Container(
        height: 120.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: FlagDrawer(
                title: KeyLang.arabic,
                flag: PathImages.arabic,
                lang: ConfigLanguage.AR_LOCALE,
              ),
            ),
            Expanded(
              child: FlagDrawer(
                title: KeyLang.english,
                flag: PathImages.einglish,
                lang: ConfigLanguage.EN_LOCALE,
              ),
            )
          ],
        ),
      ),
      actions: [
        OutlinedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(KeyLang.cancel.tr()),
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.transparent,
            primary: _isDarkMode ? Colors.white : Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.sp),
            ),
          ),
        )
      ],
    );
  }
}
