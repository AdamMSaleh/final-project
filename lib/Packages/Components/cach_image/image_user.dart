// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/app_loading.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/enum_loading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageUser extends StatelessWidget {
  ImageUser(
      {required String image,
      required double radius,
      required double sizeLoading})
      : _image = image,
        _sizeLoading = sizeLoading,
        _radius = radius;
  final String _image;
  final double _radius;
  final double _sizeLoading;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: _image,
      imageBuilder: (context, imageProvider) {
        return CircleAvatar(
          radius: _radius.r,
          backgroundImage: imageProvider,
        );
      },
      placeholder: (context, url) => AppLoading(
        chooseLoading: ChooseLoading.PROFILE,
        size: _sizeLoading.sp,
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
