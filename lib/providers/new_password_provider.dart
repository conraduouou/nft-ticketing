import 'package:flutter/material.dart';

class NewPasswordProvider with ChangeNotifier {
  final _characters = RegExp(r"(?=.*[a-z])(?=.*[A-Z])\w+");
  final _symbols = RegExp(r"[!\?\-\=\.,@_/]");
  // final _numbers = RegExp(r"[0-9]");

  final List<Requirement> requirements = [
    Requirement(text: 'Password must be at least 8 characters.'),
    Requirement(text: 'A mixture of both uppercase and lowercase letters.'),
    Requirement(text: 'Inclusion of at least one special character.'),
  ];

  String _currentPassword = '';
  String _newPassword = '';
  String _confirmPassword = '';

  String get newPassword => _newPassword;
  String get confirmPassword => _confirmPassword;

  bool get isAllFilled =>
      _newPassword.isNotEmpty && _confirmPassword.isNotEmpty;

  bool get isAllFilledUpdate =>
      _currentPassword.isNotEmpty &&
      _newPassword.isNotEmpty &&
      _confirmPassword.isNotEmpty;

  bool get isAllSatisfied =>
      !requirements.any((e) => !e.isSatisfied) &&
      _newPassword.compareTo(_confirmPassword) == 0;

  void onCurrentChange(String s) {
    _currentPassword = s;
    notifyListeners();
  }

  void onNewChange(String s) {
    _newPassword = s;

    if (_newPassword.length >= 8) {
      requirements[0].isSatisfied = true;
    } else {
      requirements[0].isSatisfied = false;
    }

    if (_characters.hasMatch(_newPassword)) {
      requirements[1].isSatisfied = true;
    } else {
      requirements[1].isSatisfied = false;
    }

    if (_symbols.hasMatch(_newPassword)) {
      requirements[2].isSatisfied = true;
    } else {
      requirements[2].isSatisfied = false;
    }

    notifyListeners();
  }

  void onConfirmChange(String s) {
    _confirmPassword = s;
    notifyListeners();
  }
}

class Requirement {
  Requirement({
    required this.text,
    this.isSatisfied = false,
  });

  String text;
  bool isSatisfied;
}
