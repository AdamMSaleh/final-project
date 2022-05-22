// ignore_for_file: prefer_const_constructors, implementation_imports, deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/app_loading.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/enum_loading.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/style.dart';
import 'package:flutter_finalproject/Utils/path_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class AskUs extends StatefulWidget {
  const AskUs({Key? key}) : super(key: key);
  static const String id = 'AskUs';

  @override
  State<AskUs> createState() => _AskUsState();
}

class _AskUsState extends State<AskUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CachedNetworkImage(
                imageUrl: PathImages.logo,
                //لتعديل ع صورة
                imageBuilder: (context, jjjjj) {
                  return CircleAvatar(
                    backgroundImage: jjjjj,
                    radius: 95.r, //لتكبير
                  );
                },
                placeholder: (context, url) =>
                    AppLoading(chooseLoading: ChooseLoading.IMAGE),
                // في حال خطاء بالاتصال بشبكة

                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            //* name
            Text(KeyLang.oneclickhome.tr(),
                style: AppStyles.welcome.copyWith(
                  color: AppColors.white,
                  fontSize: 35.h,
                )),
            SizedBox(
              height: 40,
            ),
            Card(
              elevation: 20,
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: TextButton(
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: AppColors.blue,
                  ),
                  title: Text(
                    'aseteam@relaxbuilding.space',
                    style: AppStyles.styleBodyText1Light
                        .copyWith(color: AppColors.blue, fontSize: 13.h),
                  ),
                ),
                onPressed: _launchURLEmail,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            //طريقه الاسرع
            Card(
              elevation: 20,
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: TextButton(
                onPressed: _launchInWebViewOrVC,
                child: ListTile(
                  leading: Icon(
                    Icons.web,
                    color: AppColors.blue,
                  ),
                  title: Text(
                    'http://www.relaxbuilding.space',
                    style: AppStyles.styleBodyText1Light
                        .copyWith(color: AppColors.blue, fontSize: 13.h),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchInWebViewOrVC() async {
    const url = 'http://relaxbuilding.space/';
    if (!await launch(
      url,
      forceSafariVC: true,
      forceWebView: true,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  _launchURLEmail() async {
    final url = Uri.encodeFull('mailto:aseteam@relaxbuilding.space');
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
