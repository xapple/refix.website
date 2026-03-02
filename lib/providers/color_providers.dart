import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/app_colors.dart';
import 'simple_notifier.dart';

final primaryColorProvider = NotifierProvider<SimpleNotifier<Color>, Color>(
  () => SimpleNotifier(AppColors.defaultPrimary),
);
final secondaryColorProvider = NotifierProvider<SimpleNotifier<Color>, Color>(
  () => SimpleNotifier(AppColors.defaultSecondary),
);
final tertiaryColorProvider = NotifierProvider<SimpleNotifier<Color>, Color>(
  () => SimpleNotifier(AppColors.defaultTertiary),
);
