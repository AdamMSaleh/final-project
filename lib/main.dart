// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Language/config/config_lang.dart';
import 'package:flutter_finalproject/Packages/Pages/Home/View/body.dart';
import 'package:flutter_finalproject/Packages/Pages/Splash/View/body.dart';

import 'package:flutter_finalproject/Routers/app_routers.dart';
import 'package:flutter_finalproject/Theme/custom_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyDynamicThemeWidget(
    child: EasyLocalization(
      child: MyApp(),
      supportedLocales: [ConfigLanguage.AR_LOCALE, ConfigLanguage.EN_LOCALE],
      path: ConfigLanguage.LANG_PATH,
      fallbackLocale: ConfigLanguage.EN_LOCALE,
    ),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () {
        return MaterialApp(
            title: 'one Click Home',
            debugShowCheckedModeBanner: false,
            theme: CustomTheme.lightTheme,
            darkTheme: CustomTheme.darkTheme,
            themeMode: EasyDynamicTheme.of(context).themeMode,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            initialRoute: PageSplash.id, //PageHome.id,
            routes: AppRoutes.routes);
      },
    );
  }
}
