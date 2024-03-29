// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, duplicate_ignore, implementation_imports, unused_element, unused_field, avoid_print

import 'dart:io';

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/theme_status.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class AlertChooseImage extends StatefulWidget {
  const AlertChooseImage({Key? key}) : super(key: key);

  @override
  State<AlertChooseImage> createState() => _AlertChooseImageState();
}

class _AlertChooseImageState extends State<AlertChooseImage> {
  final _picker = ImagePicker();
  File? _image;

  Future<File?> _getImage({bool isCamera = false}) async {
    try {
      final _pickedImage = await _picker.pickImage(
          source: isCamera ? ImageSource.camera : ImageSource.gallery);

      if (_pickedImage != null) {
        return File(_pickedImage.path);
      } else {
        throw Exception('not show image');
      }
    } catch (e) {
      print('error : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: 50.w,
        height: 100.h,
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            //*camera
            Expanded(
              child: ListTile(
                title: Text(KeyLang.camerae).tr(),
                leading: FaIcon(
                  FontAwesomeIcons.camera,
                  color: AppColors.blue,
                ),
                onTap: () async {
                  await _getImage(isCamera: true);
                  Navigator.pop(context);
                },
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(KeyLang.gallery.tr()),
                leading: FaIcon(
                  FontAwesomeIcons.fileImage,
                  color: AppColors.blue,
                ),
                onTap: () async {
                  await _getImage();
                  Navigator.pop(context);
                },
              ),
            ),
            /* Expanded(
              child: ListTile(
                title: Text(KeyLang.camerae).tr(),
                leading: FaIcon(
                  FontAwesomeIcons.camera,
                  color: AppColors.blue,
                ),
                onTap: () {},
              ),
            ),*/
          ],
        ),
      ),
      actions: [
        OutlinedButton(
          onPressed: () => Navigator.pop(context),
          style: OutlinedButton.styleFrom(
            primary: AppTheme.getTheme(context: context)
                ? Colors.white
                : AppColors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.sp),
            ),
          ),
          child: Text(KeyLang.cancel).tr(),
        )
      ],
    );
  }
}
