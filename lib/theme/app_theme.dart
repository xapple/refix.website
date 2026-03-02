import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppPrimary.shade600,
          primary: AppPrimary.shade600,
          primaryContainer: AppPrimary.shade100,
          secondary: AppSecondary.shade500,
          secondaryContainer: AppSecondary.shade100,
          tertiary: AppAccent.shade500,
          tertiaryContainer: AppAccent.shade100,
          surface: AppSecondary.shade50,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          brightness: Brightness.light,
        ),
        textTheme: AppFonts.textTheme,
        appBarTheme: AppBarTheme(
          backgroundColor: AppPrimary.shade600,
          foregroundColor: Colors.white,
          titleTextStyle: AppFonts.title(fontSize: 20, color: Colors.white),
          elevation: 0,
        ),
      );
}
