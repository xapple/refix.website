import 'package:flutter/material.dart';

/// Deep blue / indigo — primary brand color scale (50–900).
/// Based on a rich indigo that reads as trustworthy and modern.
class AppPrimary {
  AppPrimary._();

  static const shade50  = Color(0xFFEEF2FF);
  static const shade100 = Color(0xFFE0E7FF);
  static const shade200 = Color(0xFFC7D2FE);
  static const shade300 = Color(0xFFA5B4FC);
  static const shade400 = Color(0xFF818CF8);
  static const shade500 = Color(0xFF6366F1); // base
  static const shade600 = Color(0xFF4F46E5);
  static const shade700 = Color(0xFF4338CA);
  static const shade800 = Color(0xFF3730A3);
  static const shade900 = Color(0xFF312E81);

  /// The default swatch used in ThemeData.
  static const MaterialColor swatch = MaterialColor(0xFF4F46E5, {
    50:  shade50,
    100: shade100,
    200: shade200,
    300: shade300,
    400: shade400,
    500: shade500,
    600: shade600,
    700: shade700,
    800: shade800,
    900: shade900,
  });
}

/// Blue-grey — secondary / neutral scale (50–900).
class AppSecondary {
  AppSecondary._();

  static const shade50  = Color(0xFFF8FAFC);
  static const shade100 = Color(0xFFF1F5F9);
  static const shade200 = Color(0xFFE2E8F0);
  static const shade300 = Color(0xFFCBD5E1);
  static const shade400 = Color(0xFF94A3B8);
  static const shade500 = Color(0xFF64748B); // base
  static const shade600 = Color(0xFF475569);
  static const shade700 = Color(0xFF334155);
  static const shade800 = Color(0xFF1E293B);
  static const shade900 = Color(0xFF0F172A);
}

/// Warm amber / gold — accent scale (50–900).
/// Provides a warm contrast to the cool indigo primary.
class AppAccent {
  AppAccent._();

  static const shade50  = Color(0xFFFFFBEB);
  static const shade100 = Color(0xFFFEF3C7);
  static const shade200 = Color(0xFFFDE68A);
  static const shade300 = Color(0xFFFCD34D);
  static const shade400 = Color(0xFFFBBF24);
  static const shade500 = Color(0xFFF59E0B); // base
  static const shade600 = Color(0xFFD97706);
  static const shade700 = Color(0xFFB45309);
  static const shade800 = Color(0xFF92400E);
  static const shade900 = Color(0xFF78350F);
}
