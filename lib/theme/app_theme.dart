import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_color_tokens.dart';
import 'app_fonts.dart';
import '../providers/color_providers.dart';
import '../providers/font_providers.dart';

/// Derived provider — watches all theme state and returns both ThemeData variants.
final appThemeProvider = Provider<({ThemeData light, ThemeData dark})>((ref) {
  final primary = ref.watch(primaryColorProvider);
  final secondary = ref.watch(secondaryColorProvider);
  final tertiary = ref.watch(tertiaryColorProvider);
  final titleFont = ref.watch(titleFontProvider);
  final bodyFont = ref.watch(bodyFontProvider);

  return (
    light: _build(
      Brightness.light,
      primary,
      secondary,
      tertiary,
      titleFont,
      bodyFont,
    ),
    dark: _build(
      Brightness.dark,
      primary,
      secondary,
      tertiary,
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
