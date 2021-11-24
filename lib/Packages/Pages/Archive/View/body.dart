// ignore_for_file: prefer_const_constructors, implementation_imports, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/appbar/sup_appbar.dart';

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
        child: Center(child: Text('Archive')),
      ),
    );
  }
}
