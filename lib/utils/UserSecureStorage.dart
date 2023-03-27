import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static final storageSecure = new FlutterSecureStorage();

  static const jwtKey = 'token';
  static const refreshToken = 'refreshToken';
  static const userEmail = 'email';
  static const userName = 'userName';

  static Future setJwtKey(String jwtKeyValue) async =>
      await storageSecure.write(key: jwtKey, value: jwtKeyValue);

  static Future getJwtKey() async => await storageSecure.read(key: jwtKey);

  static Future setRefreshToken(String refreshTokenValue) async =>
      await storageSecure.write(key: refreshToken, value: refreshTokenValue);

  static Future getRefreshToken() async =>
      await storageSecure.read(key: refreshToken);

  static Future setEmail(String emailValue) async =>
      await storageSecure.write(key: userEmail, value: emailValue);

  static Future<String?> getEmail() async {
    return await storageSecure.read(key: userEmail);
  }

  static Future setUserName(String userNameValue) async =>
      await storageSecure.write(key: userName, value: userNameValue);

  static Future getUserName() async =>
      await storageSecure.read(key: userName);



}
