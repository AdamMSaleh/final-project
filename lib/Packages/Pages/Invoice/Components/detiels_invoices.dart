// ignore_for_file: non_constant_identifier_names, camel_case_types, avoid_print, prefer_if_null_operators

import 'package:flutter_finalproject/DataBase/register.dart';
import 'package:flutter_finalproject/Packages/Components/Toast/simple_toast.dart';
import 'package:flutter_finalproject/Packages/Pages/CurrentProjects/View/projects_details.dart';

class Detiels_Invoices {
  String? image_pd;
  String name_item;
  double price;
  double? count_item;

  // late double total;
  Detiels_Invoices(
      {required this.name_item,
      required this.price,
      this.count_item,
      this.image_pd}) {
    // total = price * count_item;
  }

  static List<Detiels_Invoices> invoice_info = [];

  static getDataPlan() async {
    // people=[];
    var x = await Register().viewInvoice(ProjectsDetails.Projec_No1!);
    print(x);
    if (x != 'no data') {
      for (int i = 0; i < x.length; i++) {
        invoice_info.add(Detiels_Invoices(
          name_item: x[i]['product_name'],
          price: double.tryParse(x[i]['price_pd'])!,
          count_item: x[i]['number_pd'] != null
              ? double.tryParse(x[i]['number_pd'])
              : null,
          image_pd: x[i]['image_pd'] != null ? x[i]['image_pd'] : null,
        ));
      }
    } else {
      simpleToast(message: '   لا يوجد مشاريع   ');
    }
  }
}
