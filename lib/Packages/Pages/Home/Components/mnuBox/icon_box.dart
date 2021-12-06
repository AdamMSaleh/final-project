// ignore_for_file: unused_field, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconBox extends StatelessWidget {
  const IconBox({required List<Widget> chldrn}) : _chldrn = chldrn;

  final List<Widget> _chldrn;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      margin: EdgeInsets.symmetric(horizontal: 30.w),
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: _chldrn,
      ),
    );
  }
}
