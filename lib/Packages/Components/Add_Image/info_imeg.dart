// ignore_for_file: prefer_const_constructors, annotate_overrides, must_call_super, avoid_print, duplicate_ignore

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Packages/Components/Add_Image/alert_choose.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/app_loading.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/enum_loading.dart';
import 'package:flutter_finalproject/Packages/Components/upload_image_php/img_upload.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Utils/path_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoImageState extends StatefulWidget {
  const InfoImageState({Key? key}) : super(key: key);

  @override
  State<InfoImageState> createState() => InfoImage();
}

class InfoImage extends State<InfoImageState> {
  @override
  // ignore: must_call_super
  void initState() {
    Upload_ImageState.profileImage;
    setState(() {
      Upload_ImageState.profileImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.h),
      // * background
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.blue,
      ),
      child: Stack(
        children: [
          // * image
          Container(
            height: 100.w,
            width: 100.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 3,
                color: Colors.white,
              ),
              // image: DecorationImage(
              //   image: AssetImage(PathImages.infoimage),
              //   fit: BoxFit.fill,
              // ),
            ),
            child:
                // Upload_ImageState.profileImage==''?Image.asset(PathImages.infoimage):
                CachedNetworkImage(
              imageUrl: Upload_ImageState.profileImage,
              //لتعديل ع صورة
              imageBuilder: (context, jjjjj) {
                return CircleAvatar(
                  backgroundImage: jjjjj,
                  radius: 100.r, //للتكبير
                );
              },
              placeholder: (context, url) =>
                  AppLoading(chooseLoading: ChooseLoading.IMAGE),
              // في حال خطاء بالاتصال بشبكة

              errorWidget: (context, url, error) =>
                  Image.asset(PathImages.infoimage),
            ),
          ),
          // Add Image Icon
          Positioned(
            bottom: 1,
            right: 6,
            child: Container(
              width: 25.w,
              height: 25.w,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                alignment: Alignment.center,
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) => AlertChooseImage(),
                  );
                  print(Upload_ImageState.profileImage);
                },
                icon: Icon(
                  Icons.add,
                  color: AppColors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
