import 'package:flutter/material.dart';

class ForgotPageProvider with ChangeNotifier {
  String _email = '';

  String get email => _email;

  void onEmailChange(String s) {
    _email = s;
    notifyListeners();
  }
}
