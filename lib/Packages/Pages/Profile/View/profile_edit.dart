// ignore_for_file: prefer_final_fields, sized_box_for_whitespace, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Packages/Components/Additions/go_back.dart';
import 'package:flutter_finalproject/Packages/Pages/Profile/View/test_crop_images.dart';

import 'profile_for_workers.dart';

class ProfileEdit extends StatefulWidget {
  static String? image1;
  static String? firstName1;

  static String? lastName1;

  static String? occupation1;

  static String? age1;

  static String? region1;
  static String? phoneNumber1;

  ProfileEdit({
    Key? key,
    image,
    firstName,
    lastName,
    occupation,
    age,
    region,
    phoneNumber, File? imageFile,
  }) : super(key: key) {
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
    } else {
      firstName1 = 'غير معروف';
      lastName1 = 'غير معروف';
      occupation1 = 'غير معروف';
      age1 = 'غير معروف';
      region1 = 'غير معروف';
      phoneNumber1 = '0780808080';
      image1 = image;
    }
  }

  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  var _controllerFirstName1 = TextEditingController();
  final _newFirstName1 = ProfileEdit.firstName1;

/*-------------------------------------------------------*/
  var _controllerLastName1 = TextEditingController();
  final _newLastName1 = ProfileEdit.lastName1;

/*-------------------------------------------------------*/
  var _controllerOccupation1 = TextEditingController();
  final _newOccupation1 = ProfileEdit.occupation1;

/*-------------------------------------------------------*/
  var _controllerAge1 = TextEditingController();
  final _newAge1 = ProfileEdit.age1;

/*-------------------------------------------------------*/
  var _controllerRegion1 = TextEditingController();
  final _newRegion1 = ProfileEdit.region1;

/*-------------------------------------------------------*/
  var _controllerPhoneNumber1 = TextEditingController();
  final _newPhoneNumber1 = ProfileEdit.phoneNumber1;

/*-------------------------------------------------------*/
  void getValue() {
    _controllerFirstName1.value = TextEditingValue(
      text: _newFirstName1!,
      selection: TextSelection.fromPosition(
        TextPosition(offset: _newFirstName1!.length),
      ),
    );
    _controllerLastName1.value = TextEditingValue(
      text: _newLastName1!,
      selection: TextSelection.fromPosition(
        TextPosition(offset: _newLastName1!.length),
      ),
    );
    _controllerOccupation1.value = TextEditingValue(
      text: _newOccupation1!,
      selection: TextSelection.fromPosition(
        TextPosition(offset: _newOccupation1!.length),
      ),
    );
    _controllerAge1.value = TextEditingValue(
      text: _newAge1!,
      selection: TextSelection.fromPosition(
        TextPosition(offset: _newAge1!.length),
      ),
    );
    _controllerRegion1.value = TextEditingValue(
      text: _newRegion1!,
      selection: TextSelection.fromPosition(
        TextPosition(offset: _newRegion1!.length),
      ),
    );
    _controllerPhoneNumber1.value = TextEditingValue(
      text: _newPhoneNumber1!,
      selection: TextSelection.fromPosition(
        TextPosition(offset: _newPhoneNumber1!.length),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    getValue();
    return Scaffold(
      appBar: AppBar(
        leading: GoBack.back(context),
        title: GoBack.tx('تعديل الملف الشخصي'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(222.0),
                  child: Image.network(ProfileEdit.image1!,
                    height: 220
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(150.0),
                  child: Container(
                    // alignment: Alignment.center,
                    height: 55,
                    width: 55,
                    child: ElevatedButton(
                      onPressed: () => GoBack.selectScreen(
                          context,
                          const ImageCropperPage(
                            title: 'تعديل صورة الملف الشخصي',
                          )),
                      child: Container(
                        alignment: Alignment.center,
                        // padding: EdgeInsets.all(5),
                        child: Icon(Icons.add_sharp),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TextField(
              controller: _controllerFirstName1,
              decoration: InputDecoration(
                labelText: 'الاسم الاول',
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            TextField(
              controller: _controllerLastName1,
              decoration: InputDecoration(
                labelText: 'الاسم الاخير',
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            TextField(
              controller: _controllerAge1,
              decoration: InputDecoration(
                labelText: 'العمر',
              ),
              keyboardType: TextInputType.datetime,
            ),
            const SizedBox(
              height: 35,
            ),
            TextField(
              controller: _controllerOccupation1,
              decoration: InputDecoration(
                labelText: 'المهنه',
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            TextField(
              controller: _controllerRegion1,
              decoration: InputDecoration(
                labelText: 'المنطقة',
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            TextField(
              controller: _controllerPhoneNumber1,
              decoration: InputDecoration(
                labelText: 'رقم الهاتف',
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            IconButton(
                onPressed: () => GoBack.selectScreen(
                      context,
                      ProfileForWorkers(
                        firstName: _controllerFirstName1.text,
                        lastName: _controllerLastName1.text,
                        occupation: _controllerOccupation1.text,
                        age: _controllerAge1.text,
                        region: _controllerRegion1.text,
                        phoneNumber: _controllerPhoneNumber1.text,
                       
                      ),
                    ),
                icon: Icon(Icons.save)),
          ],
        ),
      ),
    );
  }
}
