import 'package:flutter/material.dart';

class MyThemeData {
  static final lightTheme = ThemeData(
      primarySwatch: Colors.green,
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: TextTheme(
          headline3: TextStyle(color: Colors.white, fontSize: 26),
          headline4: TextStyle(color: Colors.white, fontSize: 22),
          headline5: TextStyle(color: Colors.black, fontSize: 18)));
}
