import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'brightness_toggle.dart';
import 'language_picker.dart';
import 'nav_menu.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final logoAsset = isDarkMode
        ? 'assets/images/logo_dark.png'
        : 'assets/images/logo.png';
    const logoFrameWidth = 140.0;
    const logoFrameHeight = 40.0;

    return ColoredBox(
      color: cs.surfaceContainerLow,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        child: Row(
          children: [
            // Logo on the left — navigates home
            GestureDetector(
              onTap: () => context.go('/'),
              child: SizedBox(
                width: logoFrameWidth,
                height: logoFrameHeight,
                child: Image.asset(
                  logoAsset,
                  fit: BoxFit.cover,
                  alignment: Alignment.centerLeft,
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.cover,
                    alignment: Alignment.centerLeft,
                  ),
                ),
              ),
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
                          color: cs.primary,
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
              style: IconButton.styleFrom(backgroundColor: cs.primary),
              icon: PhosphorIcon(
                PhosphorIconsDuotone.user,
                color: cs.onPrimary,
                size: 26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
