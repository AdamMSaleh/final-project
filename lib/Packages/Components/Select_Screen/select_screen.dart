import 'package:flutter/material.dart';

class SelSc{

  selectScreen(BuildContext context, Widget page) {
Navigator.of(context).push(MaterialPageRoute(builder: (_ /*context*/) {
return page;
}));
}}