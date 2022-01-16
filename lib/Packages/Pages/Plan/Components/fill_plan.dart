// ignore_for_file: camel_case_types, non_constant_identifier_names, unused_element, unnecessary_null_comparison, avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_finalproject/DataBase/register.dart';
import 'package:flutter_finalproject/Packages/Components/Add_Image/alert_choose.dart';
import 'package:flutter_finalproject/Packages/Pages/Invoice/Components/design.dart';
import 'package:flutter_finalproject/Packages/Pages/Plan/Components/planInformion.dart';
import 'package:image_picker/image_picker.dart';

class Fill_plane_page extends StatefulWidget {
  static const String id = 'fill_Plan';

  const Fill_plane_page({Key? key}) : super(key: key);
  @override
  _Fill_plane_pageState createState() => _Fill_plane_pageState();
}

class _Fill_plane_pageState extends State<Fill_plane_page> {
  Color w = Colors.white;
  Color b = Colors.black;
  Color o = Colors.orange;
  Color t = Colors.teal;
  Color l = Colors.lime;
  Color g = Colors.green;
  Color r = Colors.red;
  Color p = Colors.pink;
  Color bl = Colors.blue;
  var myControllerName_Plan = TextEditingController();
  var myControllerOffice_name = TextEditingController();
  var myControllerDesigner_name = TextEditingController();
  var myControllerCode_number = TextEditingController();
//var myControllertype = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  File? imageFile;
  File? imageFile1;
  String? selected_plan_type;
  List plan_type = [
    'الموقع العام',
    'فحص التربة',
    'كشف الاموال',
    'أمر الاشغال',
    'مخطط التنظيمي'
  ];
  List<PlanInformion> planData = [
    PlanInformion(
        name_plan: 'univercity',
        Name_Office: 'Amman',
        Name_designer: 'Ali',
        code_number: 202100,
        image: null),
    PlanInformion(
        name_plan: 'home jarash',
        Name_Office: 'zarqa',
        Name_designer: 'mohammad',
        code_number: 202100,
        image: null),
    PlanInformion(
        name_plan: 'school',
        Name_Office: 'ajlon',
        Name_designer: 'Essa',
        code_number: 202100,
        image: null),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اضافة مخطط'),
      ),
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        color: project_color('efcba7'), //Theme.of(assoom).accentColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
//-------------start buttom sheet------------------------------------------
              Container(
                margin: const EdgeInsets.all(12.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: ' : اسم المخطط  ',
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: b,
                    ),
                    hintText: 'Enter plan Name',
                    hintStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
                  controller: myControllerName_Plan,
                  style: TextStyle(
                    fontSize: 18,
                    color: b,
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),

              //-----------------------------------------
              Container(
                color: project_color('efcba7'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton(
                      hint: Text(
                        ': اختار نوع المخطط ',
                        style: TextStyle(
                          color: b,
                          fontSize: 15,
                        ),
                      ),
                      value: selected_plan_type,
                      items: plan_type.map((item) {
                        return DropdownMenuItem(
                          child: Text(
                            item,
                            style: TextStyle(color: b, fontSize: 15),
                          ),
                          value: item,
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          selected_plan_type = val.toString();
                        });
                      },
                    )
                  ],
                ),
              ),
              //----------------------------------------
              Container(
                margin: const EdgeInsets.all(12.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'اسم المكتب الهندسي',
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: b,
                    ),
                    hintText: 'Enter Office Name',
                    hintStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
                  controller: myControllerOffice_name,
                  style: TextStyle(
                    fontSize: 18,
                    color: b,
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
//---------------------------------
              Container(
                margin: const EdgeInsets.all(12.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'اسم المصمم',
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: b,
                    ),
                    hintText: 'Enter Designer Name',
                    hintStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
                  controller: myControllerDesigner_name,
                  style: TextStyle(
                    fontSize: 18,
                    color: b,
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
//---------------------------------------------------
              Container(
                margin: const EdgeInsets.all(12.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'ترميز المخطط',
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: b,
                    ),
                    hintText: 'Enter Code Number',
                    hintStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
                  controller: myControllerCode_number,
                  style: TextStyle(
                    fontSize: 18,
                    color: b,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
// -----------------------------------------------------
              Container(
                  margin: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.add_photo_alternate,
                          size: 50,
                          color: b,
                        ),
                        onPressed: () => showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => AlertChooseImage(
                            bathImage: 'Plan Image',
                          ),
                        ),

                        //_showOption(context),
                      ),
                    ],
                  )),
              //
              //
              //
              //
              Container(
                margin: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(
                          () {
                            if (myControllerName_Plan.text != '' &&
                                myControllerCode_number.text != '' &&
                                myControllerDesigner_name.text != '' &&
                                myControllerOffice_name.text != '') {
                              planData.add(
                                PlanInformion(
                                    name_plan: myControllerName_Plan.text,
                                    // type: myControllertype.text,
                                    code_number: int.parse(
                                        (myControllerCode_number).text),
                                    Name_designer:
                                        myControllerDesigner_name.text,
                                    Name_Office: myControllerOffice_name.text,
                                    image: imageFile),
                              );
                              myControllerName_Plan.clear();
                              //myControllertype.clear();
                              myControllerOffice_name.clear();
                              myControllerDesigner_name.clear();
                              myControllerCode_number.clear();
                              imageFile = imageFile1;
                              Navigator.pop(context);

                              //ElevatedButtonAddValue(context);
                            } else {
                              Register()
                                  .tostforRegsetr('لطفاً إملأ جميع الحقول');
                            }
                          },
                        );
                      },
                      child: const Text(
                        '+',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(project_color('efcba7')),
                      ),
                    ),
                    //
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _imageFromCamera(BuildContext context) async {
    try {
      // Capture a photo
      final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
      final photoTemorary = File(photo!.path);
      if (photo == null) {
        return;
      }
      setState(() {
        imageFile = photoTemorary;
      });
      Navigator.pop(context);
    } on PlatformException catch (e) {
      print("Failed to pick image : $e");
    }
  }
}
