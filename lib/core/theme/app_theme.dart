import "package:flutter/material.dart";

final ThemeData kLightThemeMode = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Color(0xFFF3F3F9),
  appBarTheme: AppBarTheme(elevation: 0, backgroundColor: Colors.transparent),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Color(0xFF1E1E1E),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blueAccent,
      foregroundColor: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(16),
      ),
      shadowColor: Colors.blueAccent.withOpacity(0.2),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    ),
  ),
);

final ThemeData kDarkThemeMode = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Color(0xFF121212),
  appBarTheme: AppBarTheme(elevation: 0, backgroundColor: Colors.transparent),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blueAccent,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(16),
      ),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    ),
  ),
);
