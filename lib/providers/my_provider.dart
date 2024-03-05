import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String languageCode = "en";
  ThemeMode themeMode = ThemeMode.light;

  void changeLanguage(String langCode) {
    languageCode = langCode;
    notifyListeners();
  }

  void changeTheme(ThemeMode mode) {
    themeMode = mode;
    notifyListeners();
  }

  String getBackgroundPath() {
    if (themeMode == ThemeMode.light) {
      return "assets/images/default_bg.png";
    } else {
      return "assets/images/dark_bg.png";
    }
  }

  String NameTheme() {
    if (themeMode == ThemeMode.light) {
      return "Light";
    } else {
      return "Dark";
    }
  }

  String NameLanguage() {
    if (languageCode == "ar") {
      return "العربية";
    } else {
      return "English";
    }
  }
}
