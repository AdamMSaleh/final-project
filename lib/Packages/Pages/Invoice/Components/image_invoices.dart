// ignore_for_file: no_logic_in_create_state, unnecessary_this, non_constant_identifier_names, camel_case_types, must_be_immutable, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_finalproject/DataBase/register.dart';
import 'package:flutter_finalproject/Packages/Components/Add_Image/alert_choose.dart';
import 'package:flutter_finalproject/Packages/Pages/CurrentProjects/View/projects_details.dart';

import 'design.dart';
import 'detiels_invoices.dart';
import 'view_invoices.dart';

class ImageInvoices extends StatefulWidget {
  const ImageInvoices({ Key? key, }) : super(key: key);
static String imageIv='';

  _invoicesState createState() => _invoicesState();
}
//-------------------------------------------------------
//-------------------------------------------------------

class _invoicesState extends State<ImageInvoices> {

  late TextEditingController myControllerNameItem = TextEditingController();
  late TextEditingController myControllerPriceItem = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: project_color('741b47'),
        title: Text('إضافة فاتورة جديدة'),
        leading: IconButton(
            onPressed: // Within the `FirstRoute` widget
                () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        view_invoices(

                        )),
              );
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body: Container(
        color: project_color('741b47'),

        child: Container(
          //هاد الكاتيغيوري لكل فاتورة
          margin: const EdgeInsets.all(30),
          height: (MediaQuery
              .of(context)
              .size
              .height) * 0.70,

          decoration: BoxDecoration(

            color: FitnessAppTheme.white,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
                topLeft: Radius.circular(68.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: FitnessAppTheme.white.withOpacity(0.2),
                  offset: const Offset(1.1, 1.1),
                  blurRadius: 10.0),
            ],
          ),
          child: Padding(
            padding:
            //padding for 2100 and  of dialy gole
            const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 4, bottom: 5, top: 3),
                                child: textfild_function(
                                  'ادخل اسم الفاتورة',
                                  '935139',
                                  myControllerNameItem,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 4, bottom: 3),
                                child: textfild_function('ادخل المبلغ كامل', '935139',
                                    myControllerPriceItem,
                                    TKbor: false),
                              ),
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                /***************************************************** */
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 4, bottom: 3),
                                child: Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Text(
                                    ': اسم الفاتورة',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: FitnessAppTheme.fontName,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: FitnessAppTheme.text_color,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 4, bottom: 3, top: 30),
                                child: Text(
                                  ': المبلغ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: FitnessAppTheme.fontName,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: FitnessAppTheme.text_color,
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                      //upload image
                      Container(
                          margin: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.add_photo_alternate,
                                  size: 50,
                                  color: Colors.black54,
                                ),
                                onPressed: () {
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) => AlertChooseImage(
                                      bathImage: 'invoies',
                                    ),
                                  );
                                },

                                //_showOption(context),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            setState(() {
              if (myControllerNameItem.text.isNotEmpty &&
                  myControllerPriceItem.text.isNotEmpty &&
                  ImageInvoices.imageIv.isNotEmpty
              ) {
                Register().uploadInvoice(
                    projec_No: ProjectsDetails.Projec_No1!,
                    product_name: myControllerNameItem.text,
                    price_pd: myControllerPriceItem.text,
                    image_pd: ImageInvoices.imageIv,
                    context: context);

                myControllerNameItem.clear();
                myControllerPriceItem.clear();

              }

            }),
        child: Icon(
          Icons.add,
          size: 40,
        ),
        backgroundColor: project_color('741b47'),
      ),
    );
  }
}
