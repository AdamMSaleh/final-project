// ignore_for_file: implementation_imports, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/appbar/sup_appbar.dart';
import 'package:flutter_finalproject/Packages/Pages/project_%20parts/components/name_row.dart';
import 'package:flutter_finalproject/Packages/Pages/project_%20parts/components/row.dart';
import 'package:flutter_finalproject/Packages/Pages/project_%20parts/view/work_record.dart';
import 'package:flutter_finalproject/Utils/path_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkersDetection extends StatelessWidget {
  const WorkersDetection({Key? key}) : super(key: key);
  static const String id = 'WorkersDetection';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBSup(txt: KeyLang.workersDetection),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              //* row name
              NameRow(
                name: KeyLang.merchants,
              ),

              //* first row
              RowThreBot(
                btnName1: KeyLang.readyMixedConcrete,
                imag1: PathImages.transitMixer,
                onTap1: () {
                  Navigator.pushNamed(
                    context,
                    WorkRecond.id,
                  );
                },
                imag2: PathImages.shop,
                btnName2: KeyLang.shopkeeper,
                onTap2: () {},
                imag3: PathImages.machineowners,
                btnName3: KeyLang.machineowners,
                onTap3: () {},
              ),

              SizedBox(height: 20.h),
              //* row name
              NameRow(
                name: KeyLang.founding,
              ),

              //* 2 row
              RowThreBot(
                imag1: PathImages.engineers,
                btnName1: KeyLang.engineer,
                onTap1: () {},
                imag2: PathImages.contractors,
                btnName2: KeyLang.contractors,
                onTap2: () {},
                imag3: PathImages.worker,
                btnName3: KeyLang.worker,
                onTap3: () {},
              ),
              SizedBox(height: 20.h),
              //*name 3 row
              NameRow(name: KeyLang.finishes),
              //* 3row

              RowThreBot(
                imag1: PathImages.smith,
                btnName1: KeyLang.blacksmiths,
                onTap1: () {},
                imag2: PathImages.carpentry,
                btnName2: KeyLang.carpenters,
                onTap2: () {},
                imag3: PathImages.plumbing,
                btnName3: KeyLang.plumber,
                onTap3: () {},
              ),
              SizedBox(height: 10.h),
              RowThreBot(
                imag1: PathImages.tiles,
                btnName1: KeyLang.tilesetter,
                onTap1: () {},
                imag2: PathImages.electrical,
                btnName2: KeyLang.electrical,
                onTap2: () {},
                imag3: PathImages.fat,
                btnName3: KeyLang.fat,
                onTap3: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
