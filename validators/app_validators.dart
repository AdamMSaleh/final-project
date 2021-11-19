// ignore_for_file: unnecessary_string_interpolations, unused_field

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:validators/validators.dart' as validators;

class AppValidators {
  // * message
  static final _messageEnterValue = '${KeyLang.enterValue.tr()}';
  static final _messageEnterEmail = '${KeyLang.enterEmail.tr()}';
  static final _messageEnterpass = '${KeyLang.enterPass.tr()}';
  static final _messageCorrectEmail = '${KeyLang.errorEmail.tr()}';
  static final _messageCorrectPass = '${KeyLang.errorPass.tr()}';
  static final _messageCorrectCPass = '${KeyLang.errorConfirmPass.tr()}';
  static final _messageCorrectPhoneNumber = '${KeyLang.errorPhoneNumber.tr()}';
  static final __messageCorrectname = '${KeyLang.errorName.tr()}';
  static final __messageengNumber = '${KeyLang.messageengNumber.tr()}';

  // * email
  static String? isEmail(String? value) {
    if (value?.isEmpty ?? true) {
      return _messageEnterEmail;
    } else if (!validators.isEmail(value!)) {
      return _messageCorrectEmail;
    }
    return null;
  }

  // * pass
  static String? isPass(String? value) {
    if (value?.isEmpty ?? true) {
      return _messageEnterpass;
    } else if (!validators.isLength(value!, 8)) {
      return _messageCorrectPass;
    }
    return null;
  }

  // * equal pass
  static String? isEqualPass(String? value, String pass) {
    if (value?.isEmpty ?? true) {
      return _messageEnterpass;
    } else if (!validators.equals(value, pass)) {
      return _messageCorrectCPass;
    }
    return null;
  }

  // * enter value
  static String? isEmpty(String? value) {
    if (value?.isEmpty ?? true) {
      return _messageEnterValue;
    }
    return null;
  }

  // * phone number
  static String? isPhoneNumber(String? value) {
    if (value?.isEmpty ?? true) {
      return _messageEnterValue;
    } else if (!validators.isLength(value!.trim(), 10, 10)) {
      return _messageCorrectPhoneNumber;
    }
    return null;
  }

  //* Name
  static String? isname(String? value) {
    if (value?.isEmpty ?? true) {
      return _messageEnterValue;
    } else if (!validators.isAlpha(value!)) {
      return __messageCorrectname;
    }
    return null;
  }

  //* eng number
  static String? engnumber(String? value) {
    if (value?.isEmpty ?? true) {
      return _messageEnterValue;
    } else if (!validators.isLength(value!.trim(), 6, 6)) {
      return __messageCorrectname;
    }
    return null;
  }
}
