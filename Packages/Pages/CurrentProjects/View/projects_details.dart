// ignore_for_file: must_be_immutable, avoid_unnecessary_containers, prefer_const_constructors, prefer_adjacent_string_concatenation

import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Packages/Components/Additions/go_back.dart';
import 'package:flutter_finalproject/Packages/Pages/Invoice/View/body.dart';
import 'package:flutter_finalproject/Packages/Pages/Payment_History/View/body.dart';
import 'package:flutter_finalproject/Packages/Pages/Plan/View/body.dart';
import 'package:flutter_finalproject/Packages/Pages/Research/view/body.dart';

import 'current_project_main1.dart';

class ProjectsDetails extends StatefulWidget {
  String str;

  ProjectsDetails(this.str, {Key? key}) : super(key: key);

  @override
  _ProjectsDetailsState createState() => _ProjectsDetailsState();
}

class _ProjectsDetailsState extends State<ProjectsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل المشروع '),
        leading: GoBack.back(context),
        centerTitle: true,
      ),
      body: Container(
        // padding: const EdgeInsets.only(top:10,),//fromLTRB(15,10,10,0),
        child: ClipRRect(
          child: GridView.count(
            scrollDirection: Axis.vertical,
            crossAxisCount: 3,
            mainAxisSpacing: 15,
            //نسبت العرض لطول
            crossAxisSpacing: 15,
            //الفرافات بين العناصر

            children: [
              GoBack.tx('اسم المشروع '),
              GoBack.tx(' بناء مدرسة جامعة الزرقاء'),
              GoBack.tx(''),
              GoBack.tx('اسم المالك :\n محمد احمد'),
              GoBack.tx('اسم المهندس :\n احمد محمد'),
              GoBack.tx('اسم القاول :\n خالد خالد'),
              GoBack.btn(
                "اظهار المخطاطات",
                context,
                card1:'اضافة / تعديل',
                pageCard1: PlanUpload(),


              ),
              GoBack.btn(
                "الفواتير",
                context,
                card1:'اضافة / تعديل',
                pageCard1: Invoice(),
              ),
              GoBack.btn(
                "اضافة اصحاب المهن/ عمال",
                context,
                card1: 'اضافة',
                pageCard1:
                CurrentProjectMain("اضافة اصحاب المهن/ عمال " + 'اضافة'),
                card2: "بحث ",
                pageCard2:
                Research(), //IconButton(onPressed: ()=>GoBack.selectScreen(context, SearchHomePage()), icon: Icon(Icons.arrow_forward_ios_sharp , color: Colors.black,)),
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
                page: CurrentProjectMain("المخطط الزمني"),
              ),
              GoBack.btn(
                "سجل العمال",
                context,
                page: CurrentProjectMain("سجل العمال"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
