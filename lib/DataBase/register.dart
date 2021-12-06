import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Register {
  String url = "https://zuporjict1.000webhostapp.com/register.php";

  registerUser() async {
    var data = {};
    var res = await http.post(Uri.parse(url), body: null);
  }

  postData({
    required TextEditingController first_name,
    required TextEditingController last_name,
    // required TextEditingController age,
    required TextEditingController email,
    required TextEditingController password,
    required TextEditingController phone_number,
    // required TextEditingController city_user,
    // required TextEditingController account_type,
  }) async {
    //200--success ,400,404,500
    try {
      var response = await http.post(
        Uri.parse("https://zuporjict1.000webhostapp.com/register.php"),
        body: {
          'first_name': first_name.text,
          'last_name': last_name.text,
          'age': '25',//age.text,
          'email': email.text,
          'password': password.text,
          'phone_number': phone_number.text,
          'picture_user': '2iuh64832svsv',
          "city_user": 'amman',//city_user.text,
          'account_type': '01',//account_type.text,
          'Account_Status': 'yes',
          'Activity': 'yes',
        },
      );
      print(response.body);
      // print('\n\n\n\n\n\n');
      // print(response)

    } catch (e) {
      print(e);
    }
  }
/*
  first_name
  last_name
  age
  email
  password
  phone_number
  picture_user
  city_user
  account_type
  Account_Status
  Activity
*/
}
