// ignore_for_file: unused_local_variable, non_constant_identifier_names, avoid_print, unused_import, implementation_imports, slash_for_doc_comments, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Packages/Components/user_info_secure_storage/user_save_login.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/Info_User/infi_professionals.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/Info_User/info_mechanice.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/Info_User/info_owner.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/Info_User/info_shop.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/Info_User/info_user_Eng.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/Info_User/info_workers.dart';
import 'package:flutter_finalproject/Packages/Pages/Auth/Views/login.dart';
import 'package:flutter_finalproject/Packages/Pages/CurrentProjects/View/body.dart';
import 'package:flutter_finalproject/Packages/Pages/Home/View/body.dart';
import 'package:flutter_finalproject/Packages/Pages/Profile/Components/profile_information.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

// import 'package:json_serializable/json_serializable.dart' as Genre;
class RegisterState extends StatefulWidget {
  const RegisterState({Key? key}) : super(key: key);

  @override
  Register createState() => Register();
}

class Register extends State<RegisterState> {
  Register() {
    gggg();
  }

  String url = "http://relaxbuilding.space/";

  //'http://10.0.2.2:80/v2/'; //"https://zuporjict1.000webhostapp.com/";
  String msg = "";
  String? emailSaved = '';
  String? passwordSaved = '';
  static bool cicul = false;
  late List<ProfileInformation> profileData;

  void gggg() async {
    emailSaved = UserPreferences.getUsername() ?? '';
    passwordSaved = UserPreferences.getPassword() ?? '';
  }

  registerUser() async {
    var data = {};
    var res = await http.post(Uri.parse(url), body: null);
  }

  postLogin({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    //200--success ,400,404,
    msg = '';
    try {
      cicul = !cicul;
      PageLogin().startTime = DateTime.now();
      var response = await http.post(
        Uri.parse(url + "login.php"),
        body: {
          'email': email,
          'password': password,
          // 'print': "print sami 9 mrat",
        },
      );
      print(response);
      msg = response.body;

      print(response.body);
      // ignore: unnecessary_string_escapes
      if (msg == '\"Login succeeded\"') {
        cicul = !cicul;
        // await  UserPreferences.removeUsername();
        // await UserPreferences.removePassword();
        // await UserPreferences.removeUserId();

        await UserPreferences.setUsername(email);
        print("UserPreferences.getUsername(");
        print(UserPreferences.getUsername());
        await UserPreferences.setPassword(password);
        await Register().loadData(
          email,
          password,
        );
        Navigator.pushReplacementNamed(context, PageHome.id);
      } else {
        Navigator.pushReplacementNamed(context, PageLogin.id);

        cicul = !cicul;
      }
    } catch (e) {
      cicul = !cicul;
      msg = e.toString();
      print(e);
    }
    // cicul=!cicul;
    // cicul=!cicul;
    tostforRegsetr(msg);
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
      //   Uri.parse(url+"register.php"),
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
        Uri.parse(url +
            "extra%20registration/updateRigster/register_update_image.php"),
        body: {
          'email': emailSaved,
          'password': passwordSaved,
          'picture_user': url + "upload_image/" + picture_user,
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
        Uri.parse(url +
            "extra%20registration/updateRigster/register_update_Owner.php"),
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
        Uri.parse(url + "extra%20registration/register_Engineer.php"),
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
        Uri.parse(url + "extra%20registration/register_Drivers.php"),
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
        Uri.parse(url + "extra%20registration/register_professional.php"),
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
            url + "extra%20registration/updateRigster/uplod_image_Dirvers.php"),
        body: {
          'license_image': url + "upload_image/" + license_image,
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
      var response = await http
          .post(Uri.parse(url + "Removing_session_data.php"), body: {});
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
        Uri.parse(url +
            "extra%20registration/updateRigster/Upload_syndicate_card.php"),
        body: {
          'email': emailSaved,
          'password': passwordSaved,
          'Guild_picture': url + "upload_image/" + Guild_picture,
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
        Uri.parse(url + "extra%20registration/register_Workers.php"),
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
    // String msg = '';
    try {
      await postLogin(
        context: context,
        email: emailSaved!,
        password: passwordSaved!,
      );
      // var response = await http.post(
      //   Uri.parse(url + "splash%20For%20login/splashLogin/splashLogin.php"),
      //   body: {
      //     'email': emailSaved,
      //     'password': passwordSaved,
      //   },
      // );
      // msg = response.body;

      // print(response.body);
      // if (msg == '/"Login succeeded/"') {
      //   Navigator.pushReplacementNamed(context, PageHome.id);
      // } else {
      //   Navigator.pushReplacementNamed(context, PageLogin.id);
      // }
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
        Uri.parse(url + "splash%20For%20login/image_user.php"),
        body: {
          'email': emailSaved,
          'password': passwordSaved,
        },
      );
      tx = response.body;
      if (!tx.contains(url + "")) {
        tx = url + 'WhatsApp%20Image%202021-12-10%20at%2010.40.18%20PM.jpeg';
      }
      // print('postDataImage_user    ' + msg);
    } catch (e) {
      tx = url + 'WhatsApp%20Image%202021-12-10%20at%2010.40.18%20PM.jpeg';

      print(e);
    }
// print ('cutHttps(tx)'+tx);
    // tostforRegsetr(cutHttps(msg));
    // tostforRegsetr(tx);
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
// notification(String token1) async {
//   String msg = '';
//   try {
//     var response = await http.post(
//       Uri.parse(url+"notificationNew.php"),
//       body: {
//         'token': token1,//emailSaved,
//
//       },
//     );
//     msg = response.body;
//
//
//   } catch (e) {
//     msg = e.toString();
//     print(e);
//   }
//   print(msg);
//
//   tostforRegsetr(msg);
// }

  /*********************************************************************************/
  loadData(
    String email,
    String password,
  ) {
    var data;
    // bool dataLoaded = false;
    bool error = false;
    return Future.delayed(Duration.zero, () async {
      var res = await http.post(
        Uri.parse(url + 'personal%20information/Profile_information.php'),
        body: {
          'email': email,
          'password': password,
        },
      );
      if (res.statusCode == 200) {
        data = json.decode(res.body);

        // print('sami msai kmsia mias mkkmsdi kkmdjmspa');
        // print(data);
        var type = data["account_type"];

        ProfileInformation.email = data["email"];
        ProfileInformation.city_user = data["city_user"];
        ProfileInformation.age = data["age"];
        ProfileInformation.userNo = data["user_no"];
        UserPreferences.setUserId(data["user_no"]);
        ProfileInformation.picture_user = data["picture_user"];
        ProfileInformation.phoneage = data["phoneage"];
        ProfileInformation.first_name = data["first_name"];
        ProfileInformation.last_name = data["last_name"];
        ProfileInformation.account_type = setaccount_type(type);
        ProfileInformation.phone_number = data["phone_number"];

        //  profileData = List<ProfileInformation>.from(data["data"].map((i){
        //   return ProfileInformation.fromJSON(i);
        // }));
        // print('sami msai kmsia mias mkkmsdi kkmdjmspa');
        // print(profileData);
        error = false;
        // we set dataloaded to true,
        // so that we can build a list only
        // on data load

      } else {
        //there is error
        print('osam soas moasm oasma omsa sooas omsas osamsas omsamsa osmams');
        error = true;
      }
    });
    // we use Future.delayed becuase there is
    // async function inside it.
  }

  /********************************************************************************/
  viewProjectsOwner(
      String ownerId,

      ) {
    var data;
    // bool dataLoaded = false;
    bool error = false;
    return Future.delayed(Duration.zero, () async {
      var res = await http.post(
        Uri.parse(url + 'Project_establishment/view_projects.php'),
        body: {
          'Owner_User_ID': ownerId,
'user_no_eng':''
        },
      );
      print('engId'+ownerId);
      if (res.statusCode == 200) {
        data = json.decode(res.body) as List<dynamic>;
        print('viewProjectsOwner  :' +data);
        error = false;

      } else {


        error = true;
      }
      return data;
    });
    // we use Future.delayed becuase there is
    // async function inside it.
  }
  /********************************************************************************/

  /********************************************************************************/
  viewProjectsEng(
      String engId,

      ) {
    var data;
    // bool dataLoaded = false;
    bool error = false;
    return Future.delayed(Duration.zero, () async {
      var res = await http.post(
        Uri.parse(url + 'Project_establishment/view_projects.php'),
        body: {
          'user_no_eng': engId,
'Owner_User_ID':''
        },
      );
      print('engId'+engId);
      if (res.statusCode == 200) {
        data = json.decode(res.body) as List<dynamic>;
        // print('viewProjectsEng  :' +data);
        error = false;

      } else {


        error = true;
      }
      return data;
    });
    // we use Future.delayed becuase there is
    // async function inside it.
  }
  /********************************************************************************/

  String setaccount_type(type) {
    String type1 = "";
    switch (type) {
      case ('10'):
        type1 = '   مهندس  ';
        break;
      case ('20'):
        type1 = '  مالك عقار   ';
        break;
      case ('30'):
        type1 = '   عامل   ';
        break;
      case ('40'):
        type1 = '   سائق اليه   ';
        break;
      case ('50'):
        type1 = '      صاحب مهنه   ';
        break;
    }
    return type1;
  }

  /********************************************************************************/
  /********************************************************************************/
  /********************************************************************************/
  getSerchePage() async {
    var tx;
    try {
      var response = await http.get(
        Uri.parse(url + "search_page/add_craftsmanship.php"),
      );
      tx = jsonDecode(response.body) as List<dynamic>;

      print(url);
      // print(tx[3]['email']);
      // print('postDataImage_user    ' + msg);
    } catch (e) {
      tx = e.toString();

      print(e);
    }
    return tx;
  }

  /********************************************************************************/

  //*******************************************************************************

  postDataCreateNewProject({
    required String user_no_eng,
    required String project_name,
    required String City,
    required String Region,
    required String selectedDateStart,
    required String selectedDateEnd,
    required String Owner_User_ID,
    required String owner_name,
    required String construction_license,
    required BuildContext context,
  }) async {
    //200--success ,400,404,

    try {
      var response = await http.post(
        Uri.parse(url + "Project_establishment/nuw_Project.php"),
        body: {
          'user_no_eng': user_no_eng,
          'project_name': project_name,
          'City': City,
          'Region': Region,
          'starting_date': selectedDateStart,
          'Expected_completion_date': selectedDateEnd,
          'Owner_User_ID': Owner_User_ID,
          'owner_name': owner_name,
          'construction_license': construction_license,
          'Project_Type': 'new',
          'state': '1',
        },
      );
      msg = response.body;
      print(response.body);
      if (msg == '  لقد تمت اضافة المشروع   ') {
        Navigator.pushReplacementNamed(context, CurrentProjects.id);
      }
    } catch (e) {
      msg = e.toString();
      print(e);
    }
    tostforRegsetr(msg);
  }

  //*******************************************************************************

  /********************************************************************************/
  /********************************************************************************/
  /********************************************************************************/
  /********************************************************************************/
  /********************************************************************************/
  /********************************************************************************/
  /********************************************************************************/
  /********************************************************************************/
  /********************************************************************************/
  /********************************************************************************/

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

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    throw UnimplementedError();
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
