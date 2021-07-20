import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static final _storage = FlutterSecureStorage();

  static Future userSignUp(String username, String password) async {
    await _storage.write(key: username, value: password);
  }

  static Future<String?> login(String username) async {
    return await _storage.read(key: username);
  }
}
