import 'package:flutter/material.dart';
class MyThemeData {
  static const Color primaryColor = Color(0xffB7935F);
  static ThemeData lightTheme = ThemeData(
    textTheme: TextTheme(
      titleMedium: TextStyle(
          fontFamily: 'Amiri',
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold),
      bodySmall: TextStyle(
          fontFamily: 'Amiri',
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w300),
      bodyMedium: TextStyle(
          fontFamily: 'Amiri',
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.w400),
      bodyLarge: TextStyle(
          fontFamily: 'Amiri',
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.w700),
    ),
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: 'Amiri',
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        size: 35,
      ),
      unselectedIconTheme: IconThemeData(
        size: 25,
      ),
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
      backgroundColor: primaryColor,
      elevation: 100,
      type: BottomNavigationBarType.fixed,
    ),
    scaffoldBackgroundColor: Colors.transparent,
  );

  static ThemeData darkTheme = ThemeData();
}