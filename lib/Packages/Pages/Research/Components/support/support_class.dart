import 'package:flutter_finalproject/DataBase/register.dart';

class Person {
  final String? name , location, phoneNumber, userNo, craftsmanship

  /*براعة

  راح جيبها من سب تيبل الي
  فيهم التخصوصات و المهن
  واذا كان مثلا سائق
  راح اكتب سائق
  وجنبها او تحتها
  اسم الالة
  */;
  final int? age;
// String ;

  Person(
      {this.name,
      this.location,
      this.phoneNumber,
      this.userNo,
      this.craftsmanship,
      this.age});
   static List<Person> people=[];
   static  getDataPerson()  async {
     // people=[];
    var x =  await Register().getSerchePage();

    for (int i = 0; i < x.length; i++) {
      int q=int.parse(x[i]['account_type']);
      String? stt='';
      if(q==10){
        stt='مهندس';

      }else{
        stt='سواق';
      }
      people.add(Person(
        age: int.tryParse(x[i]['user_no']),
        name: x[i]['first_name'] +' '+x[i]['last_name'],

        craftsmanship: stt,//x[i]['email'],
      ));
      print(i);
    }


    // print(people[2].fName);
    // return people as List<Person> ;
  }

}