// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Utils/path_images.dart';

class BackgrondImage {
  @override
  Widget Decoration(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(PathImages.background),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
