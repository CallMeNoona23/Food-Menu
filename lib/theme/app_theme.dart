import 'package:flutter/material.dart';

class AppTheme {
  // Custom Color Palettes
  static const Color primaryLight = Color(0xFFE53935); // Crimson Red
  static const Color secondaryLight = Color(0xFFFF8F00); // Amber Orange
  static const Color backgroundLight = Color(0xFFF8F9FA);
  static const Color surfaceLight = Color(0xFFFFFFFF);

  static const Color primaryDark = Color(0xFFFF7043); // Warm Coral Orange
  static const Color secondaryDark = Color(0xFFFFB300); // Bright Amber
  static const Color backgroundDark = Color(0xFF121212);
  static const Color surfaceDark = Color(0xFF1E1E1E);

  // Custom Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: primaryLight,
      colorScheme: const ColorScheme.light(
        primary: primaryLight,
        secondary: secondaryLight,
        surface: surfaceLight,
        background: backgroundLight,
        onPrimary: Colors.white,
        onSurface: Color(0xFF212121),
      ),
      scaffoldBackgroundColor: backgroundLight,
      fontFamily: 'Roboto',
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryLight,
        foregroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 22,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.8,
          color: Colors.white,
        ),
      ),
      cardTheme: CardTheme(
        color: surfaceLight,
        elevation: 3,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Color(0xFF212121),
        ),
        titleLarge: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Color(0xFF212121),
          letterSpacing: 0.4,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Color(0xFF424242),
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 13,
          fontWeight: FontWeight.normal,
          color: Color(0xFF616161),
        ),
        labelLarge: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: primaryLight,
        ),
      ),
      iconTheme: const IconThemeData(
        color: primaryLight,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: Colors.grey.shade200,
        selectedColor: const Color(0x33E53935),
        labelStyle: const TextStyle(fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  // Custom Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: primaryDark,
      colorScheme: const ColorScheme.dark(
        primary: primaryDark,
        secondary: secondaryDark,
        surface: surfaceDark,
        background: backgroundDark,
        onPrimary: Colors.white,
        onSurface: Color(0xFFE0E0E0),
      ),
      scaffoldBackgroundColor: backgroundDark,
      fontFamily: 'Roboto',
      appBarTheme: const AppBarTheme(
        backgroundColor: surfaceDark,
        foregroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 22,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.8,
          color: Colors.white,
        ),
      ),
      cardTheme: CardTheme(
        color: const Color(0xFF2A2A2A),
        elevation: 4,
        shadowColor: Colors.black54,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Color(0xFFF5F5F5),
        ),
        titleLarge: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Color(0xFFF5F5F5),
          letterSpacing: 0.4,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Color(0xFFE0E0E0),
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 13,
          fontWeight: FontWeight.normal,
          color: Color(0xFFB0B0B0),
        ),
        labelLarge: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: primaryDark,
        ),
      ),
      iconTheme: const IconThemeData(
        color: primaryDark,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: const Color(0xFF2E2E2E),
        selectedColor: const Color(0x4DFF7043),
        labelStyle: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
