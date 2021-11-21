// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, implementation_imports, unused_import, must_be_immutable, sized_box_for_whitespace, duplicate_ignore, deprecated_member_use, avoid_unnecessary_containers, non_constant_identifier_names
import 'dart:math';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/Drawer/drawer.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/app_loading.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/enum_loading.dart';
import 'package:flutter_finalproject/Packages/Components/cach_image/image_user.dart';
import 'package:flutter_finalproject/Packages/Pages/Archive/View/body.dart';
import 'package:flutter_finalproject/Packages/Pages/CurrentProjects/View/body.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/appbar.dart';
import 'package:flutter_finalproject/Packages/Pages/NewProject/View/new_project.dart';
import 'package:flutter_finalproject/Packages/Pages/NewProject/components/BoxDialog/dialog.dart';

import 'package:flutter_finalproject/Packages/Pages/Profile/View/profile.dart';
import 'package:flutter_finalproject/Packages/Pages/Profile/View/upload_image.dart';
import 'package:flutter_finalproject/Packages/Pages/Research/view/body.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/style.dart';
import 'package:flutter_finalproject/Utils/path_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../Components/infoo.dart';

class PaymentHistory extends StatefulWidget {
  static const String id = 'PaymentHistory';

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory>
    with TickerProviderStateMixin {
  var myControllerName = TextEditingController();
  var myControllerValue = TextEditingController();

  String? setDate;
  List<Infoo> yy = [
    Infoo(
      name: "Asmaa1",
      value: 150.9,
      date: "11-9-2021",
      ico: Icon(Icons.cancel),
    ),
    Infoo(
      name: "Asmaa1",
      value: 150.9,
      date: "3-12-2021",
      ico: Icon(Icons.verified),
    ),
    Infoo(
      name: "Asmaa1",
      value: 150.9,
      date: "12-12-2021",
      ico: Icon(Icons.timer_outlined),
    ),
  ];

  void _datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.utc(1999, 1, 1), //الوقت الافتراضي
      firstDate: DateTime(1999), //اول وقت ممكن اختار منو
      lastDate: DateTime.now(), //اخر وقت مككن اختار منو
    ).then((value) {
      if (value == null) {
        setDate = 'تاريخ الدفعة';
      } else {
        setState(() {
          setDate = DateFormat('yyyy-MM-dd').format(value);
        });
      }
    });
  }
  // late  AnimationController controller ;
  // late Animation<num> animation;
  // @override
  // void initState() {
  //   super.initState();
  //   controller =AnimationController(
  //     duration: const Duration(
  //         seconds: 4),
  //     vsync: this,
  //   )..repeat();
  //   animation = Tween(begin: 0,end: 2 * pi).animate(controller);
  // }

  void btnPayment(BuildContext assoom) {
    showModalBottomSheet(
      // useRootNavigator: true,
      isScrollControlled: true,
      context: assoom,
      builder: (_) {
        return Container(
          height: double.infinity,
          padding: const EdgeInsets.all(20),
          color: Theme.of(assoom).accentColor,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
//-------------start buttom sheet------------------------------------------
                Container(
                  margin: const EdgeInsets.all(12.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'الاسم',
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      hintText: 'Enter Name',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      prefixIcon: Icon(
                        Icons.person_outline_outlined,
                        color: Colors.orange,
                      ),
                    ),
                    controller: myControllerName,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.name,
                  ),
                ),
                //
                //
                //
                //

                //
                //
                //
                Container(
                  margin: const EdgeInsets.all(12.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'القيمه',
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      hintText: 'Enter Value',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      prefixIcon: Icon(
                        Icons.payment,
                        color: Colors.orange,
                      ),
                    ),
                    controller: myControllerValue,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                //
                //
                //
                //

                Container(
                  margin: const EdgeInsets.all(12.0),
                  width: (MediaQuery.of(context).size.width),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.orange),
                    ),
                    onPressed: () {
                      setState(() {
                        _datePicker();
                        // getText();
                      });
                    },
                    child: Text(
                      setDate ?? 'تاريخ الدفعة',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),

                //
                //
                //
                //

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      ElevatedButtonAddValue(context);
                    });
                  },
                  child: const Text(
                    'اضافة',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                ),
                //
                //
                //
                //
                //
                //
                //
                //
                //
                // AnimatedBuilder(
                //     animation: animation,
                //     child: FlutterLogo (),
                //     builder: (context, child) {
                //       return Transform.rotate(
                //         angle: animation.value as double,
                //         child: FlutterLogo(),
                //       );
                //     })
              ],
            ),
          ),
        );
//----------end buttom sheet-----------------------------------------------------
      },
    );
  }

//----------------------------------------------------------------
  Color w = Colors.white;
  Color b = Colors.black;
  Color o = Colors.orange;
  Color t = Colors.teal;
  Color l = Colors.lime;
  Color g = Colors.green;
  Color r = Colors.red;
  Color p = Colors.pink;
  Color bl = Colors.blue;
  final items = ['دهان', 'حداد', 'نجار', 'بليط', 'المنيوم', 'كهربجي'];
  String? value;

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
        ),
      );

  @override
  Widget build(BuildContext context) {
    /***********************************************************/
    return Scaffold(
      //*Appbar
      appBar: AppBHome(),
      //*drawer
      drawer: DrawerHome(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                //drop down menu :
                /*هون الليست تاع المهن */

                child: SingleChildScrollView(
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(20),
                        /*-------------------------------------------------------*/
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: b,
                              width: 2,
                            ),
                          ),
                          child: DropdownButton<String>(
                            // isExpanded: true,
                            iconSize: 36,
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: b,
                            ),
                            hint: Text("  فرز الدفعات حسب أصحاب المهن    "),
                            value: value,
                            items: items.map(buildMenuItem).toList(),
                            onChanged: (value) =>
                                setState(() => this.value = value),
                          ),
                        ),
                      ),
                      //-------------------------------------------
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  child: Text(
                    'اسم المستفيد',
                    style: TextStyle(
                      fontSize: 18,
                      color: b,
                    ),
                  ),
                  // alignment: Alignment.center,
                  // width: (MediaQuery.of(context).size.width) / 3.5,
                ),
              ),
              Expanded(
                child: Container(
                  child: Text(
                    'قيمة الدفعة',
                    style: TextStyle(
                      fontSize: 18,
                      color: b,
                    ),
                  ),
                  // alignment: Alignment.center,
                  // width: (MediaQuery.of(context).size.width) / 4,
                ),
              ),
              Expanded(
                child: Container(
                  child: Text(
                    'تاريخ الدفعة',
                    style: TextStyle(
                      fontSize: 18,
                      color: b,
                    ),
                  ),
                  // alignment: Alignment.center,
                  // width: (MediaQuery.of(context).size.width) / 4,
                ),
              ),
              Expanded(
                child: Container(
                  child: Text(
                    'حالة الدفعة',
                    style: TextStyle(
                      fontSize: 18,
                      color: b,
                    ),
                  ),
                  // alignment: Alignment.center,
                  // width: (MediaQuery.of(context).size.width) / 6,
                ),
              ),
            ],
          ),
          Row(
            children: [
              //----------------------------------------------------------
              //عرض القيم للفواتير
              //cards
              Expanded(
                flex: 1,
                child: Container(
                  height: (MediaQuery.of(context).size.height) / 2,
                  width: (MediaQuery.of(context).size.width),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ...yy.map((e) {
                          return Container(
                            padding: EdgeInsets.all(10.0),
                            //ببعد الكروت كلها اللي جوا نفس هاد الكونتينر عن بعض مقدار 10

                            color: t,
                            child: Card(
                              // padding: EdgeInsets.all(10.0),
                              margin: EdgeInsets.all(10.0), //خصائص الكرت
                              elevation: 10, //ارتفاع الكرت عن الصفحة
                              //بنحط ارتفاع كرمال يبين معنا الشادو للكرت
                              shadowColor: o,
                              color: o,
                              child: Padding(
                                padding: const EdgeInsets.all(
                                    10), //ابعاد محتوى الكرت عن اطار الكرت نفسه

                                child: Column(
                                  children: [
                                    Row(
                                      // mainAxisAlignment:
                                      // MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: (MediaQuery.of(context)
                                                    .size
                                                    .width) /
                                                3.9,
                                            child: Text(
                                              e.name,
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: w,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: (MediaQuery.of(context)
                                                    .size
                                                    .width) /
                                                6,
                                            child: Text(
                                              "${e.value}",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: w,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: (MediaQuery.of(context)
                                                    .size
                                                    .width) /
                                                4.2,
                                            child: Text(
                                              e.date,
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: w,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            margin: EdgeInsets.only(left: 8),
                                            alignment: Alignment.center,
                                            width: (MediaQuery.of(context)
                                                    .size
                                                    .width) /
                                                7,
                                            child: e.ico,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      //الزر العائم لاضافة دفعة

      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          btnPayment(context);
        }),
        child: Icon(
          // Icons.verified_sharp,
          Icons.add,
          color: b,
          size: 40,
        ),
      ),
    );
  }

  ElevatedButtonAddValue(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (
        BuildContext context,
      ) =>
          AlertDialog(
        title: const Text(' : إضافة دفعة '),
        content: const Text('  للإضافة او الغاء ok اضغط  '),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              ElevatedButtonAddValue1(context);
              Navigator.pop(context, 'OK');
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  ElevatedButtonAddValue1(
    //هي الميثود اللي بتعمل اوبجكت وبتعطيه قيم من المنيو يلي بنعبيها اللي هي كبسة الاضافة
    //يعني لما عبي الاسم بتحطه عند الاسم بجدول الفاتورة  ولما اعبي التاريخ والقيمة نفس الشي
    BuildContext context,
  ) {
    setState(() {
      var ff = Infoo(
        name: myControllerName.text,
        value: double.parse(myControllerValue.text),
        date: setDate!,
        ico: Icon(Icons.check),
      );

      yy.add(ff);
      myControllerName.clear();
      myControllerValue.clear();
      setDate = 'تاريخ الدفعة';
      Navigator.of(context).pop();
      print('aaa');
    });
  }
}
