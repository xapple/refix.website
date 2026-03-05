import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_color_utilities/material_color_utilities.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../theme/app_theme.dart';
import 'brightness_toggle.dart';
import 'language_picker.dart';
import 'nav_menu.dart';

class TopBar extends ConsumerWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lightTheme = ref.watch(appThemeProvider).light;
    final cs = lightTheme.colorScheme;
    final accent = cs.tertiary;
    final bg = Color(
      TonalPalette.of(
        Hct.fromInt(cs.secondary.toARGB32()).hue,
        Hct.fromInt(cs.secondary.toARGB32()).chroma,
      ).get(95),
    );

    return Theme(
      data: lightTheme,
      child: ColoredBox(
        color: bg,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          child: Row(
            children: [
              // Logo on the left — navigates home
              GestureDetector(
                onTap: () => context.go('/'),
                child: Image.asset('assets/images/logo.png', height: 40),
              ),
              const Spacer(),
              // Brightness toggle
              const BrightnessToggle(size: 30),
              // Language picker
              const LanguagePicker(),
              // Navigation menu
              const NavMenu(),
              const SizedBox(width: 10),
              // Profile
              IconButton.filled(
                onPressed: () {},
                style: IconButton.styleFrom(backgroundColor: accent),
                icon: PhosphorIcon(
                  PhosphorIconsDuotone.user,
                  color: cs.onTertiary,
                  size: 26,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
