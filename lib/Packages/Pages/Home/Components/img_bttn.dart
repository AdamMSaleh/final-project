// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BtnImg extends StatelessWidget {
  const BtnImg({Key? key}) : super(key: key);
  static void onLoading(BuildContext context){
    /****************************************************/
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              CircularProgressIndicator(),
              SizedBox(
                width: 20,
              ),
              Text("Loading"),
            ],
          ),
        );
      },
    );
/****************************************************/
  }
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {},
            child: Image(
              image: AssetImage('assets/icons/Project-icon (1).png'),
            ),
          ),
        ],
      ),
      radius: 50.r,
    );
  }
}
