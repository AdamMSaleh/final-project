// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, non_constant_identifier_names, avoid_print, prefer_const_constructors, implementation_imports

import 'dart:io';

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Additions/go_back.dart';
import 'package:flutter_finalproject/Packages/Pages/Profile/Components/profile_information.dart';
import 'package:flutter_finalproject/Packages/Pages/Profile/View/profile_edit.dart';
import 'package:flutter_finalproject/Packages/Pages/Profile/workerRequirements/laborManagementForProfessionals/labor_management_for_professionals.dart';

class ProfileForWorkers extends StatefulWidget {
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

  ProfileForWorkers(
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
  _ProfileForWorkersState createState() => _ProfileForWorkersState();
}

class _ProfileForWorkersState extends State<ProfileForWorkers> {
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
            image: ProfileForWorkers.image1,
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GoBack.tx(KeyLang.profile.tr()),
        leading: GoBack.back(context),
        actions: [
          Theme(
            data: Theme.of(context).copyWith(
                textTheme: TextTheme().apply(bodyColor: Colors.black),
                dividerColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.black87)),
            child: PopupMenuButton<int>(
              color: Colors.black,
              itemBuilder: (context) => [
                const PopupMenuItem<int>(value: 0, child: Text("تعديل")),
                const PopupMenuItem<int>(value: 1, child: Text("Setting")),
                const PopupMenuItem<int>(
                    value: 2, child: Text("Privacy Policy page")),
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
                        Text("Logout")
                      ],
                    )),
              ],
              onSelected: (item) => SelectedItem(context, item),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: (MediaQuery.of(context).size.height),
          decoration: BoxDecoration(
            // color: Colors.amber[200],
            gradient: LinearGradient(
              colors: [Colors.amber, Colors.greenAccent.withOpacity(0.2)],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(222.0),
                // padding: const EdgeInsets.all(20),
                child: Image.network(
                  ProfileForWorkers.image1,
                  height: 220,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(11),
                child: ElevatedButton(
                  onPressed: () => GoBack.selectScreen(
                      context, const LaborManagementForProfessionals()),
                  child: GoBack.tx('أدارة العمل'),
                ),
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
                color: Colors.white30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      color: Colors.white70,
                      child: Container(
                        width: (MediaQuery.of(context).size.width) - 50,
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GoBack.tx(KeyLang.name + ':'),
                            GoBack.tx(ProfileForWorkers.firstName1),
                            GoBack.tx(ProfileForWorkers.lastName1),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Card(
                  color: Colors.white30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Card(
                        color: Colors.white70,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              GoBack.tx(KeyLang.professionName.tr() + ':'),
                              GoBack.tx(ProfileForWorkers.occupation1),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white70,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              GoBack.tx(KeyLang.age.tr() + ':'),
                              GoBack.tx(ProfileForWorkers.age1),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white70,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              GoBack.tx(KeyLang.address.tr() + ':'),
                              GoBack.tx(ProfileForWorkers.region1),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      color: Colors.white70,
                      child: Container(
                        width: (MediaQuery.of(context).size.width) - 50,
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GoBack.tx(KeyLang.phoneNumber.tr() + ':'),
                            GoBack.tx(ProfileForWorkers.phoneNumber1),
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
}
