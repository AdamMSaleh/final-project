// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, prefer_final_fields, override_on_non_overriding_member, unused_field, must_be_immutable, annotate_overrides, prefer_typing_uninitialized_variables, implementation_imports, avoid_unnecessary_containers

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dropdown extends StatelessWidget {
  @override
  var _items = <String>[
    KeyLang.engineer,
    KeyLang.practitioner,
    KeyLang.worker,
    KeyLang.shopkeeper,
    KeyLang.machineowners,
    KeyLang.realestateowner
  ];
  int s = 0;
  Widget build(BuildContext context) {
    return Container(
      child: DropDown<String>(
        showUnderline: false,
        dropDownType: DropDownType.Button,
        items: _items,
        icon: Icon(
          Icons.expand_more,
          color: Colors.blue,
        ),
        customWidgets: <Widget>[
          Row(
            children: <Widget>[
              Text(KeyLang.engineer,
                  style: AppStyles.styleHeadline1Light.copyWith(
                    color: AppColors.blue,
                    fontSize: 15.sp,
                  )).tr()
            ],
          ),
          Row(
            children: <Widget>[
              Text(KeyLang.practitioner,
                  style: AppStyles.styleHeadline1Light.copyWith(
                    color: AppColors.blue,
                    fontSize: 15.sp,
                  )).tr(),
            ],
          ),
          Row(
            children: <Widget>[
              Text(KeyLang.worker,
                  style: AppStyles.styleHeadline1Light.copyWith(
                    color: AppColors.blue,
                    fontSize: 15.sp,
                  )).tr(),
            ],
          ),
          Row(
            children: <Widget>[
              Text(KeyLang.shopkeeper,
                  style: AppStyles.styleHeadline1Light.copyWith(
                    color: AppColors.blue,
                    fontSize: 15.sp,
                  )).tr(),
            ],
          ),
          Row(
            children: <Widget>[
              Text(KeyLang.machineowners,
                  style: AppStyles.styleHeadline1Light.copyWith(
                    color: AppColors.blue,
                    fontSize: 15.sp,
                  )).tr(),
            ],
          ),
          Row(
            children: <Widget>[
              Text(KeyLang.realestateowner,
                  style: AppStyles.styleHeadline1Light.copyWith(
                    color: AppColors.blue,
                    fontSize: 15.sp,
                  )).tr(),
            ],
          ),
        ],
        hint: Text("Select Gender",
            style: AppStyles.styleHeadline1Light
                .copyWith(color: AppColors.blue, fontSize: 15.sp)),
        onChanged: (value) => {
          if (value == KeyLang.realestateowner)
            {
              s = 6,
            }
          else if (value == KeyLang.engineer)
            {
              s = 1,
            }
          else if (value == KeyLang.practitioner)
            {
              s = 2,
            }
          else if (value == KeyLang.worker)
            {
              s = 3,
            }
          else if (value == KeyLang.shopkeeper)
            {
              s = 4,
            }
          else if (value == KeyLang.machineowners)
            {
              s = 5,
            }
        },
      ),
    );
  }
}
