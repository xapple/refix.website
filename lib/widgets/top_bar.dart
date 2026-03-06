import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../theme/app_color_tokens.dart';
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
    final tokens = lightTheme.extension<AppColorTokens>()!;

    return Theme(
      data: lightTheme,
      child: ColoredBox(
        color: tokens.topBarBackground,
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
              Stack(
                clipBehavior: Clip.none,
                children: [
                  const LanguagePicker(),
                  Positioned(
                    right: 3,
                    bottom: 9,
                    child: IgnorePointer(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 1,
                        ),
                        decoration: BoxDecoration(
                          color: cs.surface,
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(color: cs.outlineVariant),
                        ),
                        child: Text(
                          'EN',
                          style: TextStyle(
                            color: tokens.interactiveAccent,
                            fontSize: 8,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.2,
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Navigation menu
              const NavMenu(),
              const SizedBox(width: 10),
              // Profile
              IconButton.filled(
                onPressed: () => context.go('/profile'),
                style: IconButton.styleFrom(
                  backgroundColor: tokens.interactiveAccent,
                ),
                icon: PhosphorIcon(
                  PhosphorIconsDuotone.user,
                  color: tokens.onInteractiveAccent,
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
