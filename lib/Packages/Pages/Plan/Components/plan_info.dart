// ignore_for_file: non_constant_identifier_names

import 'package:flutter_finalproject/DataBase/register.dart';
import 'package:flutter_finalproject/Packages/Components/Toast/simple_toast.dart';
import 'package:flutter_finalproject/Packages/Pages/CurrentProjects/View/projects_details.dart';

class PlanInfo {
  String? Scheme_name,
      Engineering_office_name,
      designer_name,
      Scheme_encoding,
      chart_picture,
      chart_type;

  PlanInfo({
    this.Scheme_name,
    this.Engineering_office_name,
    this.designer_name,
    this.Scheme_encoding,
    this.chart_picture,
    this.chart_type,
  });

  static List<PlanInfo> plan = [];

  static getDataPlan() async {
    // people=[];
    var x = await Register().viewPlans(ProjectsDetails.Projec_No1!);

    if (x != 'no data') {
      for (int i = 0; i < x.length; i++) {
        plan.add(PlanInfo(
          Scheme_name: x[i]['Scheme_name'],
          designer_name: x[i]['designer_name'],
          Engineering_office_name: x[i]['Engineering_office_name'],
          Scheme_encoding: x[i]['Scheme_encoding'],
          chart_picture: x[i]['chart_picture'],
          chart_type: x[i]['chart_type'],
        ));
      }
    } else {
      simpleToast(message: '   لا يوجد مشاريع   ');
    }
  }
}
