import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{
  String languageCode = "en";
  ThemeMode themeMode= ThemeMode.light;
  void changeLanguage(String langCode){
    languageCode = langCode;
    notifyListeners();
  }

  void changeTheme(ThemeMode mode){
    themeMode = mode;
    notifyListeners();
  }

}