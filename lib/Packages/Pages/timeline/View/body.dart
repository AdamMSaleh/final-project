import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/appbar/sup_appbar.dart';
import 'package:flutter_finalproject/Packages/Pages/timeline/Components/cart_time.dart';

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
          ],
        ),
      ),
    );
  }
}
