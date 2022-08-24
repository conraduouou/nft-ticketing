import 'package:flutter/material.dart';

class EnterCodeProvider with ChangeNotifier {
  final List<String> _code = ['', '', '', ''];

  String get code => _code.fold<String>('', (prev, current) => prev + current);

  void onCodeChange(int index, String s) {
    _code[index] = s;
    notifyListeners();
  }
}
