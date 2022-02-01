// ignore_for_file: unused_field, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//* Main box representing row
class IconBox extends StatelessWidget {

  const IconBox({required List<Widget> chldrn, double hrizntl = 30})
      : _chldrn = chldrn,
        _hrizntl = hrizntl;

  final List<Widget> _chldrn;
  final double _hrizntl;
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      margin: EdgeInsets.symmetric(horizontal: _hrizntl.w),
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: _chldrn,
      ),
    );
  }
}
