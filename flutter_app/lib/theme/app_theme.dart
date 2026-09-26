import 'package:flutter/material.dart';

class AppTheme {
  // Tokens de color WCAG 2.2 AA
  static const Color azulElegante = Color(0xFF1A374D); // Primary
  static const Color doradoEspejo  = Color(0xFFD4AF37); // Secondary
  static const Color celesteBebe   = Color(0xFFB1D0E0); // Container
  static const Color beigeSuave    = Color(0xFFF5F2E7); // Background
  static const Color rojoError     = Color(0xFFFF6B6B); // Error

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: azulElegante,
        onPrimary: Colors.white,
        secondary: doradoEspejo,
        onSecondary: Colors.black,
        error: rojoError,
        onError: Colors.white,
        background: beigeSuave,
        onBackground: azulElegante,
        surface: Colors.white,
        onSurface: azulElegante,
      ),
      fontFamily: 'Quicksand',
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontFamily: 'Playfair Display',
          fontWeight: FontWeight.bold,
          color: azulElegante,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Quicksand',
          fontSize: 16.0,
          color: azulElegante,
        ),
      ),
    );
  }
}