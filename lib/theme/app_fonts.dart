import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

/// App typography: one title font + one body font.
class AppFonts {
  AppFonts._();

  static const String titleFont = 'Averia Serif Libre';
  static const String bodyFont = 'Barlow';

  static TextTheme get textTheme {
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
