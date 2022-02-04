// ignore_for_file: must_be_immutable, no_logic_in_create_state, prefer_const_constructors, sized_box_for_whitespace, avoid_print, unnecessary_this, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Packages/Components/Additions/go_back.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/appbar/sup_appbar.dart';
import 'package:flutter_finalproject/Packages/Pages/NewProject/View/maintenance_project.dart';
import 'package:flutter_finalproject/Packages/Pages/NewProject/View/new_project.dart';
import 'package:url_launcher/url_launcher.dart';

class AddCrafts extends StatefulWidget {
  static bool isHomePage = false,
      isNewProject = false,
      isMainteneanceProject = false;
  String name,
      craftsmanship,
      location,
      phoneNumber
      /*براعة

  راح جيبها من سب تيبل الي
  فيهم التخصوصات و المهن
  واذا كان مثلا سائق
  راح اكتب سائق
  وجنبها او تحتها
  اسم الالة
  */
      ,
      image;

  int userNo, age;

  // String lName, fName;

  AddCrafts({
    Key? key,
    required this.name,
    required this.age,
    required this.craftsmanship,
    required this.location,
    required this.phoneNumber,
    required this.image,
    required this.userNo,
  }) : super(key: key);

  @override
  _AddCraftsState createState() =>
      // ignore: unnecessary_this
      _AddCraftsState(
          this.name,
          this.craftsmanship,
          this.location,
          // ignore: unnecessary_this
          this.phoneNumber,
          this.image,
          this.userNo,
          this.age);
}

class _AddCraftsState extends State<AddCrafts> {
  String name, craftsmanship, location, phoneNumber, image;

  int userNo, age;

  _AddCraftsState(this.name, this.craftsmanship, this.location,
      this.phoneNumber, this.image, this.userNo, this.age);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* App Bar
      appBar: AppBSup(
        txt: 'صفحة صنايعي',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(200.0),
                  child: Image.network(
                    image,
                    height: 200,
                    // width: 250,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  width: (MediaQuery.of(context).size.width),
                  child: Card(
                    child: GoBack.tx('الاسم :  $name'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  width: (MediaQuery.of(context).size.width),
                  child: Card(
                    child: GoBack.tx('العمر :  $age'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            Row(
              children: [
                Container(
                  width: (MediaQuery.of(context).size.width),
                  child: Card(
                    child: GoBack.tx('الموقع :  $location'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            Row(
              children: [
                Container(
                  width: (MediaQuery.of(context).size.width),
                  child: Card(
                    child: GoBack.tx('الرقم التعريفي :  $userNo'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            Row(
              children: [
                Container(
                  width: (MediaQuery.of(context).size.width),
                  child: Card(
                    child: GoBack.tx('المهنه :  $craftsmanship'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  width: (MediaQuery.of(context).size.width),
                  child: Card(
                    child: GoBack.tx('رقم الهاتف :  ' + phoneNumber),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Container(
                  width: (MediaQuery.of(context).size.width),
                  child: ElevatedButton(
                    onPressed: () => launch("tel://$phoneNumber"),
                    child: Icon(Icons.call),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            // هون لازم اخفيها  اذا كنت جاي من الهوم
            AddCrafts.isHomePage
                ? Container()
                : Row(
                    children: [
                      Container(
                        width: (MediaQuery.of(context).size.width),
                        child: ElevatedButton(
                          onPressed: () {
                            //
                            // if(AddCrafts.isNewProject){
                            //   AddCrafts.isMainteneanceProject=!AddCrafts.isMainteneanceProject;
                            // }else if(AddCrafts.isMainteneanceProject){
                            //   AddCrafts.isNewProject=!AddCrafts.isNewProject;
                            // }
                            //

                            // //هاي باخذ منها المعلومات لصفحة مشروع جديد
                            if (AddCrafts.isNewProject) {
                              NewProject.ownerName = name;
                              NewProject.owner_name!.text = name;
                              print(name);
                              NewProject.ownerId = '$userNo';

                              Navigator.popUntil(
                                  context, ModalRoute.withName(NewProject.id));
                            }

                            //هاي باخذ منها المعلومات لصفحة مشروع صيانة
                            if (AddCrafts.isMainteneanceProject) {
                              MainteneanceProject.ownerName = name;
                              MainteneanceProject.owner_name!.text = name;
                              print(name);
                              MainteneanceProject.ownerId = '$userNo';

                              Navigator.popUntil(context,
                                  ModalRoute.withName(MainteneanceProject.id));
                            }

                            // (context, MaterialPageRoute(builder: (BuildContext context) => NewProject()));
                            // Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => NewProject()));
                          },
                          child: Icon(Icons.add_sharp),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
