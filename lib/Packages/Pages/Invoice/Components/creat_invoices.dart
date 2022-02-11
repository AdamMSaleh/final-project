// ignore_for_file: no_logic_in_create_state, unnecessary_this, non_constant_identifier_names, camel_case_types, must_be_immutable, prefer_const_constructors, avoid_print, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_finalproject/DataBase/register.dart';
import 'package:flutter_finalproject/Packages/Pages/CurrentProjects/View/projects_details.dart';

import 'design.dart';
import 'detiels_invoices.dart';
import 'view_invoices.dart';

class invoices extends StatefulWidget {
  // List<Detiels_Invoices>? invoice_info;

  invoices({
    Key? key,
    // this.invoice_info,
  }) : super(key: key) {
    // if (this.invoice_info == null) {
    //   invoice_info = [];
    // }
  }

  @override
  _invoicesState createState() =>
      _invoicesState(/*invoice_info1: invoice_info*/);
}
//-------------------------------------------------------
//-------------------------------------------------------

class _invoicesState extends State<invoices> {
  // List<Detiels_Invoices>? invoice_info1 = [];

  // _invoicesState({this.invoice_info1});

  //--------------------
  //--------------------
  late TextEditingController myControllerNameItem = TextEditingController();
  late TextEditingController myControllerPriceItem = TextEditingController();
  late TextEditingController myControllerCountItem = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // invoice_info1 = [
    //   Detiels_Invoices('asmaa', 4.7, 2),
    //   Detiels_Invoices('ali', 55, 3),
    //   Detiels_Invoices('heba', 13, 6),
    // ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: project_color('741b47'),
        title: Text('إضافة فاتورة جديدة'),
        leading: IconButton(
            onPressed: // Within the `FirstRoute` widget
                () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => view_invoices(
                        // invoice_info: invoice_info1,
                        )),
              );
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body: Container(
        color: project_color('741b47'),
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/Images/4545.jpg'),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Container(
          //هاد الكاتيغيوري لكل فاتورة
          margin: const EdgeInsets.all(30),
          height: (MediaQuery.of(context).size.height) * 0.70,

          decoration: BoxDecoration(
            // image: const DecorationImage(
            //   image: AssetImage("assets/Images/4545.jpg"),
            // ),
            color: FitnessAppTheme.white,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
                topLeft: Radius.circular(68.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: FitnessAppTheme.white.withOpacity(0.2),
                  offset: const Offset(1.1, 1.1),
                  blurRadius: 10.0),
            ],
          ),
          child: Padding(
            padding:
                //padding for 2100 and  of dialy gole
                const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 4, bottom: 5, top: 3),
                                child: textfild_function(
                                  'ادخل اسم الصنف',
                                  '935139',
                                  myControllerNameItem,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 4, bottom: 3),
                                child: textfild_function('ادخل العدد', '935139',
                                    myControllerCountItem,
                                    TKbor: false),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 4, bottom: 3),
                                child: textfild_function('ادخل السعر', '935139',
                                    myControllerPriceItem,
                                    TKbor: false),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Padding(
                      //   //الخط الفاصل للمجموع
                      //   padding: const EdgeInsets.only(
                      //       left: 4, right: 4, top: 8, bottom: 16),
                      //   child: Container(
                      //     height: 1,
                      //     decoration: BoxDecoration(
                      //       color: project_color('76b5c5'),
                      //       borderRadius:
                      //           BorderRadius.all(Radius.circular(4.0)),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                /***************************************************** */
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 4, bottom: 3),
                                child: Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Text(
                                    ': اسم الصنف',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: FitnessAppTheme.fontName,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: FitnessAppTheme.text_color,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 4, bottom: 3),
                                child: Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Text(
                                    ' : العدد ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: FitnessAppTheme.fontName,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: FitnessAppTheme.text_color,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 4, bottom: 3, top: 30),
                                child: Text(
                                  ': السعر',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: FitnessAppTheme.fontName,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: FitnessAppTheme.text_color,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Padding(
                      //   //الخط الفاصل للمجموع
                      //   padding: const EdgeInsets.only(
                      //       left: 4, right: 4, top: 8, bottom: 16),
                      //   child: Container(
                      //     height: 1,
                      //     decoration: BoxDecoration(
                      //       color: project_color('76b5c5'),
                      //       borderRadius:
                      //           BorderRadius.all(Radius.circular(4.0)),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          //ProjectsDetails.Projec_No1!
          // var x = Detiels_Invoices(
          //     myControllerNameItem.text,
          //     double.parse(myControllerPriceItem.text),
          //     int.parse(myControllerCountItem.text));
          if (myControllerNameItem.text.isNotEmpty &&
              myControllerPriceItem.text.isNotEmpty &&
              myControllerCountItem.text.isNotEmpty) {
            Register().createInvoices(
              context: context,
              projec_No: ProjectsDetails.Projec_No1!,
              number_pd: myControllerCountItem.text,
              price_pd: myControllerPriceItem.text,
              product_name: myControllerNameItem.text,
            );
            // invoice_info1!.add(x);
            // print(x);
            myControllerNameItem.clear();
            myControllerPriceItem.clear();
            myControllerCountItem.clear();
            Register().tostforRegsetr('تمت اضافة الفاتورة في صفحة الفواتير');
          }
        }),
        child: Icon(
          Icons.add,
          size: 40,
        ),
        backgroundColor: project_color('741b47'),
      ),
    );
  }
}
