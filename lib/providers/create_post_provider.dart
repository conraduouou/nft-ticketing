import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostProvider with ChangeNotifier {
  File? _image;
  File? _video;
  String _text = '';

  File? get image => _image;
  File? get video => _video;
  String get text => _text;

  void getPhotoFromGallery() async {
    try {
      final gotImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (gotImage == null) return;
      _image = File(gotImage.path);

      notifyListeners();
    } on PlatformException {
      return;
    }
  }

  void removePhoto() {
    _image = null;
    notifyListeners();
  }

  void onTextChanged(String s) {
    _text = s;
    notifyListeners();
  }
}
