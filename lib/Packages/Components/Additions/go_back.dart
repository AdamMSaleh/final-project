// ignore_for_file: unused_local_variable, non_constant_identifier_names, deprecated_member_use, avoid_unnecessary_containers, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_finalproject/DataBase/register.dart';
import 'package:flutter_finalproject/Packages/Pages/Invoice/Components/design.dart';

class GoBack {
  static back(ctx) {
    return IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.white),
      onPressed: () => Navigator.of(ctx).pop(),
    );
  }

  static rowOfProject(
      int number, String nameProject, String ownersName, bool Status) {
    double heig = 38;
    return Row(
      children: [
        Expanded(
          child: Center(
              child: Text(
            '${number == -1 ? "الرقم" : number}',
            style: const TextStyle(color: Colors.white),
          )),

          flex: 1,
          // height: heig,
        ),
        Expanded(
          child: Center(
              child: Text(nameProject,
                  style: const TextStyle(color: Colors.white))),
          flex: 2,
          // height: heig,
        ),
        Expanded(
          child: Center(
              child: Text(ownersName,
                  style: const TextStyle(color: Colors.white))),
          flex: 2,
          // height: heig,
        ),
        Expanded(
          child: Center(child: StatusF(Status, number)),
          flex: 1,
          // height: heig,
        ),
      ],
    );
  }

  static Text StatusF(bool Status, int number) {
    return number == -1
        ? const Text(
            'الحالة',
          )
        : Status
            ? const Text(
                'منتهي',
                style: TextStyle(color: Colors.green),
              )
            : const Text(
                'قيد الانشاء',
                style: TextStyle(color: Colors.yellow),
              );
  }

  static selectScreen(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_ /*context*/) {
      return page;
    }));
  }

  static void bottomSheet(
    BuildContext ctx, {
    String? card1,
    Widget? pageCard1,
    String? card2,
    Widget? pageCard2,
    String? card3,
    Widget? pageCard3,
    Widget? page,
  }) {
    card1 != null
        ? showModalBottomSheet(
            context: ctx,
            builder: (_) {
              return Container(
                height: 222,
                padding: const EdgeInsets.all(20),
                color: project_color('9D5F7E'),
                child: Container(
                  child: Column(
                    children: [
                      card1 != null
                          ? InkWell(
                              onTap: () => selectScreen(ctx, pageCard1!),
                              child: Center(
                                child: Card(
                                  child: tx(card1),
                                ),
                              ),
                            )
                          : Container(),
                      card2 != null
                          ? InkWell(
                              onTap: () => selectScreen(ctx, pageCard2!),
                              child: Center(
                                child: Card(
                                  child: tx(card2),
                                ),
                              ),
                            )
                          : Container(),
                      card3 != null
                          ? InkWell(
                              onTap: () => selectScreen(ctx, pageCard3!),
                              child: Center(
                                child: Card(
                                  child: tx(card3),
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              );
            })
        : selectScreen(ctx, page!);
  }

  static Widget tx(String str,
      {double sizee = 15, Color textColor = Colors.black}) {
    return Center(
        child: Text(str,
            style: TextStyle(fontSize: sizee, color: textColor),
            textAlign: TextAlign.center));
  }

  static btn(
    String title,
    BuildContext ctx, {
    String? card1,
    Widget? pageCard1,
    String? card2,
    Widget? pageCard2,
    String? card3,
    Widget? pageCard3,
    Widget? page,
  }) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [project_color('741b47'), Colors.white.withOpacity(0.1)],
          begin: Alignment.centerRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextButton(
        // style: ButtonStyle(alignment: Alignment.center),
        onPressed: () => bottomSheet(
          ctx,
          card1: card1,
          pageCard1: pageCard1,
          card2: card2,
          pageCard2: pageCard2,
          card3: card3,
          pageCard3: pageCard3,
          page: page,
        ),
        child: tx(title, sizee: 15),
      ),
    );
  }

  btnAlertDialog(
    Widget title,
        String Projec_No,
    BuildContext ctx,

    //      {
    //       Function()? onPressed,
    // }
  ) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [project_color('741b47'), Colors.white.withOpacity(0.1)],
          begin: Alignment.centerRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextButton(
        // style: ButtonStyle(alignment: Alignment.center),
        onPressed: () {
          showAlertDialog(ctx,Projec_No );
        },
        child: title,
      ),
    );
  }

// */*/*/*/*/*/*///////////////////////////////////////////////////////

  //showAlertDialog

  showAlertDialog(BuildContext context, String Projec_No) {
    // set up the buttons
    Widget remindButton = TextButton(
      child: const Text(
          "  متأكد  "),
      onPressed: () {
       Register().StatusUpdateProject( context: context,Projec_No:Projec_No );
      },
    );
    Widget cancelButton = TextButton(
      child: const Text(" إنهاء "),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    // Widget launchButton = TextButton(
    //   child: const Text("Launch missile"),
    //   onPressed: () {},
    // );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("  إحذر  ",textAlign: TextAlign.center,),
      content: const Text(
          "  هل متأكد من إنهاء المشروع \n لا يمكن التراجع في المستقبل\n هل أنت موافق ؟  ",textAlign: TextAlign.center,),
      actions: [
        Row(children: [ remindButton,
          cancelButton,],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,)

        // launchButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
