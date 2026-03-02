import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

/// Central font definitions for the app.
///
/// Title font : Playfair Display — elegant serif, used for headings.
/// Body font  : Lato            — clean sans-serif, used for body text and UI.
class AppFonts {
  AppFonts._();

  /// Returns a [TextStyle] using the title font (Playfair Display).
  static TextStyle title({
    double? fontSize,
    FontWeight fontWeight = FontWeight.w700,
    Color? color,
  }) =>
      GoogleFonts.playfairDisplay(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      );

  /// Returns a [TextStyle] using the body font (Lato).
  static TextStyle body({
    double? fontSize,
    FontWeight fontWeight = FontWeight.w400,
    Color? color,
  }) =>
      GoogleFonts.lato(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      );

  /// A [TextTheme] wired up for Material 3, mixing both fonts.
  static TextTheme get textTheme => TextTheme(
        // Display / headline — serif
        displayLarge:  GoogleFonts.playfairDisplay(fontWeight: FontWeight.w700),
        displayMedium: GoogleFonts.playfairDisplay(fontWeight: FontWeight.w700),
        displaySmall:  GoogleFonts.playfairDisplay(fontWeight: FontWeight.w700),
        headlineLarge: GoogleFonts.playfairDisplay(fontWeight: FontWeight.w700),
        headlineMedium: GoogleFonts.playfairDisplay(fontWeight: FontWeight.w600),
        headlineSmall:  GoogleFonts.playfairDisplay(fontWeight: FontWeight.w600),
        titleLarge:   GoogleFonts.playfairDisplay(fontWeight: FontWeight.w600),
        titleMedium:  GoogleFonts.playfairDisplay(fontWeight: FontWeight.w500),
        titleSmall:   GoogleFonts.playfairDisplay(fontWeight: FontWeight.w500),
        // Body / label — sans-serif
        bodyLarge:    GoogleFonts.lato(fontWeight: FontWeight.w400),
        bodyMedium:   GoogleFonts.lato(fontWeight: FontWeight.w400),
        bodySmall:    GoogleFonts.lato(fontWeight: FontWeight.w400),
        labelLarge:   GoogleFonts.lato(fontWeight: FontWeight.w600),
        labelMedium:  GoogleFonts.lato(fontWeight: FontWeight.w500),
        labelSmall:   GoogleFonts.lato(fontWeight: FontWeight.w500),
      );
}
