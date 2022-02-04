// ignore_for_file: must_be_immutable, avoid_unnecessary_containers, prefer_const_constructors, prefer_adjacent_string_concatenation, implementation_imports, must_call_super, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_finalproject/DataBase/register.dart';
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
  bool isStarted = false;
  String? str = '',
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
      Project_Type,
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
      this.Project_Type,
      this.construction_license,
      this.state,
      Key? key})
      : super(key: key);

  @override
  _ProjectsDetailsState createState() => _ProjectsDetailsState();
}

class _ProjectsDetailsState extends State<ProjectsDetails> {
  String engName = '';

  x() async {
    engName = await Register().getEngName(widget.user_no_eng!);
    setState(() {
      engName;
    });
  }

  @override
  void initState() {
    x();
    setState(() {
      AddCrafts.isHomePage = false;
    });
    widget.isStarted = widget.state == '1';
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
                        GoBack.tx(' بناء ' + widget.project_name!),
                        GoBack.tx(': اسم المشروع'),
                      ]),
                      TableRow(children: [
                        GoBack.tx(widget.owner_name!),
                        GoBack.tx(': اسم المالك'),
                      ]),
                      TableRow(children: [
                        GoBack.tx(engName),
                        GoBack.tx(': اسم المهندس'),
                      ]),
                      TableRow(children: [
                        GoBack.tx(widget.selectedDateStart!),
                        GoBack.tx(':  تاريخ البدء'),
                      ]),
                      TableRow(children: [
                        GoBack.tx(widget.selectedDateEnd!),
                        GoBack.tx(':  تاريخ النتهاء'),
                      ]),
                      TableRow(children: [
                        widget.state == '1'
                            ? GoBack.tx(("  قيد الأنشاء  "),
                                textColor: Colors.lightBlue)
                            : GoBack.tx(("   منتهي   "),
                                textColor: Colors.redAccent),
                        GoBack.tx('حالة المشروع'),
                      ]),
                      TableRow(children: [
                        widget.Project_Type == 'new'
                            ? GoBack.tx(("  مشروع جديد  "),
                                textColor: Colors.green.shade400)
                            : GoBack.tx(("   مشروع ترميم/إصلاح   "),
                                textColor: Colors.green.shade600),
                        GoBack.tx('حالة المشروع'),
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
                      card2: widget.isStarted ? "إنشاء فاتورة" : null,
                      pageCard2: widget.isStarted ? invoices() : null,
                      card3: widget.isStarted ? "تحميل فاتورة" : null,
                      pageCard3: widget.isStarted ? UploadImageInvoice() : null,
                    ),
                    widget.isStarted
                        ? GoBack.btn(
                            "اضافة اصحاب المهن/ عمال",
                            context,
                            //card1: 'اضافة',
                            page: Research(),
                            //IconButton(onPressed: ()=>GoBack.selectScreen(context, SearchHomePage()), icon: Icon(Icons.arrow_forward_ios_sharp , color: Colors.black,)),
                            // card3: card3,
                          )
                        : Container(),
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
                    widget.isStarted
                        ?
                        // _showOption(context)
                        GoBack().btnAlertDialog(
                            GoBack.tx("   انهاء المشروع   ",
                                textColor: Colors.red.shade500, sizee: 19),
                            widget.Projec_No!,
                            context,
                          )
                        : Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
