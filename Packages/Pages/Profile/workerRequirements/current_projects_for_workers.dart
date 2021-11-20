import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Packages/Components/Additions/go_back.dart';
import 'package:intl/intl.dart';

class CurrentProjectsForWorkers extends StatefulWidget {
  const CurrentProjectsForWorkers({Key? key}) : super(key: key);

  @override
  _CurrentProjectsForWorkersState createState() =>
      _CurrentProjectsForWorkersState();
}

/*                   المشاريع الحالية للعمال           */
class _CurrentProjectsForWorkersState extends State<CurrentProjectsForWorkers> {
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
                              GoBack.tx("المشروع 1"),
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

                                  GoBack.tx("اسم المشروع :"),
                                  SizedBox(
                                    height: sizeBoxValue,
                                  ),
                                  GoBack.tx("تاريخ الاستلام :"),
                                  SizedBox(
                                    height: sizeBoxValue,
                                  ),
                                  GoBack.tx("تاريخ التسليم :"),
                                ],
                              ),
                              Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  GoBack.tx("يوسف منصور"),


                                  SizedBox(
                                    height: sizeBoxValue,
                                  ),
                                  GoBack.tx("بناء مدرسة"),
                                  SizedBox(
                                    height: sizeBoxValue,
                                  ),
                                  GoBack.tx(DateFormat('yy/MM/dd')
                                      .format(DateTime.now())),
                                  SizedBox(
                                    height: sizeBoxValue,
                                  ),
                                  GoBack.tx(DateFormat('yy/MM/dd')
                                      .format(DateTime.now().add(const Duration(days: 35)))),
                                ],
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all<Color>(
                                      Colors.white38),
                                ),
                                onPressed: () {},
                                child: Padding(
                                  padding: EdgeInsets.all(sizeBoxValue),
                                  child:  Text('تسليم',style:TextStyle(color: Colors.green[700],fontSize: 19,),

                                  ),
                                ),
                              ),

                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all<Color>(
                                      Colors.white38),
                                ),
                                onPressed: () {},
                                child: Padding(
                                  padding: EdgeInsets.all(sizeBoxValue),
                                  child:  Text('تأجيل',style:TextStyle(color: Colors.red[600],fontSize: 19,),
                                  ),
                                ),
                              )
                            ],
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
                        GoBack.tx("المشروع 2"),
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

                            GoBack.tx("اسم المشروع :"),
                            SizedBox(
                              height: sizeBoxValue,
                            ),
                            GoBack.tx("تاريخ الاستلام :"),
                            SizedBox(
                              height: sizeBoxValue,
                            ),
                            GoBack.tx("تاريخ التسليم :"),
                          ],
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GoBack.tx("يوسف منصور"),


                            SizedBox(
                              height: sizeBoxValue,
                            ),
                            GoBack.tx("بناء مدرسة"),
                            SizedBox(
                              height: sizeBoxValue,
                            ),
                            GoBack.tx(DateFormat('yy/MM/dd')
                                .format(DateTime.now())),
                            SizedBox(
                              height: sizeBoxValue,
                            ),
                            GoBack.tx(DateFormat('yy/MM/dd')
                                .format(DateTime.now().add(const Duration(days: 49)))),
                          ],
                        ),
                      ],
                    ),


                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all<Color>(
                                  Colors.white38),
                            ),
                            onPressed: () {},
                            child: Padding(
                              padding: EdgeInsets.all(sizeBoxValue),
                              child:  Text('تسليم',style:TextStyle(color: Colors.green[700],fontSize: 19,),

                              ),
                            ),
                      ),

                           ElevatedButton(
                             style: ButtonStyle(
                               backgroundColor:
                               MaterialStateProperty.all<Color>(
                                   Colors.white38),
                             ),
                             onPressed: () {},
                             child: Padding(
                               padding: EdgeInsets.all(sizeBoxValue),
                               child:  Text('تأجيل',style:TextStyle(color: Colors.red[600],fontSize: 19,),
                             ),
                           ),
                           )
                         ],
                       ),



                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GoBack.tx('المشاريع الحالية للعمال'),              ],
            ),
          ],
        ),
      ),
    );
  }
}


