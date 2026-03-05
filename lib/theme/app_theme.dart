import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_color_tokens.dart';
import 'app_fonts.dart';
import '../providers/color_providers.dart';
import '../providers/font_providers.dart';

/// Derived provider — watches all theme state and returns both ThemeData variants.
final appThemeProvider = Provider<({ThemeData light, ThemeData dark})>((ref) {
  final lightPrimary = ref.watch(lightPrimaryColorProvider);
  final lightSecondary = ref.watch(lightSecondaryColorProvider);
  final lightTertiary = ref.watch(lightTertiaryColorProvider);
  final darkPrimary = ref.watch(darkPrimaryColorProvider);
  final darkSecondary = ref.watch(darkSecondaryColorProvider);
  final darkTertiary = ref.watch(darkTertiaryColorProvider);
  final titleFont = ref.watch(titleFontProvider);
  final bodyFont = ref.watch(bodyFontProvider);

  return (
    light: _build(
      Brightness.light,
      lightPrimary,
      lightSecondary,
      lightTertiary,
      titleFont,
      bodyFont,
    ),
    dark: _build(
      Brightness.dark,
      darkPrimary,
      darkSecondary,
      darkTertiary,
      titleFont,
      bodyFont,
    ),
  );
});

ThemeData _build(
  Brightness brightness,
  Color primary,
  Color secondary,
  Color tertiary,
  String titleFont,
  String bodyFont,
) {
  final primaryScheme = ColorScheme.fromSeed(
    seedColor: primary,
    brightness: brightness,
  );
  final secondaryScheme = ColorScheme.fromSeed(
    seedColor: secondary,
    brightness: brightness,
  );
  final tertiaryScheme = ColorScheme.fromSeed(
    seedColor: tertiary,
    brightness: brightness,
  );

  final colorScheme = primaryScheme.copyWith(
    secondary: secondaryScheme.primary,
    onSecondary: secondaryScheme.onPrimary,
    secondaryContainer: secondaryScheme.primaryContainer,
    onSecondaryContainer: secondaryScheme.onPrimaryContainer,
    tertiary: tertiaryScheme.primary,
    onTertiary: tertiaryScheme.onPrimary,
    tertiaryContainer: tertiaryScheme.primaryContainer,
    onTertiaryContainer: tertiaryScheme.onPrimaryContainer,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    textTheme: AppFonts.buildTextTheme(brightness, titleFont, bodyFont),
    extensions: <ThemeExtension<dynamic>>[
      AppColorTokens.fromColorScheme(colorScheme),
    ],
  );
}
