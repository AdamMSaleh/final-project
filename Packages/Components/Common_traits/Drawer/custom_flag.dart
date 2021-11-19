// ignore_for_file: use_key_in_widget_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlagDrawer extends StatelessWidget {
  const FlagDrawer(
      {required String title, required String flag, required Locale lang})
      : _title = title,
        _lang = lang,
        _flag = flag;

  final String _flag;
  final String _title;
  final Locale _lang;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        EasyLocalization.of(context)!.setLocale(_lang);
        Navigator.pop(context);
      },
      child: Column(
        children: [
          // * Flag
          Container(
            width: 100.w,
            height: 80.h,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(_flag)),
            ),
          ),
          Text(_title.tr())
        ],
      ),
    );
  }
}
