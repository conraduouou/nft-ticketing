import 'package:flutter/material.dart';

class CreatePageProvider with ChangeNotifier {
  String name = '';
  String email = '';
  String mobile = '';

  bool get isAllFilled =>
      name.isNotEmpty && email.isNotEmpty && mobile.isNotEmpty;

  void onNameChange(String s) {
    name = s;
    notifyListeners();
  }

  void onEmailChange(String s) {
    email = s;
    notifyListeners();
  }

  void onMobileChange(String s) {
    mobile = s;
    notifyListeners();
  }
}
