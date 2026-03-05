import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/app_colors.dart';
import 'simple_notifier.dart';

final lightPrimaryColorProvider =
    NotifierProvider<SimpleNotifier<Color>, Color>(
      () => SimpleNotifier(AppColors.lightPrimary),
    );
final lightSecondaryColorProvider =
    NotifierProvider<SimpleNotifier<Color>, Color>(
      () => SimpleNotifier(AppColors.lightSecondary),
    );
final lightTertiaryColorProvider =
    NotifierProvider<SimpleNotifier<Color>, Color>(
      () => SimpleNotifier(AppColors.lightTertiary),
    );

final darkPrimaryColorProvider = NotifierProvider<SimpleNotifier<Color>, Color>(
  () => SimpleNotifier(AppColors.darkPrimary),
);
final darkSecondaryColorProvider =
    NotifierProvider<SimpleNotifier<Color>, Color>(
      () => SimpleNotifier(AppColors.darkSecondary),
    );
final darkTertiaryColorProvider =
    NotifierProvider<SimpleNotifier<Color>, Color>(
      () => SimpleNotifier(AppColors.darkTertiary),
    );

// Backward-compatible aliases for existing code paths.
final primaryColorProvider = lightPrimaryColorProvider;
final secondaryColorProvider = lightSecondaryColorProvider;
final tertiaryColorProvider = lightTertiaryColorProvider;
