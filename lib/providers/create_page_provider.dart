import 'package:flutter/material.dart';

class CreatePageProvider with ChangeNotifier {
  String _name = '';
  String _email = '';
  String _mobile = '';

  bool _isAgreed = false;

  String get name => _name;
  String get email => _email;
  String get mobile => _mobile;

  bool get isAgreed => _isAgreed;

  bool get isAllFilled =>
      _name.isNotEmpty && _email.isNotEmpty && _mobile.isNotEmpty;

  void toggleAgreed() {
    _isAgreed = !_isAgreed;
    notifyListeners();
  }

  void onNameChange(String s) {
    _name = s;
    notifyListeners();
  }

  void onEmailChange(String s) {
    _email = s;
    notifyListeners();
  }

  void onMobileChange(String s) {
    _mobile = s;
    notifyListeners();
  }
}
