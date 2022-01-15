// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, implementation_imports, unused_import, must_be_immutable, sized_box_for_whitespace, duplicate_ignore, deprecated_member_use, avoid_unnecessary_containers, slash_for_doc_comments, unnecessary_null_comparison, avoid_print, non_constant_identifier_names

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_finalproject/DataBase/register.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Additions/go_back.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/Drawer/drawer.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/app_loading.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/enum_loading.dart';
import 'package:flutter_finalproject/Packages/Components/cach_image/image_user.dart';
import 'package:flutter_finalproject/Packages/Pages/Archive/View/body.dart';
import 'package:flutter_finalproject/Packages/Pages/CurrentProjects/View/body.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/appbar/appbar.dart';
import 'package:flutter_finalproject/Packages/Pages/Invoice/Components/design.dart';
import 'package:flutter_finalproject/Packages/Pages/NewProject/View/new_project.dart';
import 'package:flutter_finalproject/Packages/Pages/NewProject/components/BoxDialog/dialog.dart';
import 'package:flutter_finalproject/Packages/Pages/Plan/Components/fill_plan.dart';
import 'package:flutter_finalproject/Packages/Pages/Profile/View/profile.dart';
import 'package:flutter_finalproject/Packages/Pages/Profile/View/upload_image.dart';
import 'package:flutter_finalproject/Packages/Pages/Research/view/body.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/style.dart';
import 'package:flutter_finalproject/Utils/path_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../Components/planInformion.dart';

class PlanUpload extends StatefulWidget {
  static const String id = 'Plan';

  @override
  State<PlanUpload> createState() => _PlanUploadState();
}

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

class _PlanUploadState extends State<PlanUpload> {
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
          child: SingleChildScrollView(),
        );
//----------end buttom sheet-----------------------------------------------------
      },
    );
  }

//-----------------------------------------
  String? selected_plan_type;
  List plan_type = ['a', 'b', 'c', 'd', 'e'];
//-------------------------------------------
//   void btnplane(BuildContext assoom) {
//     showModalBottomSheet(
//       // useRootNavigator: true,
//       isScrollControlled: true,
//       context: assoom,
//       builder: (_) {
//         return Container(
//           height: double.infinity,
//           padding: const EdgeInsets.all(20),
//           color: project_color('741b47'), //Theme.of(assoom).accentColor,
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
// //-------------start buttom sheet------------------------------------------
//                 Container(
//                   margin: const EdgeInsets.all(12.0),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       labelText: ' : اسم المخطط  ',
//                       labelStyle: TextStyle(
//                         fontSize: 20,
//                         color: w,
//                       ),
//                       hintText: 'Enter plan Name',
//                       hintStyle: TextStyle(
//                         fontSize: 15,
//                         color: Colors.white30,
//                       ),
//                     ),
//                     controller: myControllerName_Plan,
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: w,
//                     ),
//                     keyboardType: TextInputType.name,
//                   ),
//                 ),

//                 //-----------------------------------------
//                 Container(
//                   color: project_color('efcba7'),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       DropdownButton(
//                         hint: Text(
//                           ': اختار نوع المخطط ',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 15,
//                           ),
//                         ),
//                         value: selected_plan_type,
//                         items: plan_type.map((item) {
//                           return DropdownMenuItem(
//                             child: Text(
//                               item,
//                               style:
//                                   TextStyle(color: Colors.black, fontSize: 15),
//                             ),
//                             value: item,
//                           );
//                         }).toList(),
//                         onChanged: (val) {
//                           setState(() {
//                             selected_plan_type = val.toString();
//                           });
//                         },
//                       )
//                     ],
//                   ),
//                 ),
//                 //----------------------------------------
//                 Container(
//                   margin: EdgeInsets.all(12.0),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       labelText: 'اسم المكتب الهندسي',
//                       labelStyle: TextStyle(
//                         fontSize: 20,
//                         color: w,
//                       ),
//                       hintText: 'Enter Office Name',
//                       hintStyle: TextStyle(
//                         fontSize: 15,
//                         color: Colors.white30,
//                       ),
//                     ),
//                     controller: myControllerOffice_name,
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: w,
//                     ),
//                     keyboardType: TextInputType.text,
//                   ),
//                 ),
// //---------------------------------
//                 Container(
//                   margin: const EdgeInsets.all(12.0),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       labelText: 'اسم المصمم',
//                       labelStyle: TextStyle(
//                         fontSize: 20,
//                         color: w,
//                       ),
//                       hintText: 'Enter Designer Name',
//                       hintStyle: TextStyle(
//                         fontSize: 15,
//                         color: Colors.white30,
//                       ),
//                     ),
//                     controller: myControllerDesigner_name,
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: w,
//                     ),
//                     keyboardType: TextInputType.name,
//                   ),
//                 ),
// //---------------------------------------------------
//                 Container(
//                   margin: const EdgeInsets.all(12.0),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       labelText: 'ترميز المخطط',
//                       labelStyle: TextStyle(
//                         fontSize: 20,
//                         color: w,
//                       ),
//                       hintText: 'Enter Code Number',
//                       hintStyle: TextStyle(
//                         fontSize: 15,
//                         color: Colors.white30,
//                       ),
//                     ),
//                     controller: myControllerCode_number,
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: w,
//                     ),
//                     keyboardType: TextInputType.number,
//                   ),
//                 ),
// // -----------------------------------------------------
//                 Container(
//                     margin: EdgeInsets.all(12.0),
//                     child: Row(
//                       children: [
//                         IconButton(
//                           icon: Icon(
//                             Icons.add_photo_alternate,
//                             size: 50,
//                             color: Colors.white,
//                           ),
//                           onPressed: () => _showOption(context),
//                         ),
//                       ],
//                     )),
//                 //
//                 //
//                 //
//                 //
//                 Container(
//                   margin: EdgeInsets.all(10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                           setState(
//                             () {
//                               if (myControllerName_Plan.text != '' &&
//                                   myControllerCode_number.text != '' &&
//                                   myControllerDesigner_name.text != '' &&
//                                   myControllerOffice_name.text != '') {
//                                 planData.add(
//                                   PlanInformion(
//                                       name_plan: myControllerName_Plan.text,
//                                       // type: myControllertype.text,
//                                       code_number: int.parse(
//                                           (myControllerCode_number).text),
//                                       Name_designer:
//                                           myControllerDesigner_name.text,
//                                       Name_Office: myControllerOffice_name.text,
//                                       image: imageFile),
//                                 );
//                                 myControllerName_Plan.clear();
//                                 //myControllertype.clear();
//                                 myControllerOffice_name.clear();
//                                 myControllerDesigner_name.clear();
//                                 myControllerCode_number.clear();
//                                 imageFile = imageFile1;
//                                 Navigator.pop(assoom);

//                                 //ElevatedButtonAddValue(context);
//                               } else {
//                                 Register()
//                                     .tostforRegsetr('لطفاً إملأ جميع الحقول');
//                               }
//                             },
//                           );
//                         },
//                         child: Text(
//                           '+',
//                           style: TextStyle(
//                             fontSize: 25,
//                             color: Colors.black,
//                           ),
//                         ),
//                         style: ButtonStyle(
//                           backgroundColor: MaterialStateProperty.all(
//                               project_color('efcba7')),
//                         ),
//                       ),
//                       //
//                     ],
//                   ),
//                 ),

//                 // Container(
//                 //   margin: EdgeInsets.fromLTRB(5, 20, 5, 0),
//                 //   child: Row(
//                 //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 //     children: [
//                 //       ElevatedButton(
//                 //         onPressed: () {
//                 //           setState(() {
//                 //             //ElevatedButtonAddValue(context);
//                 //           });
//                 //         },
//                 //         child: Text(
//                 //           ' ارسال الفاتورة ',
//                 //           style: TextStyle(
//                 //             fontSize: 20,
//                 //             color: w,
//                 //           ),
//                 //         ),
//                 //         style: ButtonStyle(
//                 //           backgroundColor: MaterialStateProperty.all(b),
//                 //         ),
//                 //       ),
//                 //       //----------------------------
//                 //       ElevatedButton(
//                 //         onPressed: () {
//                 //           setState(() {
//                 //             //ElevatedButtonAddValue(context);
//                 //           });
//                 //         },
//                 //         child: Text(
//                 //           ' عرض الفاتورة ',
//                 //           style: TextStyle(
//                 //             fontSize: 20,
//                 //             color: w,
//                 //           ),
//                 //         ),
//                 //         style: ButtonStyle(
//                 //           backgroundColor: MaterialStateProperty.all(b),
//                 //         ),
//                 //       ),
//                 //     ],
//                 //   ),
//                 // ),
//                 //
//                 //
//               ],
//             ),
//           ),
//         );
// //----------end buttom sheet-----------------------------------------------------
//       },
//     );
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //*Appbar
      appBar: AppBar(
        title: Text('المخططات'),
      ),
      //*drawer
      drawer: DrawerHome(),
      body:
          // Container(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.stretch,
          //     children: [
          //       ElevatedButton(
          //         onPressed: () => SelSc().selectScreen(context, Plan()),
          //         child: Text(
          //           "إضافة مخطط جديد",
          //           style: TextStyle(fontSize: 20),
          //         ),
          //         style: ButtonStyle(
          //           backgroundColor: MaterialStateProperty.all(t),
          //         ),
          //       ),
          //       ElevatedButton(
          //         onPressed: () => SelSc().selectScreen(context, UploadImageInvoice()),
          //         child: Text(
          //           "تحميل صور مخطط",
          //           style: TextStyle(fontSize: 20),
          //         ),
          //         style: ButtonStyle(
          //           backgroundColor: MaterialStateProperty.all(t),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          Column(
        children: [
          Container(
            height: (MediaQuery.of(context).size.height) * 0.77,
            color: project_color('efcba7'),
            child: ListView(
              // padding: EdgeInsets.all(5),
              children: [
                ...planData.map(
                  (e) => Container(
                    margin: EdgeInsets.all(10),
                    child: Card(
                      child: Column(
                        children: [
                          //space row
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Plan Name : ',
                                style: TextStyle(
                                  color: project_color('741b47'),
                                ),
                              ),
                              Text(e.name_plan),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Office Name : ',
                                style: TextStyle(
                                  color: project_color('741b47'),
                                ),
                              ),
                              Text(e.Name_Office)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Designer Name :',
                                style: TextStyle(
                                  color: project_color('741b47'),
                                ),
                              ),
                              Text(e.Name_designer)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Code Number : ',
                                style: TextStyle(
                                  color: project_color('741b47'),
                                ),
                              ),
                              Text('${e.code_number}')
                            ],
                          ),
                          //space row
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Plan Image :',
                                style: TextStyle(
                                  color: project_color('741b47'),
                                ),
                              ),
                              Container(
                                child: e.image == null
                                    ? Image.network(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgaE5uDsb9aBw7dcDlZzcZHk6GlgOYv-a2zb7lEWkQXZlEjFMsGsozB_-r2mhy61GKES0&usqp=CAU',
                                        height: 150,
                                      )
                                    : Image.file(
                                        e.image!,
                                        height: 150,
                                      ),
                              ),
                            ],
                          ),
                          //space row
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
          ),
          backgroundColor: project_color('741b47'),
          onPressed: () {
            Navigator.pushNamed(
              context,
              Fill_plane_page.id,
            );
          }),
    );
  }

  /************************************************************ */
  _showOption(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Make a choice'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.image),
                title: Text('Gallery'),
                onTap: () => _imageFromGallery(context),
              ),
              ListTile(
                leading: const Icon(Icons.camera),
                title: Text('Camera'),
                onTap: () => _imageFromCamera(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _imageFromGallery(BuildContext context) async {
    try {
      // Pick an image
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      final imageTemorary = File(image!.path);
      if (image == null) {
        return;
      }
      setState(() {
        imageFile = imageTemorary;
      });
      Navigator.pop(context);
    } on PlatformException catch (e) {
      print("Failed to pick image : $e");
    }
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
