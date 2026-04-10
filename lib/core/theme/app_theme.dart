import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color surface = Color(0xFFF9F9FF);
  static const Color surfaceContainerLow = Color(0xFFF1F3FF);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color onSurface = Color(0xFF141B2B);
  static const Color onSurfaceVariant = Color(0xFF3E4947);
  static const Color primary = Color(0xFF005C55);
  static const Color primaryContainer = Color(0xFF0F766E);

  static final signatureGradient = LinearGradient(
    colors: [primary, primaryContainer],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static ThemeData lightTheme() {
    final baseTheme = ThemeData(brightness: Brightness.light);
    final textTheme = GoogleFonts.manropeTextTheme(baseTheme.textTheme);

    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        brightness: Brightness.light,
        primary: primary,
        onPrimary: Colors.white,
        primaryContainer: primaryContainer,
        onPrimaryContainer: Colors.white,
        surface: surface,
        onSurface: onSurface,
        onSurfaceVariant: onSurfaceVariant,
        surfaceContainerLow: surfaceContainerLow,
        surfaceContainerLowest: surfaceContainerLowest,
        outlineVariant: Color(0x26000000), // 15% opacity ghost border
        error: Colors.redAccent,
        onError: Colors.white,
      ),
      textTheme: textTheme.copyWith(
        displayLarge: GoogleFonts.manrope(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.64, // -0.02em
          color: onSurface,
        ),
        bodyLarge: GoogleFonts.manrope(
          fontSize: 16,
          height: 1.6,
          color: onSurface,
        ),
        labelMedium: GoogleFonts.manrope(fontSize: 12, color: onSurfaceVariant),
      ),
      cardTheme: CardThemeData(
        color: surfaceContainerLowest,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        ),
      ),
    );
  }
}
