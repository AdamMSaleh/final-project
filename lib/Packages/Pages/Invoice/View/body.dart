// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, implementation_imports, unused_import, must_be_immutable, sized_box_for_whitespace, duplicate_ignore, avoid_unnecessary_containers

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/Drawer/drawer.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/app_loading.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/enum_loading.dart';

import 'package:flutter_finalproject/Packages/Components/cach_image/image_user.dart';

import 'package:flutter_finalproject/Packages/Pages/Archive/View/body.dart';
import 'package:flutter_finalproject/Packages/Pages/CurrentProjects/View/body.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/appbar.dart';

import 'package:flutter_finalproject/Packages/Pages/NewProject/View/new_project.dart';
import 'package:flutter_finalproject/Packages/Pages/NewProject/components/BoxDialog/dialog.dart';

import 'package:flutter_finalproject/Packages/Pages/Profile/View/profile.dart';
import 'package:flutter_finalproject/Packages/Pages/Profile/View/upload_image.dart';
import 'package:flutter_finalproject/Packages/Pages/Research/view/body.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/style.dart';
import 'package:flutter_finalproject/Utils/path_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Components/Select_Screen/select_screen.dart';
import '../../../Components/upload_image_Invoice/upload_image.dart';
import '../Components/invoice.dart';

class Invoice extends StatefulWidget {
  static const String id = 'Invoice';

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //*Appbar
      appBar: AppBHome(),
      //*drawer
      drawer: DrawerHome(),
      body: Container(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => SelSc().selectScreen(context, InvoiceWrite()),
              child: Text("إنشاء فاتورة"),
            ),
            ElevatedButton(
              onPressed: () =>
                  SelSc().selectScreen(context, UploadImageInvoice()),
              child: Text("تحميل فاتورة"),
            )
          ],
        ),
      ),
    );
  }
}
