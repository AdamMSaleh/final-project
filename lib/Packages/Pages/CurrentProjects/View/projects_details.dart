// ignore_for_file: must_be_immutable, avoid_unnecessary_containers, prefer_const_constructors, prefer_adjacent_string_concatenation, implementation_imports, must_call_super

import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Packages/Components/Additions/go_back.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/appbar/sup_appbar.dart';
import 'package:flutter_finalproject/Packages/Components/upload_image_Invoice/upload_image.dart';
import 'package:flutter_finalproject/Packages/Pages/Invoice/Components/creat_invoices.dart';
import 'package:flutter_finalproject/Packages/Pages/Invoice/Components/view_invoices.dart';
import 'package:flutter_finalproject/Packages/Pages/Research/view/add_crafts.dart';
import 'package:flutter_finalproject/Packages/Pages/Research/view/body.dart';
import 'package:flutter_finalproject/Packages/Pages/project_%20parts/view/body.dart';
import 'package:flutter_finalproject/Packages/Pages/timeline/View/body.dart';

import '../../Payment_History/View/body.dart';
import '../../Plan/View/body.dart';

class ProjectsDetails extends StatefulWidget {

  static const String id = 'ProjectsDetails';

  String? str='',
      Projec_No,
      user_no_eng,
      project_name,
      City,
      Region,
      selectedDateStart,
      selectedDateEnd,
      Owner_User_ID,
      owner_name,
      construction_license,
      state;

  ProjectsDetails(
      {this.str,
      this.Projec_No,
      this.user_no_eng,
      this.project_name,
      this.City,
      this.Region,
      this.selectedDateStart,
      this.selectedDateEnd,
      this.Owner_User_ID,
      this.owner_name,
      this.construction_license,
      this.state,
      Key? key}): super(key: key);

  @override
  _ProjectsDetailsState createState() => _ProjectsDetailsState();
}

class _ProjectsDetailsState extends State<ProjectsDetails> {
  @override
  void initState() {
    setState(() {
      AddCrafts.isHomePage = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* AppBar
      appBar: AppBSup(txt: 'تفاصيل المشروع'),
      body: Container(
        // padding: const EdgeInsets.only(top:10,),//fromLTRB(15,10,10,0),
//----------------------------------------
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Table(
                    border: TableBorder.all(color: Colors.black, width: 1.5),
                    children: [
                      TableRow(children: [
                        GoBack.tx(' بناء مدرسة جامعة الزرقاء'),
                        GoBack.tx(': اسم المشروع'),
                      ]),
                      TableRow(children: [
                        GoBack.tx('عمر خالد'),
                        GoBack.tx(': اسم المالك'),
                      ]),
                      TableRow(children: [
                        GoBack.tx('خالد'),
                        GoBack.tx(': اسم المهندس'),
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
                      pageCard3: UploadImageInvoice(),
                    ),
                    GoBack.btn(
                      "اضافة اصحاب المهن/ عمال",
                      context,
                      //card1: 'اضافة',
                      page: Research(),
                      //IconButton(onPressed: ()=>GoBack.selectScreen(context, SearchHomePage()), icon: Icon(Icons.arrow_forward_ios_sharp , color: Colors.black,)),
                      // card3: card3,
                    ),
                    GoBack.btn(
                      "الدفعات",
                      context,
                      page: PaymentHistory(),
                    ),
                    GoBack.btn(
                      "المخطط الزمني",
                      context,
                      page: TimeLine(),
                    ),
                    GoBack.btn(
                      "سجل العمال",
                      context,
                      page: WorkersDetection(),
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
      ),
    );
  }
}
