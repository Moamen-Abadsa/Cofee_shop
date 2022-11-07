

import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{
String languageCode = 'en';
void changeLanguage({required String languageCode}){
  this.languageCode = languageCode;
  notifyListeners();
}
}