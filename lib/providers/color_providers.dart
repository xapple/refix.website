import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/app_colors.dart';

final primaryColorProvider   = StateProvider<Color>((ref) => AppColors.defaultPrimary);
final secondaryColorProvider = StateProvider<Color>((ref) => AppColors.defaultSecondary);
final tertiaryColorProvider  = StateProvider<Color>((ref) => AppColors.defaultTertiary);
