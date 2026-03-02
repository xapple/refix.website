import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class AppFonts {
  AppFonts._();

  static const String defaultTitleFont = 'Averia Serif Libre';
  static const String defaultBodyFont  = 'Barlow';

  static const List<String> titleFonts = [
    'Averia Serif Libre',
    'Playfair Display',
    'Cormorant Garamond',
    'EB Garamond',
    'Merriweather',
    'Lora',
  ];

  static const List<String> bodyFonts = [
    'Barlow',
    'Lato',
    'Inter',
    'Roboto',
    'Open Sans',
    'Nunito',
  ];

  static TextTheme buildTextTheme(String titleFont, String bodyFont) {
    final base = ThemeData.light().textTheme;

    TextStyle? titleStyle(TextStyle? style) =>
        GoogleFonts.getFont(titleFont, textStyle: style);
    TextStyle? bodyStyle(TextStyle? style) =>
        GoogleFonts.getFont(bodyFont, textStyle: style);

    return base.copyWith(
      displayLarge:   titleStyle(base.displayLarge),
      displayMedium:  titleStyle(base.displayMedium),
      displaySmall:   titleStyle(base.displaySmall),
      headlineLarge:  titleStyle(base.headlineLarge),
      headlineMedium: titleStyle(base.headlineMedium),
      headlineSmall:  titleStyle(base.headlineSmall),
      titleLarge:     titleStyle(base.titleLarge),
      titleMedium:    titleStyle(base.titleMedium),
      titleSmall:     titleStyle(base.titleSmall),
      bodyLarge:      bodyStyle(base.bodyLarge),
      bodyMedium:     bodyStyle(base.bodyMedium),
      bodySmall:      bodyStyle(base.bodySmall),
      labelLarge:     bodyStyle(base.labelLarge),
      labelMedium:    bodyStyle(base.labelMedium),
      labelSmall:     bodyStyle(base.labelSmall),
    );
  }
}
