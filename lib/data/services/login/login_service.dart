
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  static const _kUserLoginKey = 'user_login';
  late final _sharedPreferences = SharedPreferencesAsync();

  Future<void> saveUserLogin(String email) async {
    await _sharedPreferences.setString(_kUserLoginKey, email);
  }

  Future<String?> getUserLogin() async {
    return _sharedPreferences.getString(_kUserLoginKey);
  }
}