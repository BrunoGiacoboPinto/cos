import 'package:cos/data/repositories/login/login_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

sealed class LoginScreenState {}

class LoginScreenInitial extends LoginScreenState {}

class LoginScreenLoading extends LoginScreenState {}

class LoginScreenError extends LoginScreenState {
  LoginScreenError(this.message);

  final String message;
}

class LoginScreenSuccess extends LoginScreenState {}

class LoginViewModel extends ChangeNotifier {
  LoginViewModel({required LoginRepository loginRepository}) : _loginRepository = loginRepository;

  static final _logger = Logger('LoginViewModel');
  final LoginRepository _loginRepository;

  LoginScreenState _state = LoginScreenInitial();
  LoginScreenState get state => _state;

  Future<void> login({required String email, required String password}) async {
    _state = LoginScreenLoading();
    notifyListeners();

    try {
      await _loginRepository.login(email: email, password: password);
      _state = LoginScreenSuccess();
    } catch (error, stackTrace) {
      _logger.severe('Login failed', error, stackTrace);
      _state = LoginScreenError(error.toString());
    }

    notifyListeners();
  }
}
