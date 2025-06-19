import 'package:cos/data/services/login/login_service.dart';

class LoginRepository {
  LoginRepository({required LoginService loginService}) : _loginService = loginService;

  final LoginService _loginService;

  Future<bool> hasLoggedInAtLeastOnce() async {
    final userLogin = await _loginService.getUserLogin();
    return userLogin != null && userLogin.isNotEmpty;
  }

  Future<bool> login({required String email, required String password}) async {
    final hasNeverLoggedIn = await _loginService.getUserLogin() == null;

    if (hasNeverLoggedIn) {
      await _loginService.saveUserLogin(email);
    }

    return true;
  }
}
