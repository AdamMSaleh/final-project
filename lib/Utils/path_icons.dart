// ignore_for_file: prefer_const_constructors, prefer_const_declarations

import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PathIcons {
  static final FaIcon eyeIcon = FaIcon(
    FontAwesomeIcons.eye,
    color: AppColors.blue,
  );

  static final FaIcon eyeSlashIcon = FaIcon(
    FontAwesomeIcons.eyeSlash,
    color: AppColors.blue,
  );

  static final FaIcon emailIcon = FaIcon(
    FontAwesomeIcons.envelope,
    color: AppColors.blue,
  );

  static final FaIcon passIcon = FaIcon(
    FontAwesomeIcons.userLock,
    color: AppColors.blue,
  );

  static final FaIcon userIcon = FaIcon(
    FontAwesomeIcons.user,
    color: AppColors.blue,
  );

  static final FaIcon facebookMessenger =
      FaIcon(FontAwesomeIcons.facebookMessenger);

  static final FaIcon phoneNumber = FaIcon(
    FontAwesomeIcons.phoneAlt,
    color: AppColors.blue,
  );
  static final FaIcon errorInitFirebase = FaIcon(
    FontAwesomeIcons.exclamationCircle,
    color: AppColors.blue,
  );
  static final FaIcon camera = FaIcon(
    FontAwesomeIcons.camera,
    color: AppColors.blue,
  );
  static final FaIcon gallery = FaIcon(
    FontAwesomeIcons.fileImage,
    color: AppColors.blue,
  );
  static final FaIcon trash = FaIcon(
    FontAwesomeIcons.trash,
    color: AppColors.blue,
  );

  static const String iconShare = 'assets/icons/share.svg';
  static const String iconHeartUnActive = 'assets/icons/unactive-heart.svg';
  static const String iconHeartActive = 'assets/icons/active-heart.svg';
  static const String iconStoriesUnActive = 'assets/icons/unactive-stories.svg';
  static const String iconStoriesActive = 'assets/icons/active-stories.svg';
  static const String iconAddPostUnActive = 'assets/icons/unactive-add.svg';
  static const String iconAddPostActive = 'assets/icons/active-add.svg';
  static const String iconPostUnActive = 'assets/icons/unactive-post.svg';
  static const String iconPostActive = 'assets/icons/active-post.svg';

  static const String iconMenu = 'assets/icons/menu.svg';
  static const String iconCamera = 'assets/icons/camera.svg';
  static const String setting = 'assets/icons/settings.svg';
  static final String language = 'assets/icons/language.svg';
  static final String theme = 'assets/icons/paint.svg';
  static final String logout = 'assets/icons/logout.svg';
  static final String portfolio = 'assets/icons/portfolio.svg';
}
