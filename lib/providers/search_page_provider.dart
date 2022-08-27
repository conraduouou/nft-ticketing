import 'package:flutter/material.dart';
import 'package:nft_ticketing/models/core/debouncer.dart';

class SearchPageProvider with ChangeNotifier {
  final _debouncer = Debouncer();
  String _searchQuery = '';
  bool _inAsync = false;

  String get searchQuery => _searchQuery;
  bool get inAsync => _inAsync;

  bool _isDisposed = false;

  void onSearchChanged(String s) async {
    _debouncer.run(() async {
      toggleInAsync();
      _searchQuery = s;

      await Future.delayed(const Duration(seconds: 2)); // remove in prod
      toggleInAsync();
    });
  }

  void toggleInAsync() {
    _inAsync = !_inAsync;
    if (!_isDisposed) notifyListeners();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}
