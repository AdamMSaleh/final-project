import 'package:flutter/material.dart';

import 'invoiceItems.dart';

class InvoiceWrite extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InvoiceWriteState();
  }
}

//--------------------------------------------
class _InvoiceWriteState extends State<InvoiceWrite> {
  Color w = Colors.white;
  Color b = Colors.black;
  Color o = Colors.orange;
  Color t = Colors.teal;
  Color l = Colors.lime;
  Color g = Colors.green;
  Color r = Colors.red;
  Color p = Colors.pink;
  Color bl = Colors.blue;
  var myControllerNameItem = TextEditingController();
  var myControllerPrice = TextEditingController();
  List<InvoiceItem> yy = [
    InvoiceItem(item: "فرشاة", pries: 30.5),
    InvoiceItem(item: "دهان", pries: 50)
  ];

  void btninvoice(BuildContext assoom) {
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
                      labelText: ' : ادخل اسم السلعة ',
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      hintText: 'Enter Name',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    controller: myControllerNameItem,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.name,
                  ),
                ),

                //
                //
                Container(
                  margin: EdgeInsets.all(12.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: ' : سعر السلعة ',
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: w,
                      ),
                      hintText: 'Enter price',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: b,
                      ),
                    ),
                    controller: myControllerPrice,
                    style: TextStyle(
                      fontSize: 18,
                      color: w,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(
                            () {
                              ElevatedButtonAddValue(context);
                            },
                          );
                        },
                        child: Text(
                          '+',
                          style: TextStyle(
                            fontSize: 20,
                            color: w,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(b),
                        ),
                      ),
                      //
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.fromLTRB(5, 20, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //----------------------------
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            viewInvoice(yy);
                          });
                        },
                        child: Text(
                          ' عرض الفاتورة ',
                          style: TextStyle(
                            fontSize: 20,
                            color: w,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(b),
                        ),
                      ),
                    ],
                  ),
                ),
                //
                //
              ],
            ),
          ),
        );
//----------end buttom sheet-----------------------------------------------------
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Me3margi Invoice"),
      ),
      //--------------------------------
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(5),
                  child: Text(
                    ' اسم السلعة ',
                    style: TextStyle(
                      fontSize: 18,
                      color: b,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Text(
                    ' قيمة السلعة ',
                    style: TextStyle(
                      fontSize: 18,
                      color: b,
                    ),
                  ),
                ),
              ),
            ], //children
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
                                              e.item,
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
                                              "${e.pries}",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: w,
                                              ),
                                            ),
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
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (yy.isEmpty) {
                  ElevatedButtonShowMessageSendInvoieceEmpty(context);
                } else {
                  ElevatedButtonShowMessageSendInvoiece(context);
                  yy.clear();
                }
              });
            },
            child: Text(
              ' ارسال الفاتورة ',
              style: TextStyle(
                fontSize: 20,
                color: w,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(b),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          btninvoice(context);
        }),
        child: Icon(
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
        title: const Text(' : إضافة فاتورة '),
        content: const Text('  للإضافة او الغاء ok اضغط  '),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              ElevatedButtonAddValue1(
                context,
                myControllerNameItem,
                myControllerPrice,
              );
              Navigator.pop(context, 'OK');
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  //-----------------------------------
  //
  //
  //
  ElevatedButtonShowMessageSendInvoiece(BuildContext context) {
    //هي ميثود للبوكس اللي بطالعلي مسج انه تم ارسال الفاتورة

    showDialog<String>(
      context: context,
      builder: (
        BuildContext context,
      ) =>
          AlertDialog(
        title: const Text(' تم ارسال الفاتورة '),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'OK');
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

//
//
//
//
  ElevatedButtonShowMessageSendInvoieceEmpty(BuildContext context) {
    //هي ميثود للبوكس اللي بطالعلي مسج انه قم بتعبئة الفاتورة اولا من فضلك

    showDialog<String>(
      context: context,
      builder: (
        BuildContext context,
      ) =>
          AlertDialog(
        title: const Text(' قم بتعبئة فاتورة من فضلك'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'OK');
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

//
//
//
  //
  //
  //

  ElevatedButtonAddValue1(
    //هي الميثود اللي بتعمل اوبجكت وبتعطيه قيم من المنيو يلي بنعبيها اللي هي كبسة الاضافة
    //يعني لما عبي الاسم بتحطه عند الاسم بجدول الفاتورة  ولما اعبي التاريخ والقيمة نفس الشي
    BuildContext context,
    TextEditingController myControllerItemName,
    TextEditingController myControllerPrice,
  ) {
    setState(() {
      if (yy.length > 0) {
        if (yy[yy.length - 1].item == 'المجموع') {
          yy.removeLast();
        }
      }
      var ff = InvoiceItem(
        item: myControllerItemName.text,
        pries: double.parse(myControllerPrice.text),
      );

      yy.add(ff);
      myControllerItemName.clear();
      myControllerPrice.clear();
      Navigator.of(context).pop();
    });
  }

  void viewInvoice(List yy) {
    if (yy.isNotEmpty) {
      double count = 0;
      var m = yy.map((e) {
        count += e.pries;
        print(count);
        return e;
      });
      print(m);
      var x = InvoiceItem(
        item: 'المجموع',
        pries: count,
      );
      // print(yy);
      yy.add(x);
      Navigator.of(context).pop();
    }
  }
}
/*


        ],
      ),
      //الزر العائم لاضافة دفعة

      
    );
    //-------------------------------------------------------
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
              ElevatedButtonAddValue1(
                  context, myControllerName, myControllerValue, setDate!);
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
    TextEditingController myControllerName,
    TextEditingController myControllerValue,
    String setDate,
  ) {
    setState(() {
      var ff = Infoo(
        name: myControllerName.text,
        value: double.parse(myControllerValue.text),
        date: setDate,
        ico: Icon(Icons.check),
      );

      yy.add(ff);
      myControllerName.clear();
      myControllerValue.clear();

      Navigator.of(context).pop();
    });
  }
}*/
