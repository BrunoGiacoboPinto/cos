import 'package:flutter/foundation.dart';

sealed class LoginScreenState {}

class LoginScreenInitial extends LoginScreenState {}

class LoginScreenLoading extends LoginScreenState {}

class LoginScreenError extends LoginScreenState {
  LoginScreenError(this.message);

  final String message;
}

class LoginScreenSuccess extends LoginScreenState {}

class LoginViewModel extends ChangeNotifier {
  LoginScreenState _state = LoginScreenInitial();
  LoginScreenState get state => _state;

  Future<void> login({required String email, required String password}) async {}
}
