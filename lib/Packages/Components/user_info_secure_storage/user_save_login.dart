// ignore_for_file: non_constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _preferences;
  static const String _keyUsername = 'username';
  static const String _keyUserId = 'UserId';
  static const String _keyPassword = 'password';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

// set Username
  static Future setUsername(String username) async =>
      await _preferences.setString(_keyUsername, username);
// get Username
  static String? getUsername() => _preferences.getString(_keyUsername);

  //***********************************************************************//

 // set UserId
  static Future setUserId(String UserId) async =>
      await _preferences.setString(_keyUserId, UserId);
// get UserId
  static String? getUserId() => _preferences.getString(_keyUserId);

  //************************************************************************//

// set Password
  static Future setPassword(String Password) async =>
      await _preferences.setString(_keyPassword, Password);
// get Password
  static String? getPassword() => _preferences.getString(_keyPassword);

//**************************************************************************//

  static Future removePassword() async =>
      await _preferences.remove(_keyPassword);
  static Future removeUsername() async =>
      await _preferences.remove(_keyUsername);
  static Future removeUserId() async =>
      await _preferences.remove(_keyUserId);
}


// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//
// class UserSecureStorage {
//   static const _storage = FlutterSecureStorage();
//   static const _keyUsername = 'username';
//   static const _keyPassword ='password';
//
//   AndroidOptions _getAndroidOptions() => const AndroidOptions(
//     encryptedSharedPreferences: true,
//   );
//
//   static Future setUsername(String username) async =>
//       await _storage.write(key: _keyUsername, value: username, );
//
//    static Future<String?> getUsername() async {
//      return await _storage.read(key: _keyUsername,);
//
//      // return x;
//    }
//
//    /*
//    if (UserSecureStorage().getUsername().toString()=="Instance of 'Future<String?>'") {
//       print('get Name');
//       print(UserSecureStorage().getUsername().toString()+'4');
//     }else{
//       print('sssssset Name');
//     }
//     */
//
//
//   /*
//     await _storage.read(key: _keyUsername).then((prefs) {
//       _prefs = prefs;
//       //return null;
//       return null as String;
//       }).catchError((vError) {
//       return "Unable to load categories";
//       });
//    */
//   static Future setPassword(String password) async =>
//       await _storage.write(key: _keyPassword, value: password, );
//
//   static Future<String?> getPassword() async =>
//       await _storage.read(key: _keyPassword, );
//
//
//   static Future logout() async =>
//       await _storage.deleteAll( );
//
//
//
// }
