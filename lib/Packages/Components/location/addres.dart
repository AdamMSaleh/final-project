// ignore_for_file: implementation_imports, unused_import, unused_local_variable

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/text_filed/simple_filed.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/validators/app_validators.dart';
//import 'package:geolocator/geolocator.dart';

class Address extends StatelessWidget {
  const Address({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleFiled(
      keyboardType: TextInputType.name,
      onValidator: (value) => AppValidators.isEmpty(value),
      hint: KeyLang.address.tr(),
      pIcon: IconButton(
        icon: Icon(
          Icons.add_location_alt_rounded,
          color: AppColors.blue,
        ),
        onPressed: () {
          /* Position position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high);
          print(position);*/
        },
      ),
    );
  }
}
