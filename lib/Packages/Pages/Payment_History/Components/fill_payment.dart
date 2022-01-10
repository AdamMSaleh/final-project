import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Packages/Pages/Invoice/Components/design.dart';
import 'package:flutter_finalproject/Packages/Pages/Payment_History/Components/infoo.dart';

class Fill_payment_page extends StatefulWidget {
  static const String id = 'Fill_payment_page';
  @override
  _Fill_payment_pageState createState() => _Fill_payment_pageState();
}

class _Fill_payment_pageState extends State<Fill_payment_page> {
  @override
//--------------------------
  var myControllerName_person = TextEditingController();
  var myControllerValue_payment = TextEditingController();

  String? setDate;
  List<Infoo> yy = [
    Infoo(
      name: "Asmaa1",
      value: 150.9,
      date: "11-9-2021",
      ico: Icon(Icons.cancel_outlined),
    ),
    Infoo(
      name: "Asmaa1",
      value: 150.9,
      date: "3-12-2021",
      ico: Icon(Icons.verified_outlined),
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

//--------------------------
  final items = ['الكل', 'حداد', 'نجار', 'بليط', 'المنيوم', 'كهربجي', 'دهان'];
  String? value;
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
        ),
      );
//--------------------------

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        // decoration: BoxDecoration(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //-------------start fill sheet------------------------------------------
              Container(
                margin: const EdgeInsets.all(10),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'اسم المستفيد',
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    hintText: 'ادخل اسم المستفيد',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.black38,
                    ),
                    prefixIcon: Icon(
                      Icons.person_outline_outlined,
                      color: Colors.black,
                    ),
                  ),
                  controller: myControllerName_person,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              //--------------------------------
              //هون بدنا نحط نقدا او شيك ورقم الشيك واسم البنك
              //--------------------------------
              Container(
                margin: const EdgeInsets.all(10),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'قيمة الدفعة ',
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    hintText: 'ادخل قيمة الدفعة',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.black38,
                    ),
                    prefixIcon: Icon(
                      Icons.payment,
                      color: Colors.black,
                    ),
                  ),
                  controller: myControllerValue_payment,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              //---------------------------------------------------
              Container(
                margin: const EdgeInsets.all(10),
                width: (MediaQuery.of(context).size.width),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(project_color('efcba7')),
                  ),
                  onPressed: () {
                    setState(() {
                      _datePicker();
                      // getText();
                    });
                  },
                  child: Text(
                    setDate ?? 'تاريخ الدفعة',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
              //--------------------------------------------
              //وذلك عن :
              Container(
                //drop down menu :
                /*هون الليست تاع المهن */

                child: SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.0),
                        // decoration: BoxDecoration(
                        //   border: Border.all(),
                        // ),
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(10),
                        /*-------------------------------------------------------*/
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: project_color('741b47'),
                                width: 0.7,
                              ),
                              borderRadius: BorderRadius.circular(7)),
                          child: DropdownButton<String>(
                            dropdownColor: project_color('efcba7'),

                            // isExpanded: true,
                            iconSize: 16,
                            alignment: Alignment.center,

                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                            ),

                            hint: Text("    :  وذلك عن   "),
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
              //--------------------------------------------
              //اسم المستلم :
              Container(
                margin: const EdgeInsets.all(10),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'اسم المستلم (اختياري)',
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    hintText: 'ادخل اسم المستلم',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.black38,
                    ),
                    prefixIcon: Icon(
                      Icons.person_outline_outlined,
                      color: Colors.black,
                    ),
                  ),
                  controller: myControllerName_person,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              //---------------------------------------------
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      ElevatedButtonAddValue(context);
                    });
                  },
                  child: const Text(
                    'تأكيد',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(project_color('efcba7')),
                  ),
                ),
              ),
              //-----------------------------------------------
            ],
          ),
        ),
      ),
    );
  }

//------------------------------------
//هاي كبسة تاكيد
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

  // ------------------------------
  ElevatedButtonAddValue1(
    // هي الميثود اللي بتعمل اوبجكت وبتعطيه قيم من المنيو يلي بنعبيها اللي هي كبسة الاضافة
    // يعني لما عبي الاسم بتحطه عند الاسم بجدول الفاتورة  ولما اعبي التاريخ والقيمة نفس الشي
    BuildContext context,
  ) {
    setState(() {
      var ff = Infoo(
        name: myControllerName_person.text,
        value: double.parse(myControllerValue_payment.text),
        date: setDate!,
        ico: Icon(Icons.check),
      );

      yy.add(ff);
      myControllerName_person.clear();
      myControllerValue_payment.clear();
      setDate = 'تاريخ الدفعة';
      Navigator.of(context).pop();
    });
  }
}
