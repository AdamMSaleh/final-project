// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/appbar/sup_appbar.dart';
import 'package:flutter_finalproject/Packages/Pages/Archive/components/carts_project.dart';
import 'package:flutter_finalproject/Packages/Pages/timeline/Components/cart_time.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeLine extends StatelessWidget {
  const TimeLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBSup(txt: KeyLang.timeline),
      body: SafeArea(
        child: Column(
          children: [
            CardTime(
              expiryDate: '10/12/2022',
              onTap: () {},
              startDate: '11/20/2020',
            ),
            SizedBox(height: 15.h),
            View11(),
          ],
        ),
      ),
    );
  }

  static View11() {
    for (var i = 0; i < 5; i++) {
      CartFProject(
        id: '2',
        num_project: 'Home',
        onTap: () {},
        date_receipt: '3/9/1999',
        owner_name: 'adam',
      );
    }
  }
}
