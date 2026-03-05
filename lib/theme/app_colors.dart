import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Light mode seed colors
  static const Color lightPrimary = Color(0xFFE07030);
  static const Color lightSecondary = Color(0xFFA05520);
  static const Color lightTertiary = Color(0xFFC03040);

  // Dark mode seed colors
  // Defaults mirror light mode until customized in Colors screen.
  static const Color darkPrimary = lightPrimary;
  static const Color darkSecondary = lightSecondary;
  static const Color darkTertiary = lightTertiary;
}
