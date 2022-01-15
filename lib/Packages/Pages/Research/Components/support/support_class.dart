// ignore_for_file: avoid_print

import 'package:flutter_finalproject/DataBase/register.dart';

class Person {
  final String? name, location, phoneNumber, craftsmanship, image

      /*براعة

  راح جيبها من سب تيبل الي
  فيهم التخصوصات و المهن
  واذا كان مثلا سائق
  راح اكتب سائق
  وجنبها او تحتها
  اسم الالة
  */
      ;

  final int? userNo, age;

// String ;

  Person(
      {this.name,
      this.location,
      this.phoneNumber,
      this.userNo,
      this.craftsmanship,
      this.age,
      this.image});

  static List<Person> people = [];

  static getDataPerson() async {
    // people=[];
    var x = await Register().getSerchePage();

    for (int i = 0; i < x.length; i++) {
      String img = x[i]['picture_user'];
      int q = int.parse(x[i]['account_type']);
      String? stt = '';
      switch (q) {
        case(10):stt='   مهندس  ';
        break;
        case(20):stt='  مالك عقار   ';
        break;
        case(30):stt='   عامل   ';
        break;
        case(40):stt='   سائق اليه   ';
        break;
        case(50):stt='      صاحب مهنه   ';
        break;
      }

      if (img.length < 24) {
        img =
            'https://static.wixstatic.com/media/50672b_4068ec82ec7f4740aeca7ee16fda9290~mv2.png/v1/fill/w_300,h_300,al_c,usm_0.66_1.00_0.01/Imahe%20Logos.png';
      }

      people.add(Person(
        age: int.tryParse(x[i]['age']),
        name: x[i]['first_name'] + ' ' + x[i]['last_name'],
        location: x[i]['city_user'],
        image: img,
        phoneNumber: x[i]['phone_number'],
        userNo: int.tryParse(x[i]['user_no']),
        craftsmanship: stt, //x[i]['email'],
      ));
      print(i);
    }

    // print(people[2].fName);
    // return people as List<Person> ;
  }
}
