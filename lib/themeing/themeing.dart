import 'package:flutter/material.dart';

//I've not customized the default light and dark theme.
class ThemeManger with ChangeNotifier {
  ThemeData _themeMode = ThemeData.light();

  get themeMode => _themeMode;

  void toggle(bool isDark) {
    _themeMode = isDark ? ThemeData.light() : ThemeData.dark();
  }
}
