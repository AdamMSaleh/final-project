// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter_finalproject/DataBase/register.dart';
import 'package:flutter_finalproject/Packages/Components/Toast/simple_toast.dart';
import 'package:flutter_finalproject/Packages/Components/user_info_secure_storage/user_save_login.dart';
import 'package:flutter_finalproject/Packages/Pages/Profile/Components/profile_information.dart';

class ProjectInfo {
  String? Projec_No,
      user_no_eng,
      project_name,
      City,
      Region,
      selectedDateStart,
      selectedDateEnd,
      Owner_User_ID,
      owner_name,
      construction_license,
      Project_Type,
      state;

  ProjectInfo(
      {this.Projec_No,
      this.user_no_eng,
      this.project_name,
      this.City,
      this.Region,
      this.selectedDateStart,
      this.selectedDateEnd,
      this.Owner_User_ID,
      this.owner_name,
      this.construction_license,
      this.state,
      this.Project_Type});

  static List<ProjectInfo> project = [];

  static getDataProject() async {
    // people=[];
    var x;
    if (ProfileInformation.account_type == '   مهندس  ') {
      x = await Register()
          .viewProjectsEng(UserPreferences.getUserId().toString());
    } else if (ProfileInformation.account_type == '  مالك عقار   ') {
      x = await Register()
          .viewProjectsOwner(UserPreferences.getUserId().toString());
    }
    if (x != 'no data') {
      for (int i = 0; i < x.length; i++) {
        project.add(ProjectInfo(
          Projec_No: x[i]['Projec_No'],
          owner_name: x[i]['owner_name'],
          user_no_eng: x[i]['user_no_eng'],
          project_name: x[i]['project_name'],
          City: x[i]['City'],
          Region: x[i]['Region'],
          selectedDateStart: x[i]['starting_date'],
          selectedDateEnd: x[i]['Expected_completion_date'],
          Owner_User_ID: x[i]['Owner_User_ID'],
          construction_license: x[i]['construction_license'],
          state: x[i]['state'],
          Project_Type: x[i]['Project_Type'],
        ));
      }
    } else {
      simpleToast(message: '   لا يوجد مشاريع   ');
    }
  }
}
