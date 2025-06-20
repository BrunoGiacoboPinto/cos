import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class LoginService {
  LoginService({@visibleForTesting SharedPreferencesAsync? sharedPreferences}) : _sharedPreferences = sharedPreferences ?? SharedPreferencesAsync();
  late final SharedPreferencesAsync _sharedPreferences;
  static const _kUserLoginKey = 'user_login';

  Future<void> saveUserLogin(String email) async {
    await _sharedPreferences.setString(_kUserLoginKey, email);
  }

  Future<String?> getUserLogin() async {
    return _sharedPreferences.getString(_kUserLoginKey);
  }
}
