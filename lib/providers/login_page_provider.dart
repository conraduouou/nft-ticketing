import 'package:flutter/material.dart';

class LoginPageProvider with ChangeNotifier {
  String _email = '';
  String _password = '';

  String get email => _email;
  String get password => _password;

  bool get isAllFilled => _email.contains('@') && _password.isNotEmpty;

  void onEmailChange(String s) {
    _email = s;
    notifyListeners();
  }

  void onPasswordChange(String s) {
    _password = s;
    notifyListeners();
  }
}
