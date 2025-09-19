import 'package:flutter/material.dart';

class MyTheme {
  /// Colors
  static const Color primaryLight =Color(0xFFBF9765);
  static const Color black = Colors.black; 
  static const Color white = Colors.white;
  // static const Color primaryLight =Color(0xFF#400D37);
  // static const Color primaryLight =Color(0xFF#F2B33D);
  // static const Color primaryLight =Color(0xFF#F27C38);
  // static const Color primaryLight =Color(0xFF##F2F2F2);


  ///  Light Mode
  ///  DARK MODE
   static ThemeData lightMode = ThemeData( 
    primaryColor: primaryLight,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: black,
        fontSize: 30,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        color: black,
        fontSize: 25,

      ),
      bodySmall: TextStyle(
        color: black,
        fontSize: 14,
      ),
    ),
   
   bottomNavigationBarTheme: BottomNavigationBarThemeData (
    backgroundColor: primaryLight,
    selectedItemColor: black,
    unselectedItemColor: white,
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,

   )

   ) ;
   static ThemeData darkMode = ThemeData();
} 