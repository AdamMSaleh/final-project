// ignore_for_file: must_be_immutable, no_logic_in_create_state, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Packages/Components/Additions/go_back.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/appbar/sup_appbar.dart';

class AddCrafts extends StatefulWidget {
  String name, craftsmanship
  /*براعة

  راح جيبها من سب تيبل الي
  فيهم التخصوصات و المهن
  واذا كان مثلا سائق
  راح اكتب سائق
  وجنبها او تحتها
  اسم الالة
  */
  , image = 'assets/image/35844.jpg';

  int age;
  // String lName, fName, location, phoneNumber, userNo;

  AddCrafts(
      {Key? key,
      required this.name,
      required this.age,
      required this.craftsmanship})
      : super(key: key);

  @override
  _AddCraftsState createState() =>
      // ignore: unnecessary_this
      _AddCraftsState(this.name, this.age, this.craftsmanship);
}

class _AddCraftsState extends State<AddCrafts> {
  String name;
  int age;
  String craftsmanship;
  String image = 'assets/Images/35844.jpg';

  _AddCraftsState(this.name, this.age, this.craftsmanship);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* App Bar
      appBar: AppBSup(
        txt: 'صفحة صنايعي',
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(200.0),
                child: Image.asset(
                  image,
                  height: 200,
                  width: 250,
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
                  child: GoBack.tx('رقم الهاتف :  0799995566'),
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
                  onPressed: () {},
                  child: Icon(Icons.call),
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
                child: ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.add_sharp),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
