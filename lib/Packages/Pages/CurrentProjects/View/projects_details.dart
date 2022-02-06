// ignore_for_file: must_be_immutable, avoid_unnecessary_containers, prefer_const_constructors, prefer_adjacent_string_concatenation, implementation_imports, must_call_super, non_constant_identifier_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_finalproject/DataBase/register.dart';
import 'package:flutter_finalproject/Packages/Components/Additions/go_back.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/appbar/sup_appbar.dart';
import 'package:flutter_finalproject/Packages/Components/upload_image_Invoice/upload_image.dart';
import 'package:flutter_finalproject/Packages/Pages/Home/Components/img_bttn.dart';
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
  static String? str1 = '',
      Projec_No1,
      user_no_eng1,
      project_name1,
      City1,
      Region1,
      selectedDateStart1,
      selectedDateEnd1,
      Owner_User_ID1,
      owner_name1,
      construction_license1,
      Project_Type1,
      state1;

  ProjectsDetails(
      {str,
      Projec_No,
      user_no_eng,
      project_name,
      City,
      Region,
      selectedDateStart,
      selectedDateEnd,
      Owner_User_ID,
      owner_name,
      Project_Type,
      construction_license,
      state,
      Key? key}) {
    str1 = str;
    Projec_No1 = Projec_No;
    user_no_eng1 = user_no_eng;
    project_name1 = project_name;
    City1 = City;
    Region1 = Region;
    selectedDateStart1 = selectedDateStart;
    selectedDateEnd1 = selectedDateEnd;
    Owner_User_ID1 = Owner_User_ID;
    owner_name1 = owner_name;
    Project_Type1 = Project_Type;
    construction_license1 = construction_license;
    state1 = state;
  }

  // : super(key: key);

  @override
  _ProjectsDetailsState createState() => _ProjectsDetailsState(
      // str1,
      // Projec_No1,
      // user_no_eng1,
      // project_name1,
      // City1,
      // Region1,
      // selectedDateStart1,
      // selectedDateEnd1,
      // Owner_User_ID1,
      // owner_name1,
      // Project_Type1,
      // construction_license1,
      // state1,
      );
}

class _ProjectsDetailsState extends State<ProjectsDetails> {
  // _ProjectsDetailsState(
  //     this.str,
  //     this.Projec_No,
  //     this.user_no_eng,
  //     this.project_name,
  //     this.City,
  //     this.Region,
  //     this.selectedDateStart,
  //     this.selectedDateEnd,
  //     this.Owner_User_ID,
  //     this.owner_name,
  //     this.Project_Type,
  //     this.construction_license,
  //     this.state,
  //     );
  //
  //
  // String? str = '',
  //     Projec_No,
  //     user_no_eng,
  //     project_name,
  //     City,
  //     Region,
  //     selectedDateStart,
  //     selectedDateEnd,
  //     Owner_User_ID,
  //     owner_name,
  //     construction_license,
  //     Project_Type,
  //     state;
  String engName = '';

  x() async {
    engName = await Register().getEngName(ProjectsDetails.user_no_eng1!);
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
    // Fill_plane_page.Projec_No = ProjectsDetails.Projec_No1!;
    widget.isStarted = ProjectsDetails.state1 == '1';
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
                        GoBack.tx(' بناء ' + ProjectsDetails.project_name1!),
                        GoBack.tx(': اسم المشروع'),
                      ]),
                      TableRow(children: [
                        GoBack.tx(ProjectsDetails.owner_name1!),
                        GoBack.tx(': اسم المالك'),
                      ]),
                      TableRow(children: [
                        GoBack.tx(engName),
                        GoBack.tx(': اسم المهندس'),
                      ]),
                      TableRow(children: [
                        GoBack.tx(ProjectsDetails.selectedDateStart1!),
                        GoBack.tx(':  تاريخ البدء'),
                      ]),
                      TableRow(children: [
                        GoBack.tx(ProjectsDetails.selectedDateEnd1!),
                        GoBack.tx(':  تاريخ النتهاء'),
                      ]),
                      TableRow(children: [
                        ProjectsDetails.state1 == '1'
                            ? GoBack.tx(("  قيد الأنشاء  "),
                                textColor: Colors.lightBlue)
                            : GoBack.tx(("   منتهي   "),
                                textColor: Colors.redAccent),
                        GoBack.tx('حالة المشروع'),
                      ]),
                      TableRow(children: [
                        ProjectsDetails.Project_Type1 == 'new'
                            ? GoBack.tx(("  مشروع جديد  "),
                                textColor: Colors.green.shade400)
                            : GoBack.tx(("   مشروع ترميم/إصلاح   "),
                                textColor: Colors.green.shade600),
                        GoBack.tx('نوع المشروع'),
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
                        ? GoBack.btnFn("اضافة اصحاب المهن/ عمال", context,
                            func: () {
                            GoBack.selectScreen(context, Research());
                            BtnImg.onLoading(context);
                          })
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
                            ProjectsDetails.Projec_No1!,
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
