import 'package:flutter/material.dart';

class MyTheme {
  /// Colors
  static const Color primaryLight =Color(0xFFBF9765);
  static const Color black = Colors.black; 
  static const Color white = Colors.white;
    static const Color primaryDark =Color(0xFF141A2E);

  static const Color yellowColor =Color.fromARGB(255, 240, 195, 15);
  // static const Color primaryLight =Color(0xFF#F2B33D);
  // static const Color primaryLight =Color(0xFF#F27C38);
  // static const Color primaryLight =Color(0xFF##F2F2F2);


  ///  Light Mode
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

  /// Dark Mode
      static ThemeData darkMode = ThemeData( 
    primaryColor: primaryDark,
    scaffoldBackgroundColor: Colors.transparent,

    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white)
    ),

    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: white,
        fontSize: 30,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        color: white,
        fontSize: 25,

      ),
      bodySmall: TextStyle(
        color: white,
        fontSize: 14,
      ),
    ),
   
   bottomNavigationBarTheme: BottomNavigationBarThemeData (
    backgroundColor: primaryDark,
    selectedItemColor: yellowColor,
    unselectedItemColor: white,
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,

   )

   ) ;

} 