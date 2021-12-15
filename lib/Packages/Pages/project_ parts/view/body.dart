// ignore_for_file: implementation_imports, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/appbar/sup_appbar.dart';
import 'package:flutter_finalproject/Packages/Components/backgrondImage/back_image.dart';
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
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(PathImages.background),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                //* row name
                //* Methode represents her location in project_part/components
                NameRow(
                  name: KeyLang.merchants,
                ),

                //* first row
                //* Methode represents her location in project_part/components
                RowThreBot(
                  imag1: PathImages.transitMixer,
                  btnName1: KeyLang.readyMixedConcrete,
                  onTap1: () {
                    //* صفحه المجاورة
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => WorkRecond(
                          typ: KeyLang.readyMixedConcrete,
                          imge: PathImages.transitMixer,
                        ),
                      ),
                    );
                  },
                  imag2: PathImages.shop,
                  btnName2: KeyLang.shopkeeper,
                  onTap2: () {
                    //* صفحه المجاورة
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => WorkRecond(
                          typ: KeyLang.shopkeeper,
                          imge: PathImages.shop,
                        ),
                      ),
                    );
                  },
                  imag3: PathImages.machineowners,
                  btnName3: KeyLang.machineowners,
                  onTap3: () {
                    //* صفحه المجاورة
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => WorkRecond(
                          typ: KeyLang.machineowners,
                          imge: PathImages.machineowners,
                        ),
                      ),
                    );
                  },
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
                  onTap1: () {
                    //* صفحه المجاورة
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => WorkRecond(
                          typ: KeyLang.engineer,
                          imge: PathImages.engineers,
                        ),
                      ),
                    );
                  },
                  imag2: PathImages.contractors,
                  btnName2: KeyLang.contractors,
                  onTap2: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => WorkRecond(
                          typ: KeyLang.contractors,
                          imge: PathImages.contractors,
                        ),
                      ),
                    );
                  },
                  imag3: PathImages.worker,
                  btnName3: KeyLang.worker,
                  onTap3: () {
                    //* صفحه المجاورة
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => WorkRecond(
                          typ: KeyLang.worker,
                          imge: PathImages.worker,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20.h),
                //*name 3 row
                NameRow(name: KeyLang.finishes),
                //* 3row

                RowThreBot(
                  imag1: PathImages.smith,
                  btnName1: KeyLang.blacksmiths,
                  onTap1: () {
                    //* صفحه المجاورة
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => WorkRecond(
                          typ: KeyLang.blacksmiths,
                          imge: PathImages.smith,
                        ),
                      ),
                    );
                  },
                  imag2: PathImages.carpentry,
                  btnName2: KeyLang.carpenters,
                  onTap2: () {
                    //* صفحه المجاورة
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => WorkRecond(
                          typ: KeyLang.carpenters,
                          imge: PathImages.carpentry,
                        ),
                      ),
                    );
                  },
                  imag3: PathImages.plumbing,
                  btnName3: KeyLang.plumber,
                  onTap3: () {
                    //* صفحه المجاورة
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => WorkRecond(
                          typ: KeyLang.plumber,
                          imge: PathImages.plumbing,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 10.h),
                RowThreBot(
                  imag1: PathImages.tiles,
                  btnName1: KeyLang.tilesetter,
                  onTap1: () {
                    //* صفحه المجاورة
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => WorkRecond(
                          typ: KeyLang.tilesetter,
                          imge: PathImages.tiles,
                        ),
                      ),
                    );
                  },
                  imag2: PathImages.electrical,
                  btnName2: KeyLang.electrical,
                  onTap2: () {
                    //* صفحه المجاورة
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => WorkRecond(
                          typ: KeyLang.electrical,
                          imge: PathImages.electrical,
                        ),
                      ),
                    );
                  },
                  imag3: PathImages.fat,
                  btnName3: KeyLang.fat,
                  onTap3: () {
                    //* صفحه المجاورة
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => WorkRecond(
                          typ: KeyLang.fat,
                          imge: PathImages.fat,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
