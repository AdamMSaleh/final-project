// ignore_for_file: prefer_const_constructors, implementation_imports, duplicate_ignore, must_be_immutable, prefer_typing_uninitialized_variables, non_constant_identifier_names, avoid_print, unused_import

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_finalproject/DataBase/register.dart';
import 'package:flutter_finalproject/Packages/Components/Additions/go_back.dart';
import 'package:flutter_finalproject/Packages/Components/Toast/simple_toast.dart';
import 'package:flutter_finalproject/Packages/Pages/Invoice/Components/design.dart';
import 'package:flutter_finalproject/Packages/Pages/Profile/Components/profile_information.dart';
import 'package:flutter_finalproject/Packages/Pages/Profile/View/profile_edit.dart';
import 'package:flutter_finalproject/Packages/Pages/Profile/View/profile_for_workers.dart';
import 'package:flutter_finalproject/Packages/Pages/Profile/workerRequirements/laborManagementForProfessionals/labor_management_for_professionals.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:photo_view/photo_view.dart';
class Profile extends StatefulWidget {
  static const String id = 'Profile';

  static var imageDuf = Image.network(
      'https://i2.wp.com/alghad.com/wp-content/uploads/2021/10/Squid-Game-Games-Ranked.jpg?resize=1024%2C512&ssl=1');
  File? fileImage;
  static var imageNew1;

  static String firstName1 = ProfileInformation.first_name!; //الاسم الاول
  static String lastName1 = ProfileInformation.last_name!; //الاسم الاخير
  static String occupation1 = ProfileInformation.account_type!; //المهنه
  static String age1 = ProfileInformation.age!; //العمر
  static String region1 = ProfileInformation.city_user!; //المنطقة
  static String phoneNumber1 = ProfileInformation.phone_number!; //رقم الموبايل
  static String image1 = ProfileInformation.picture_user ??
      "https://i2.wp.com/alghad.com/wp-content/uploads/2021/10/Squid-Game-Games-Ranked.jpg?resize=1024%2C512&ssl=1"; //صورة المستخدم

  Profile(
      {Key? key,
      firstName,
      lastName,
      occupation,
      age,
      region,
      phoneNumber,
      image})
      : super(key: key) {
    if (firstName != null &&
        lastName != null &&
        occupation != null &&
        age != null &&
        region != null &&
        phoneNumber != null) {
      firstName1 = firstName;
      lastName1 = lastName;
      occupation1 = occupation;
      age1 = age;
      region1 = region;
      phoneNumber1 = phoneNumber;
      image1 = image;
    }
  }

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Color textColor = Colors.white70;

  bool processing = true;

  void SelectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        GoBack.selectScreen(
          context,
          ProfileEdit(
            firstName: ProfileForWorkers.firstName1,
            lastName: ProfileForWorkers.lastName1,
            occupation: ProfileForWorkers.occupation1,
            age: ProfileForWorkers.age1,
            region: ProfileForWorkers.region1,
            phoneNumber: ProfileForWorkers.phoneNumber1,
            image: ProfileInformation.picture_user ??
                "https://i2.wp.com/alghad.com/wp-content/uploads/2021/10/"
                    "Squid-Game-Games-Ranked.jpg?resize=1024%2C512&ssl=1", //صورة المستخدم
          ),
        );
        break;
      case 1:
        print("Setting");
        break;
      case 2:
        print("Privacy Clicked");
        break;

      case 5:
        // print("User Logged out");

        // Navigator.of(context).pushAndRemoveUntil(
        //     MaterialPageRoute(builder: (context) => LoginPage()),
        //         (route) => false);
        break;
    }
  }
@override
  void initState() {
  Timer(Duration(seconds: 5), () {
    setState(() {
      processing = false;
    });
  });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        title: Text(
          'الملف الشخصي',
          style: TextStyle(color: Colors.white),
        ), //GoBack.tx(' الملف الشخصي'),
        leading: GoBack.back(context),
        actions: [
          Theme(
            data: Theme.of(context).copyWith(
                textTheme: TextTheme().apply(bodyColor: Colors.black),
                dividerColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.white)),
            child: PopupMenuButton<int>(
              color: Colors.black,
              itemBuilder: (context) => [
                const PopupMenuItem<int>(
                    value: 0, child: Text('تعديل الملف الشخصي')),
                const PopupMenuItem<int>(value: 1, child: Text("الاعدادات")),
                const PopupMenuItem<int>(
                    value: 2, child: Text("السياسة والخصوصية")),
                const PopupMenuDivider(),
                PopupMenuItem<int>(
                    value: 5,
                    child: Row(
                      children: const [
                        Icon(
                          Icons.logout,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text('تسجيل الخروج')
                      ],
                    )),
              ],
              onSelected: (item) => SelectedItem(context, item),
            ),
          ),
        ],
      ),
      //*Appbar
      // appBar: AppBHome(),
      //*drawer
      // drawer: DrawerHome(),
      body: SingleChildScrollView(
        child: Container(
          // height: (MediaQuery.of(context).size.height),
          decoration: BoxDecoration(
            // color: Colors.amber[200],
            // gradient: LinearGradient(
            //   colors: [Colors.amber, Colors.greenAccent.withOpacity(0.2)],
            //   begin: Alignment.topRight,
            //   end: Alignment.bottomLeft,
            // ),
            color: project_color('efcba7'),
            // borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //image  -----------------------------------*--**-*-*-*-*-*-*---

              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    // padding: const EdgeInsets.all(20),
                    child: Image.network(
                      ProfileForWorkers.image1,
                      height: 220,
                    ),
                  ),
                  processing
                      ? CircularProgressIndicator(
                          backgroundColor: Colors.black38,
                          color: Colors.black45)
                      : Container(),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => GoBack.selectScreen(
                        context, const LaborManagementForProfessionals()),
                    child: GoBack.tx('أدارة العمل', textColor: textColor),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(project_color('741b47')),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Clipboard.setData(
                          ClipboardData(text: ProfileInformation.userNo!));
                      simpleToast(message: 'The number has been copied');
                    },
                    child: GoBack.tx(
                        ProfileInformation.userNo! + ':الرقم التعريفي',
                        textColor: textColor),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(project_color('741b47')),
                    ),
                  ),
                ],
              ),
              // Container(
              //   margin: const EdgeInsets.all(11),
              //   child: ElevatedButton(
              //     onPressed: () => GoBack.selectScreen(
              //         context, const pdfFile()),
              //     child: GoBack.tx('أدارة العمل'),
              //   ),
              // ),
              Card(
                // color: project_color('741b47'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      color: project_color('741b47'),
                      child: Container(
                        width: (MediaQuery.of(context).size.width) * 0.90,
                        padding: EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GoBack.tx('الاسم : ', textColor: textColor),
                            GoBack.tx(ProfileForWorkers.firstName1,
                                textColor: textColor),
                            GoBack.tx(ProfileForWorkers.lastName1,
                                textColor: textColor),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /*
              *
              * ProfileForWorkers
              *  firstName1 = firstName;
        lastName1 = lastName;
        occupation1 = occupation;
        age1 = age;
        region1 = region;*/
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Container(
              //     width: (MediaQuery.of(context).size.width) * 0.90,
              //     child: Card(
              //       //color: project_color('741b47'),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         children: [
              //           // Card(
              //           //   color: project_color('741b47'),
              //           //   child: Container(
              //           //     padding: const EdgeInsets.all(5),
              //           //     child: Row(
              //           //       children: [
              //           //         GoBack.tx(' المهنه :'),
              //           //         GoBack.tx(ProfileForWorkers.occupation1),
              //           //       ],
              //           //     ),
              //           //   ),
              //           // ),
              //           // Card(
              //           //   color: project_color('741b47'),
              //           //   child: Container(
              //           //     padding: EdgeInsets.all(5),
              //           //     child: Row(
              //           //       children: [
              //           //         GoBack.tx(' العمر :'),
              //           //         GoBack.tx(ProfileForWorkers.age1),
              //           //       ],
              //           //     ),
              //           //   ),
              //           // ),
              //           // Card(
              //           //   color: project_color('741b47'),
              //           //   child: Container(
              //           //     padding: EdgeInsets.all(5),
              //           //     child: Row(
              //           //       children: [
              //           //         GoBack.tx(' المنطقة :'),
              //           //         GoBack.tx(ProfileForWorkers.region1),
              //           //       ],
              //           //     ),
              //           //   ),
              //           // ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),

              const SizedBox(
                height: 50,
              ),

              Card(
                //color: project_color('741b47'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      color: project_color('741b47'),
                      child: Container(
                        width: (MediaQuery.of(context).size.width) * 0.90,
                        padding: EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GoBack.tx(' المهنه :', textColor: textColor),
                            GoBack.tx(ProfileForWorkers.occupation1,
                                textColor: textColor),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Card(
                //color: project_color('741b47'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      color: project_color('741b47'),
                      child: Container(
                        width: (MediaQuery.of(context).size.width) * 0.90,
                        padding: EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GoBack.tx(' العمر :', textColor: textColor),
                            GoBack.tx(ProfileForWorkers.age1,
                                textColor: textColor),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 50,
              ),

              Card(
                //color: project_color('741b47'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      color: project_color('741b47'),
                      child: Container(
                        width: (MediaQuery.of(context).size.width) * 0.90,
                        padding: EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GoBack.tx(' المنطقة :', textColor: textColor),
                            GoBack.tx(ProfileForWorkers.region1,
                                textColor: textColor),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 50,
              ),

              Card(
                //color: project_color('741b47'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      color: project_color('741b47'),
                      child: Container(
                        width: (MediaQuery.of(context).size.width) * 0.90,
                        padding: EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GoBack.tx('الرقم : ', textColor: textColor),
                            GoBack.tx(ProfileForWorkers.phoneNumber1,
                                textColor: textColor),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  witcicullogin() {
    var wigt;
    if (!processing) {
      wigt = Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            // padding: const EdgeInsets.all(20),
            child: Image.network(
              ProfileForWorkers.image1,
              height: 220,
            ),
          ),
          CircularProgressIndicator(
              backgroundColor: Colors.black38, color: Colors.black45),
        ],
      );
    } else {
      wigt = CircularProgressIndicator(
          backgroundColor: Colors.black38, color: Colors.black45);
      Timer(Duration(seconds: 3), () {
        setState(() {
          processing = false;
        });
      });
    }
    return wigt;
  }
}
