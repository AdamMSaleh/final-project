// ignore_for_file: unused_field, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Packages/Pages/Home/Components/btnIcon/iconbhom.dart';
import 'package:flutter_finalproject/Packages/Pages/Home/Components/mnuBox/icon_box.dart';

class RowThreBot extends StatelessWidget {
  //* This method (IconBox) is in the home file
  //*This variable (hrizntl) sets the coulomb limits and defaults to 30.w .
  const RowThreBot(
      {required String imag1,
      required String imag2,
      required String imag3,
      required String btnName1,
      required String btnName2,
      required String btnName3,
      required Function() onTap1,
      required Function() onTap2,
      required Function() onTap3})
      : _imag1 = imag1,
        _imag2 = imag2,
        _imag3 = imag3,
        _btnName1 = btnName1,
        _btnName2 = btnName2,
        _btnName3 = btnName3,
        _onTap1 = onTap1,
        _onTap2 = onTap2,
        _onTap3 = onTap3;

  final String _imag1, _imag2, _imag3;

  final String _btnName1, _btnName2, _btnName3;
  final Function()? _onTap1, _onTap2, _onTap3;

  @override
  Widget build(BuildContext context) {
    return IconBox(
      hrizntl: 5,
      chldrn: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //* Methode represents her location in home/components/btnicon
            IconBHome(
              onTap: _onTap1,
              imag: _imag1,
              btnName: _btnName1,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconBHome(
              onTap: _onTap2,
              imag: _imag2,
              btnName: _btnName2,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconBHome(
              onTap: _onTap3,
              imag: _imag3,
              btnName: _btnName3,
            ),
          ],
        ),
      ],
    );
  }
}
