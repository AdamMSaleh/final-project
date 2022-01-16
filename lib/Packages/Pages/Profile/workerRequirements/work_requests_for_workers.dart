import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Packages/Components/Additions/go_back.dart';
import 'package:intl/intl.dart';

class WorkRequestsForWorkers extends StatefulWidget {
  const WorkRequestsForWorkers({Key? key}) : super(key: key);

  @override
  _WorkRequestsForWorkersState createState() => _WorkRequestsForWorkersState();
}

/*                  طلبات العمل للعمال           */
class _WorkRequestsForWorkersState extends State<WorkRequestsForWorkers> {
  @override
  Widget build(BuildContext context) {
    double sizeBoxValue = 8;
    return Scaffold(
      body: Column(
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
                            GoBack.tx("طلب عمل"),
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
                                GoBack.tx("تاريخ الطلب :"),
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
                                        Colors.orange.shade100),
                              ),
                              onPressed: () {},
                              child: Padding(
                                padding: EdgeInsets.all(sizeBoxValue),
                                child: const Icon(
                                  Icons.call,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.orange.shade100),
                              ),
                              onPressed: () {},
                              child: Padding(
                                padding: EdgeInsets.all(sizeBoxValue),
                                child: const Icon(
                                  Icons.check_circle_outline_rounded,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.orange.shade100),
                              ),
                              onPressed: () {},
                              child: Padding(
                                padding: EdgeInsets.all(sizeBoxValue),
                                child: const Icon(
                                  Icons.cancel_outlined,
                                  color: Colors.red,
                                ),
                              ),
                            ),
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
                      GoBack.tx("تأكيد دفعه"),
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
                          GoBack.tx("تاريخ الطلب :"),
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
                          GoBack.tx("1500 د.أ"),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.orange.shade100),
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: EdgeInsets.all(sizeBoxValue),
                          child: const Icon(
                            Icons.check_circle_outline_rounded,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.orange.shade100),
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: EdgeInsets.all(sizeBoxValue),
                          child: const Icon(
                            Icons.restore,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     GoBack.tx('طلبات العمل للعمال'),
          //   ],
          // ),
        ],
      ),
    );
  }
}
