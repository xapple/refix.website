import 'package:flutter/material.dart';
import 'app_fonts.dart';

class AppTheme {
  AppTheme._();

  static const Color primarySeed = Color(0xFF2F4F73);
  static const Color secondarySeed = Color(0xFF6B7785);
  static const Color tertiarySeed = Color(0xFF9B6F4A);

  static ColorScheme _buildScheme(Brightness brightness) {
    final primary = ColorScheme.fromSeed(
      seedColor: primarySeed,
      brightness: brightness,
    );
    final secondary = ColorScheme.fromSeed(
      seedColor: secondarySeed,
      brightness: brightness,
    );
    final tertiary = ColorScheme.fromSeed(
      seedColor: tertiarySeed,
      brightness: brightness,
    );

    return primary.copyWith(
      secondary: secondary.primary,
      onSecondary: secondary.onPrimary,
      secondaryContainer: secondary.primaryContainer,
      onSecondaryContainer: secondary.onPrimaryContainer,
      tertiary: tertiary.primary,
      onTertiary: tertiary.onPrimary,
      tertiaryContainer: tertiary.primaryContainer,
      onTertiaryContainer: tertiary.onPrimaryContainer,
    );
  }

  static ThemeData light() => ThemeData(
    useMaterial3: true,
    colorScheme: _buildScheme(Brightness.light),
    textTheme: AppFonts.textTheme,
  );

  static ThemeData dark() => ThemeData(
    useMaterial3: true,
    colorScheme: _buildScheme(Brightness.dark),
    textTheme: AppFonts.textTheme,
  );
}
