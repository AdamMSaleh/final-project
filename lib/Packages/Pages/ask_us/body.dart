// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/appbar/sup_appbar.dart';

class AskUs extends StatelessWidget {
  const AskUs({Key? key}) : super(key: key);
  static const String id = 'AskUs';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //*Appbar
      appBar: AppBSup(
        txt: KeyLang.ask,
      ),

      body: SafeArea(
        child: Center(child: Text('Ask')),
      ),
    );
  }
}
