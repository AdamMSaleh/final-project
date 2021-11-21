// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, implementation_imports, unused_import, must_be_immutable, sized_box_for_whitespace, duplicate_ignore, deprecated_member_use, avoid_unnecessary_containers, slash_for_doc_comments, unnecessary_null_comparison, avoid_print

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
var myControllerName = TextEditingController();
var myControllertype = TextEditingController();
final ImagePicker _picker = ImagePicker();

File? imageFile;
File? imageFile1;

class _PlanUploadState extends State<PlanUpload> {
  List<PlanInformion> planData = [
    PlanInformion(
        name: ' 11مخطط جامعة الزرقا', type: '11مخطط مساحة', image: null),
    PlanInformion(
        name: ' 222مخطط جامعة الزرقا', type: '22مخطط مساحة', image: null),
    PlanInformion(
        name: ' 33مخطط جامعة الزرقا', type: '33مخطط مساحة', image: null),
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
//-------------start buttom sheet------------------------------------------
                Container(
                  margin: const EdgeInsets.all(12.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'الاسم',
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: w,
                      ),
                      hintText: 'Enter Name',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: b,
                      ),
                      prefixIcon: Icon(
                        Icons.person_outline_outlined,
                        color: o,
                      ),
                    ),
                    controller: myControllerName,
                    style: TextStyle(
                      fontSize: 18,
                      color: w,
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
                // Container(
                //   margin: const EdgeInsets.all(12.0),
                //   child: TextField(
                //     decoration: InputDecoration(
                //       labelText: 'القيمه',
                //       labelStyle: TextStyle(
                //         fontSize: 20,
                //         color: w,
                //       ),
                //       hintText: 'Enter Value',
                //       hintStyle: TextStyle(
                //         fontSize: 15,
                //         color: b,
                //       ),
                //       prefixIcon: Icon(
                //         Icons.payment,
                //         color: o,
                //       ),
                //     ),
                //     controller: myControllerName,
                //     style: TextStyle(
                //       fontSize: 18,
                //       color: w,
                //     ),
                //     keyboardType: TextInputType.number,
                //   ),
                // ),
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

  void btnplane(BuildContext assoom) {
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
                    decoration: InputDecoration(
                      labelText: ' : ادخل اسم المخطط  ',
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: w,
                      ),
                      hintText: 'Enter plan Name',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: b,
                      ),
                    ),
                    controller: myControllerName,
                    style: TextStyle(
                      fontSize: 18,
                      color: w,
                    ),
                    keyboardType: TextInputType.name,
                  ),
                ),

                //
                //----------------------------------------
                Container(
                  margin: EdgeInsets.all(12.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: ' : نوع المخطط ',
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: w,
                      ),
                      hintText: 'Enter plan type',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: b,
                      ),
                    ),
                    controller: myControllertype,
                    style: TextStyle(
                      fontSize: 18,
                      color: w,
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
//----------------------------------
                Container(
                    margin: EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.add_photo_alternate),
                          onPressed: () => _showOption(context),
                        ),
                      ],
                    )),
                //
                //
                //
                //
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(
                            () {
                              planData.add(
                                PlanInformion(
                                    name: myControllerName.text,
                                    type: myControllertype.text,
                                    image: imageFile),
                              );
                              myControllerName.clear();
                              myControllertype.clear();
                              Navigator.pop(assoom);

                              //ElevatedButtonAddValue(context);
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

                // Container(
                //   margin: EdgeInsets.fromLTRB(5, 20, 5, 0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       ElevatedButton(
                //         onPressed: () {
                //           setState(() {
                //             //ElevatedButtonAddValue(context);
                //           });
                //         },
                //         child: Text(
                //           ' ارسال الفاتورة ',
                //           style: TextStyle(
                //             fontSize: 20,
                //             color: w,
                //           ),
                //         ),
                //         style: ButtonStyle(
                //           backgroundColor: MaterialStateProperty.all(b),
                //         ),
                //       ),
                //       //----------------------------
                //       ElevatedButton(
                //         onPressed: () {
                //           setState(() {
                //             //ElevatedButtonAddValue(context);
                //           });
                //         },
                //         child: Text(
                //           ' عرض الفاتورة ',
                //           style: TextStyle(
                //             fontSize: 20,
                //             color: w,
                //           ),
                //         ),
                //         style: ButtonStyle(
                //           backgroundColor: MaterialStateProperty.all(b),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
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
      //*Appbar
      appBar: AppBHome(),
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
            height: (MediaQuery.of(context).size.height) / 2,
            child: ListView(
              children: [
                ...planData.map(
                  (e) => Container(
                    margin: EdgeInsets.all(10),
                    child: Card(
                      child: Column(
                        children: [
                          Row(
                            children: [Text('name : '), Text(e.name)],
                          ),
                          Row(
                            children: [Text('type : '), Text(e.type)],
                          ),
                          Row(
                            children: [
                              Container(
                                child: e.image == null
                                    ? Image.network(
                                        'https://www.aljadeed.com/wp-content/uploads/2021/03/Image-Compressor-Online-موقع-لخفض-حجم-الصور-اون-لاين-بدون-تقليل-الجودة.jpg',
                                        height: 150,
                                      )
                                    : Image.file(
                                        e.image!,
                                        height: 150,
                                      ),
                              )
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
        onPressed: () => setState(() {
          btnplane(context);
        }),
        child: Icon(
          Icons.add,
          color: b,
          size: 40,
        ),
      ),
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
