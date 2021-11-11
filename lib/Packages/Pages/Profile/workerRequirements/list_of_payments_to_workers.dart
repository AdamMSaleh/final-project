import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Packages/Components/Additions/go_back.dart';

import 'package:intl/intl.dart';

class ListOfPaymentsToWorkers extends StatefulWidget {
  const ListOfPaymentsToWorkers({Key? key}) : super(key: key);

  @override
  _ListOfPaymentsToWorkersState createState() => _ListOfPaymentsToWorkersState();
}
/*                   قائمة الدفعات للعمال           */
class _ListOfPaymentsToWorkersState extends State<ListOfPaymentsToWorkers> {
  List <String> invoice_Information_Print=["امجد ماجد", DateFormat('yy/MM/dd').format(DateTime.now()),"بناء مدرسة","1500 د.أ"];
  List <String> general_form_Print=[];
  @override
  Widget build(BuildContext context) {
    double sizeBoxValue = 8;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: (MediaQuery.of(context).size.width),
                  child: Card(
                    margin: const EdgeInsets.all(15),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GoBack.tx("الفاتورة 1"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GoBack.tx("من :"),
                                  SizedBox(
                                    height: sizeBoxValue,
                                  ),
                                  GoBack.tx("تاريخ الاستلام :"),
                                  SizedBox(
                                    height: sizeBoxValue,
                                  ),

                                  GoBack.tx("اسم المشروع :"),
                                  SizedBox(
                                    height: sizeBoxValue,
                                  ),
                                  GoBack.tx("القيمة :"),
                                ],
                              ),
                              Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  GoBack.tx("يوسف منصور"),
                                  SizedBox(
                                    height: sizeBoxValue,
                                  ),
                                  GoBack.tx(DateFormat('yy/MM/dd')
                                      .format(DateTime.now())),

                                  SizedBox(
                                    height: sizeBoxValue,
                                  ),
                                  GoBack.tx("بناء مدرسة"),
                                  SizedBox(
                                    height: sizeBoxValue,
                                  ),
                                  GoBack.tx("1100 د.أ"),
                                ],
                              ),
                            ],
                          ),

                              SizedBox(
                                width: (MediaQuery.of(context).size.width),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white38),
                                  ),
                                  onPressed: () {},//=>GoBack.selectScreen(context, pdfFile()),
                                  child: Padding(
                                    padding: EdgeInsets.all(sizeBoxValue),
                                    child:  Icon(
                                      Icons.download,
                                      size: sizeBoxValue*4,
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                ),
                              ),



                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: sizeBoxValue * 2.2,
            ),
            Card(
              margin: const EdgeInsets.all(15),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GoBack.tx("الفاتورة 2"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GoBack.tx("من :"),
                            SizedBox(
                              height: sizeBoxValue,
                            ),
                            GoBack.tx("تاريخ الاستلام :"),
                            SizedBox(
                              height: sizeBoxValue,
                            ),

                            GoBack.tx("اسم المشروع :"),
                            SizedBox(
                              height: sizeBoxValue,
                            ),
                            GoBack.tx("القيمة :"),
                          ],
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GoBack.tx("امجد ماجد"),
                            SizedBox(
                              height: sizeBoxValue,
                            ),
                            GoBack.tx(
                                DateFormat('yy/MM/dd').format(DateTime.now())),
                            SizedBox(
                              height: sizeBoxValue,
                            ),
                            GoBack.tx("بناء مدرسة"),
                            SizedBox(
                              height: sizeBoxValue,
                            ),
                            GoBack.tx("1500 د.أ"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(
                              Colors.white38),
                        ),
                        onPressed: () {},//=>GoBack.selectScreen(context, pdfFile()),
                        child: Padding(
                          padding: EdgeInsets.all(sizeBoxValue),
                          child:  Icon(
                            Icons.download,
                            size: sizeBoxValue*4,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GoBack.tx('قائمة الدفعات للعمال'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


