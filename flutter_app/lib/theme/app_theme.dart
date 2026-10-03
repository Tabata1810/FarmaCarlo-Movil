// Archivo: lib/theme/app_theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  // Primitivos Cromáticos
  static const Color azulElegante = Color(0xFF1A374D);
  static const Color doradoEspejo = Color(0xFFD4AF37);
  static const Color celesteBebe   = Color(0xFFB1D0E0);
  static const Color beigeSuave    = Color(0xFFF5F2E7);
  static const Color rojoError     = Color(0xFFFF6B6B);

  // Tokens Dimensionales (Espaciados, Radios y Accesibilidad)
  static const double radiusSm = 12.0;
  static const double radiusMd = 20.0;
  static const double radiusPill = 50.0;

  static const double paddingSm = 8.0;
  static const double paddingMd = 16.0;
  static const double paddingLg = 24.0;

  // Norma WCAG 2.2 AA / Android / iOS: Área táctil mínima
  static const double minTouchTarget = 48.0;

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