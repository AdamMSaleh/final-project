// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/appbar/sup_appbar.dart';
import 'package:flutter_finalproject/Packages/Pages/project_%20parts/components/cardWorks/card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkRecond extends StatelessWidget {
  static const String id = 'WorkRecond';
  const WorkRecond({Key? key, required String typ, required String imge})
      : _typ = typ,
        _imge = imge,
        super(key: key);

  //* value
  final String _typ;
  final String _imge;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBSup(txt: KeyLang.workRecond.tr()),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 15.h),
            //* Methode represents her location in project_part/components/caedworks
            Cardwork(
              typ: _typ,
              imge: _imge,
            ),
          ],
        ),
      ),
    );
  }
}
