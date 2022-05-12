// ignore_for_file: camel_case_types, avoid_unnecessary_containers, implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Additions/go_back.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/appbar/sup_appbar.dart';
import 'package:flutter_finalproject/Packages/Components/upload_image_Invoice/upload_image.dart';
import 'package:flutter_finalproject/Packages/Pages/Invoice/Components/creat_invoices.dart';
import 'package:flutter_finalproject/Packages/Pages/Invoice/Components/view_invoices.dart';
import 'package:flutter_finalproject/Packages/Pages/Research/view/body.dart';
import 'package:flutter_finalproject/Packages/Pages/project_%20parts/view/body.dart';
import 'package:flutter_finalproject/Packages/Pages/timeline/View/body.dart';
import '../../Payment_History/View/body.dart';
import '../../Plan/View/body.dart';

class deteals_proj extends StatefulWidget {
  const deteals_proj({Key? key}) : super(key: key);

  @override
  _deteals_projState createState() => _deteals_projState();
}

class _deteals_projState extends State<deteals_proj> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* AppBar
      appBar: AppBSup(txt: KeyLang.projectDetails),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Table(
                  border: TableBorder.all(color: Colors.black, width: 1.5),
                  children: [
                    TableRow(children: [
                      GoBack.tx(' بناء مدرسة جامعة الزرقاء'),
                      GoBack.tx(KeyLang.projectName.tr() + ':'),
                    ]),
                    TableRow(children: [
                      GoBack.tx('عمر خالد'),
                      GoBack.tx(KeyLang.ownerName.tr() + ':'),
                    ]),
                    TableRow(children: [
                      GoBack.tx('خالد'),
                      GoBack.tx(KeyLang.engineer.tr() + ':'),
                    ]),
                    TableRow(children: [
                      GoBack.tx(' asmaa hassan'),
                      GoBack.tx(':  اسم المقاول'),
                    ]),
                  ]),
            ),

            //----------------------------------------
            Container(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GoBack.btn(
                    " المخططات",
                    context,
                    page: PlanUpload(),
                  ),
                  GoBack.btn(
                    "الفواتير",
                    context,
                    card1: 'عرض الفواتير',
                    pageCard1: view_invoices(),
                    card2: "إنشاء فاتورة",
                    pageCard2: invoices(),
                    card3: "تحميل فاتورة",
                    pageCard3: const UploadImageInvoice(),
                  ),
                  GoBack.btn(
                    "اضافة اصحاب المهن/ عمال",
                    context,
                    //card1: 'اضافة',
                    page: const Research(),
                    //IconButton(onPressed: ()=>GoBack.selectScreen(context, SearchHomePage()), icon: Icon(Icons.arrow_forward_ios_sharp , color: Colors.black,)),
                    // card3: card3,
                  ),
                  GoBack.btn(
                    "الدفعات",
                    context,
                    page: PaymentHistory(),
                  ),
                  GoBack.btn(
                    KeyLang.timeline.tr(),
                    context,
                    page: const TimeLine(),
                  ),
                  GoBack.btn(
                    "سجل العمال",
                    context,
                    page: const WorkersDetection(),
                  ),
                ],
              ),
            ),
          ],
        ),
        //==================================
        //-----------------------------------
        // child: ClipRRect(
        //   child: GridView.count(
        //     scrollDirection: Axis.vertical,
        //     crossAxisCount: 3,
        //     mainAxisSpacing: 15,
        //     //نسبت العرض لطول
        //     crossAxisSpacing: 15,
        //     //الفرافات بين العناصر
        //
        //
        //     children: [
        //       GoBack.tx('اسم المشروع '),
        //       GoBack.tx(' بناء مدرسة جامعة الزرقاء'),
        //       GoBack.tx(''),
        //       GoBack.tx('اسم المالك :\n محمد احمد'),
        //       GoBack.tx('اسم المهندس :\n احمد محمد'),
        //       GoBack.tx('اسم القاول :\n خالد خالد'),
        //       GoBack.btn(
        //         "اظهار المخطاطات",
        //         context,
        //         card1: 'اضافة',
        //         pageCard1: PlanUpload(),
        //       ),
        //       GoBack.btn(
        //         "الفواتير",
        //         context,
        //         card1: "إنشاء فاتورة",
        //         pageCard1: invoices(),
        //         card2: "تحميل فاتورة",
        //         pageCard2: UploadImageInvoice(),
        //       ),
        //       GoBack.btn(
        //         "اضافة اصحاب المهن/ عمال",
        //         context,
        //         card1: 'اضافة',
        //         pageCard1: CurrentProjectMain("hhh"),
        //         card2: "بحث ",
        //         pageCard2:
        //             Research(), //IconButton(onPressed: ()=>GoBack.selectScreen(context, SearchHomePage()), icon: Icon(Icons.arrow_forward_ios_sharp , color: Colors.black,)),
        //         // card3: card3,
        //       ),
        //       GoBack.btn(
        //         "الدفعات",
        //         context,
        //         page: PaymentHistory(),
        //       ),
        //       GoBack.btn(
        //         "المخطط الزمني",
        //         context,
        //         page: TimeLine(),
        //       ),
        //       GoBack.btn(
        //         "سجل العمال",
        //         context,
        //         page: WorkersDetection(),
        //       ),
        //     ],
        //   ),
        // ),
        //------------------------------------------
        //-----------------------------------========
      ),
    );
  }
}
