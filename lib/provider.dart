import 'package:flutter/material.dart';

class TextProvider extends ChangeNotifier {
  String _text1 = "Soy _text1";
  String _text2 = "Soy _text2";

  String get text1 => _text1;
  String get text2 => _text2;

  (String text1, String text2) setTexts({
    required String value1,
    required String value2,
  }) {
    _text1 = value1;
    _text2 = value2;
    notifyListeners();
    return (text1, text2);
  }
}
