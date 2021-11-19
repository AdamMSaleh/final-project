// ignore_for_file: unused_local_variable, non_constant_identifier_names, deprecated_member_use, avoid_unnecessary_containers, unnecessary_null_comparison

import 'package:flutter/material.dart';

class GoBack {
  static back(ctx) {
    return IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.black),
      onPressed: () => Navigator.of(ctx).pop(),
    );
  }

  static rowOfProject(
      int number, String nameProject, String ownersName, bool Status) {
    double heig = 38;
    return Row(
      children: [
        Expanded(
          child: Center(child: Text('${number == -1 ? "الرقم" : number}')),

          flex: 1,
          // height: heig,
        ),
        Expanded(
          child: Center(child: Text(nameProject)),
          flex: 2,
          // height: heig,
        ),
        Expanded(
          child: Center(child: Text(ownersName)),
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
                style: TextStyle(color: Colors.redAccent),
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
                color: Theme.of(ctx).accentColor,
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

  static Widget tx(String str, {double sizee = 20}) {
    return Center(
        child: Text(
      str,
      style: TextStyle(fontSize: sizee, color: Colors.black87),
    ));
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
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.greenAccent, Colors.indigoAccent.withOpacity(0.1)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: OutlinedButton(
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
        child: tx(title),
      ),
    );
  }
}
