// ignore_for_file: unused_local_variable, non_constant_identifier_names, avoid_print, unused_import, implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Toast/simple_toast.dart';
import 'package:flutter_finalproject/Packages/Components/user_info_secure_storage/user_save_login.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/Info_User/infi_professionals.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/Info_User/info_mechanice.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/Info_User/info_owner.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/Info_User/info_shop.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/Info_User/info_user_Eng.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/Info_User/info_workers.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/login.dart';
import 'package:flutter_finalproject/Packages/Pages/Home/View/body.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class Register {
  Register() {
    gggg();
  }

  String url = "https://zuporjict1.000webhostapp.com/register.php";
  String msg = "";
  String? emailSaved = '';
  String? passwordSaved = '';

  void gggg() async {
    emailSaved = UserPreferences.getUsername() ?? '';
    passwordSaved = UserPreferences.getPassword() ?? '';
  }

  registerUser() async {
    var data = {};
    var res = await http.post(Uri.parse(url), body: null);
  }

  postLogin({
    required TextEditingController email,
    required TextEditingController password,
    required BuildContext context,
  }) async {
    //200--success ,400,404,
    String ms = '';
    try {
      var response = await http.post(
        Uri.parse("https://zuporjict1.000webhostapp.com/login.php"),
        body: {
          'email': email.text,
          'password': password.text,
        },
      );
      ms = response.body;
      UserPreferences.setUsername(email.text);
      UserPreferences.setPassword(password.text);
      print(response.body);
      if (ms == 'Login succeeded') {
        Navigator.pushReplacementNamed(context, PageHome.id);
      }
    } catch (e) {
      ms = e.toString();
      print(e);
    }
    tostforRegsetr(ms);
  }

  postData({
    required TextEditingController first_name,
    required TextEditingController last_name,
    // required TextEditingController age,
    required TextEditingController email,
    required TextEditingController password,
    required TextEditingController phone_number,
    // required TextEditingController city_user,
    required BuildContext context,
    required String account_type,
  }) async {
    //200--success ,400,404,
    msg = '';
    try {
      // var response = await http.post(
      //   Uri.parse("https://zuporjict1.000webhostapp.com/register.php"),
      //   body: {
      //     'first_name': first_name.text,
      //     'last_name': last_name.text,
      //     'age': '25', //age.text,
      //     'email': email.text,
      //     'password': password.text,
      //     'phone_number': phone_number.text,
      //     'picture_user': '2iuh64832svsv',
      //     "city_user": 'amman', //city_user.text,
      //     'account_type': account_type, //account_type.text,
      //     'Account_Status': 'yes',
      //     'Activity': 'yes',
      //   },
      // );
      UserPreferences.setUsername(email.text);
      UserPreferences.setPassword(password.text);
      if (account_type == '1') {
        // المهندس

        Navigator.pushNamed(
          context,
          PageInfoEng.id,
        );
      } else if (account_type == '2') {
        //صاحب مهنه
        Navigator.pushNamed(
          context,
          PageInfoPr.id,
        );
      } else if (account_type == '3') {
        //العمال
        //PageInfoworker
        Navigator.pushNamed(
          context,
          PageInfoworker.id,
        );
      } else if (account_type == '6') {
        //المالك العقار
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PageInfowner()),
        );
      } else if (account_type == '4') {
        //صاحب المتجر
        Navigator.pushNamed(
          context,
          PageInfoShope.id,
        );
      } else if (account_type == '5') {
        //اصحاب الالات
        Navigator.pushNamed(context, PageInfoMech.id);
      }
      // msg = response.body;
      // print(response.body);
      // print('\n\n\n\n\n\n');
      // print(response)

    } catch (e) {
      msg = e.toString();
      print(e);
    }
    tostforRegsetr(msg);
  }

  //*******************************************************************************

  postDataUpdateImage({
    required String picture_user,
  }) async {
    //200--success ,400,404,

    try {
      var response = await http.post(
        Uri.parse(
            "https://zuporjict1.000webhostapp.com/extra%20registration/updateRigster/register_update_image.php"),
        body: {
          'email': emailSaved,
          'password': passwordSaved,
          'picture_user': "https://zuporjict1.000webhostapp.com/upload_image/" +
              picture_user,
        },
      );
      msg = response.body;
      print(response.body);
      // print('\n\n\n\n\n\n');
      // print(response)

    } catch (e) {
      msg = e.toString();
      print(e);
    }
    tostforRegsetr(msg);
  }

  //*******************************************************************************

  postDataUpdateOwner({
    required TextEditingController city_user,
    BuildContext? context,
  }) async {
    //200--success ,400,404,

    try {
      var response = await http.post(
        Uri.parse(
            "https://zuporjict1.000webhostapp.com/extra%20registration/updateRigster/register_update_Owner.php"),
        body: {
          'email': emailSaved,
          'password': passwordSaved,
          'city_user': city_user.text,
        },
      );
      msg = response.body;
      print(msg);
      if (context != null) {
        if (msg == "New record created successfully") {
          Navigator.pushReplacementNamed(context, PageHome.id);
        }
      }
    } catch (e) {
      msg = e.toString();
    }
    tostforRegsetr(msg);
  }

  //*******************************************************************************

  //*******************************************************************************

  postDataEngineer({
    required TextEditingController city_user,
    required TextEditingController Guild_number,
    // required TextEditingController Guild_picture,
    required TextEditingController office_name,
    required BuildContext context,
  }) async {
    //200--success ,400,404,
    msg = '';
    try {
      postDataUpdateOwner(
        city_user: city_user,
      );
      var response = await http.post(
        Uri.parse(
            "https://zuporjict1.000webhostapp.com/extra%20registration/register_Engineer.php"),
        body: {
          'email': emailSaved,
          'password': passwordSaved,
          'city_user': city_user.text,
          'Guild_number': Guild_number.text,
          'Guild_picture': office_name.text + Guild_number.text + 'smsm',
          'office_name': office_name.text,
        },
      );
      msg = response.body;

      if (msg == "New record created successfully") {
        Navigator.pushReplacementNamed(context, PageHome.id);
      }
      // print('\n\n\n\n\n\n');
      // print(response)

    } catch (e) {
      msg = e.toString();
      print(e);
    }
    tostforRegsetr(msg);
  }

  //*******************************************************************************

  //*******************************************************************************

  postDataDrivers({
    required TextEditingController city_user,
    // required TextEditingController license_image,
    required TextEditingController license_no,
    required TextEditingController Type,
    required BuildContext context,
  }) async {
    //200--success ,400,404,
    msg = '';
    try {
      postDataUpdateOwner(
        city_user: city_user,
      );
      var response = await http.post(
        Uri.parse(
            "https://zuporjict1.000webhostapp.com/extra%20registration/register_Drivers.php"),
        body: {
          'email': emailSaved,
          'password': passwordSaved,
          'city_user': city_user.text,
          // 'license_image': license_image.text,
          'license_no': license_no.text,
          'Type': Type.text,
        },
      );
      msg = response.body;
      print(response.body);
      if (msg == "New record created successfully") {
        Navigator.pushReplacementNamed(context, PageHome.id);
      }
    } catch (e) {
      msg = e.toString();
      print(e);
    }
    tostforRegsetr(msg);
  }

  //*******************************************************************************

//*******************************************************************************

  postDataProfessional({
    required TextEditingController city_user,
    required TextEditingController Profession_name,
    required TextEditingController profssion_certficate_no,
    required BuildContext context,
  }) async {
    //200--success ,400,404,

    try {
      postDataUpdateOwner(
        city_user: city_user,
      );
      var response = await http.post(
        Uri.parse(
            "https://zuporjict1.000webhostapp.com/extra%20registration/register_professional.php"),
        body: {
          'email': emailSaved,
          'password': passwordSaved,
          'city_user': city_user.text,
          'Profession_name': Profession_name.text,
          'profssion_certficate_no': profssion_certficate_no.text,
        },
      );
      msg = response.body;
      if (msg == "New record created successfully") {
        Navigator.pushReplacementNamed(context, PageHome.id);
      }
    } catch (e) {
      msg = e.toString();
      print(e);
    }
    tostforRegsetr(msg);
  }

  //*******************************************************************************
  postImageDirvers({
    required String license_image,
  }) async {
    //200--success ,400,404,

    try {
      var response = await http.post(
        Uri.parse(
            "https://zuporjict1.000webhostapp.com/extra%20registration/updateRigster/uplod_image_Dirvers.php"),
        body: {
          'license_image':
              "https://zuporjict1.000webhostapp.com/upload_image/" +
                  license_image,
        },
      );
      msg = response.body;
      // print(response.body);
      // print('\n\n\n\n\n\n');
      // print(response)

    } catch (e) {
      msg = e.toString();
      print(e);
    }
    tostforRegsetr(msg);
  }

  //*******************************************************************************
  RemovingSessionData(BuildContext context) async {
    //200--success ,400,404,

    try {
      var response = await http.post(
          Uri.parse(
              "https://zuporjict1.000webhostapp.com/Removing_session_data.php"),
          body: {});
      Navigator.pushReplacementNamed(context, PageLogin.id);
    } catch (e) {
      msg = e.toString();
      print(e);
    }
    tostforRegsetr(msg);
  }

  //*******************************************************************************
  postImageSyndicateCard({
    required String Guild_picture,
  }) async {
    //200--success ,400,404,

    try {
      var response = await http.post(
        Uri.parse(
            "https://zuporjict1.000webhostapp.com/extra%20registration/updateRigster/Upload_syndicate_card.php"),
        body: {
          'email': emailSaved,
          'password': passwordSaved,
          'Guild_picture':
              "https://zuporjict1.000webhostapp.com/upload_image/" +
                  Guild_picture,
        },
      );
      msg = response.body;
      // print(response.body);
      // print('\n\n\n\n\n\n');
      // print(response)

    } catch (e) {
      msg = e.toString();
      print(e);
    }
    tostforRegsetr(msg);
  }

  //*******************************************************************************

  postDataWorkers({
    required TextEditingController city_user,
    required TextEditingController work_name,
    required BuildContext context,
  }) async {
    //200--success ,400,404,

    try {
      postDataUpdateOwner(
        city_user: city_user,
      );
      var response = await http.post(
        Uri.parse(
            "https://zuporjict1.000webhostapp.com/extra%20registration/register_Workers.php"),
        body: {
          'email': emailSaved,
          'password': passwordSaved,
          'city_user': city_user.text,
          'work_name': work_name.text,
        },
      );
      msg = response.body;
      print(response.body);
      if (msg == "New record created successfully") {
        Navigator.pushReplacementNamed(context, PageHome.id);
      }
    } catch (e) {
      msg = e.toString();
      print(e);
    }
    tostforRegsetr(msg);
  }

  //*******************************************************************************
  splashLogin(BuildContext context) async {
    try {
      var response = await http.post(
        Uri.parse(
            "https://zuporjict1.000webhostapp.com/splash%20For%20login/splashLogin.php"),
        body: {},
      );
      msg = response.body;
      // print(response.body);
      if (msg == "Login succeeded") {
        Navigator.pushReplacementNamed(context, PageHome.id);
      } else {
        Navigator.pushReplacementNamed(context, PageLogin.id);
      }
    } catch (e) {
      msg = e.toString();
      print(e);
    }
    // print('e'+msg);
    tostforRegsetr(msg);
  }

//*******************************************************************************
  //*******************************************************************************
  Future<String> getDataImage_user() async {
    String tx = '';
    try {
      var response = await http.post(
        Uri.parse(
            "https://zuporjict1.000webhostapp.com/splash%20For%20login/image_user.php"),
        body: {},
      );
      tx = response.body;
      // print('postDataImage_user    ' + msg);
    } catch (e) {
      tx =
          'https://zuporjict1.000webhostapp.com/WhatsApp%20Image%202021-12-10%20at%2010.40.18%20PM.jpeg';

      print(e);
    }

    // tostforRegsetr(cutHttps(msg));
    return cutHttps(tx);
  }

  //*******************************************************************************
  cutHttps(String url) {
    String ur = '';
    bool isHttp = false;
    for (int i = 0; i < url.length; i++) {
      if (url[i] == 'h' || isHttp) {
        isHttp = true;
        ur += url[i];
      }
    }

    return ur;
  }

  //*******************************************************************************
  //*******************************************************************************
  //*******************************************************************************
  //*******************************************************************************

  tostforRegsetr(String mss) {
    return Fluttertoast.showToast(
        // child: Text(
        //   'Login Successful',
        //   style: Textstyle(fontsize: 25, color: Colors.green),
        // ),
        msg: mss); // Text
  }

  String removeAddPathImage(String picture_user) {
    var stopLoop = true;
    var new_name = '';
    for (int i = 0; i < picture_user.length; i++) {
      if (picture_user[i] == '@') {
        stopLoop = false;
      } else if (stopLoop == false) {
        new_name += picture_user[i];
      }
    }
    return new_name;
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
