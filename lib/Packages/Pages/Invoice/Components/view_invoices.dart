// ignore_for_file: unnecessary_this, camel_case_types, non_constant_identifier_names, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Packages/Components/Select_Screen/select_screen.dart';
import 'package:flutter_finalproject/Packages/Pages/CurrentProjects/View/projects_details.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'creat_invoices.dart';
import 'design.dart';
import 'detiels_invoices.dart';

// ignore: must_be_immutable
class view_invoices extends StatefulWidget {
  static const String id = 'view_invoices';
  List<Detiels_Invoices>? invoice_info;
  view_invoices({
    Key? key,
    this.invoice_info,
  }) : super(key: key) {
    if (this.invoice_info == null) {
      invoice_info = [];
    }
  }

  @override
  _view_invoicesState createState() =>
      _view_invoicesState(invoice_info1: invoice_info);
}

class _view_invoicesState extends State<view_invoices> {
  List<Detiels_Invoices>? invoice_info1 = [];
  countpuls(countt) {
    return countt = countt + 1;
  }

  _view_invoicesState({this.invoice_info1});
  int count = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: project_color('741b47'),
        // ignore: prefer_const_constructors
        title: Text("الفواتير"),
        // centerTitle: true,
        leading: IconButton(
            onPressed: () {
              SelSc().selectScreen(context, ProjectsDetails('تفاصيل المشروع'));
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Container(
        //color: project_color('efcba7'),
        // constraints: const BoxConstraints.expand(),
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/Images/4545.jpg'),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        height: (MediaQuery.of(context).size.height) * 0.75,

        child: invoice_info1!.isNotEmpty
            ? ListView(
                children: [
                  ...invoice_info1!.map(
                    (e) => Container(
                      // decoration: const BoxDecoration(
                      //   image: DecorationImage(
                      //     image: AssetImage('assets/Images/4545.jpg'),
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                      // margin: EdgeInsets.all(10),
                      child: Container(
                        //هاد الكاتيغيوري لكل فاتورة
                        margin: const EdgeInsets.all(30),
                        // height: (MediaQuery.of(context).size.height) / 3,
                        decoration: BoxDecoration(
                          color: FitnessAppTheme.white,
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(68.0),
                              bottomLeft: Radius.circular(68.0),
                              bottomRight: Radius.circular(68.0),
                              topLeft: Radius.circular(68.0)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: project_color('741b47'),
                                offset: const Offset(1.1, 1.1),
                                blurRadius: 10.0),
                          ],
                        ),
                        child: Padding(
                          padding:
                              //padding for 2100 and  of dialy gole
                              const EdgeInsets.only(
                                  top: 5, left: 5, right: 5, bottom: 5),
                          child: Row(
                            children: <Widget>[
                              //-----------------------------
                              //-----------------------------
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.all(23.w),
                                              child: Text(e.name_item),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(23.w),
                                              child: Text('${e.price}'),
                                            ),
                                            Padding(
                                              // ignore: prefer_const_constructors
                                              padding: EdgeInsets.all(23),
                                              child: Text('${e.count_item}'),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(23),
                                              child: Text('${e.total}'),
                                            ),

                                            //-----------------------
                                            //هاد الخط الفاصل بين ايقونات التعديل والحذف والمجموع
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4,
                                                  right: 4,
                                                  top: 8,
                                                  bottom: 8),
                                              child: Container(
                                                height: 1,
                                                color: project_color('741b47'),
                                                margin: const EdgeInsets.only(
                                                    left: 23, bottom: 10),
                                              ),
                                            ),
                                            //---------------------
                                            // Padding(
                                            //   padding: const EdgeInsets.only(
                                            //       left: 4,
                                            //       right: 4,
                                            //       top: 8,
                                            //       bottom: 8),
                                            //   child: Container(
                                            //     height: 1,
                                            //     color: project_color('76b5c5'),
                                            //     margin: const EdgeInsets.only(
                                            //         left: 23, bottom: 10),
                                            //   ),
                                            // ),
                                            //--------------------------
                                            Padding(
                                              //ايقونة تعديل الفاتورة  الكبسة
                                              // ignore: prefer_const_constructors
                                              padding: EdgeInsets.all(5),
                                              child: ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(Colors.blue)),
                                                child: const Icon(Icons.edit),
                                                onPressed: () {
                                                  setState(() {
                                                    // int vul = invoice_info1.;
                                                    // invoice_info1!
                                                    //     .removeAt(vul);
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              //--------------------------
                              //--------------------------
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            const Padding(
                                              padding: EdgeInsets.all(20),
                                              child: Text(': اسم الصنف'),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(20),
                                              child: Text(': السعر'),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(20),
                                              child: Text(': العدد'),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(20),
                                              child: Text(': المجموع'),
                                            ),
                                            //-----------------------
                                            //هاد الخط الفاصل بين ايقونات التعديل والحذف والمجموع
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4,
                                                  right: 4,
                                                  top: 13,
                                                  bottom: 8),
                                              child: Container(
                                                height: 1,
                                                color: project_color('741b47'),
                                                margin: const EdgeInsets.only(
                                                    right: 23, bottom: 10),
                                              ),
                                            ),
                                            //--------------------------------
                                            Padding(
                                              //هي ايقونة حذف الفاتورة سلة المهملات الكبسة
                                              padding: const EdgeInsets.all(5),
                                              child: ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(Colors.red)),
                                                child: const Icon(Icons.delete),
                                                onPressed: () {
                                                  setState(() {
                                                    // int vul = invoice_info1.;
                                                    // invoice_info1!
                                                    //     .removeAt(vul);
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(
                              //       left: 4, right: 4, top: 8, bottom: 8),
                              //   child: Container(
                              //     height: 1,
                              //     color: Colors.black,
                              //     margin: EdgeInsets.only(right: 20, left: 20),
                              //   ),
                              // ),
//---------------------------------------------------------
//---------------------------------------------------------
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'لا يوجد فواتير حاليا',
                      style: TextStyle(
                          color: project_color('741b47'), fontSize: 18),
                    ),
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        // Within the `FirstRoute` widget
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => invoices(
                      invoice_info: invoice_info1,
                    )),
          );
        },
        child: const Icon(
          Icons.add,
          size: 40,
        ),
        backgroundColor: project_color('741b47'),
      ),
    );

    //---------------------------------------
  }
}
