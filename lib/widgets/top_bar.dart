import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'brightness_toggle.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final accent = cs.tertiary;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          // Logo on the left
          Image.asset('assets/images/logo.png', height: 40),
                              const Spacer(),
          // Brightness toggle
          const BrightnessToggle(),
          // Language flag menu
          IconButton(
            onPressed: () {},
            icon: PhosphorIcon(PhosphorIconsDuotone.flag, color: accent, size: 26),
          ),
          // Hamburger menu
          IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: PhosphorIcon(PhosphorIconsDuotone.list, color: accent, size: 26),
          ),
          // Profile
          IconButton.filled(
            onPressed: () {},
            style: IconButton.styleFrom(backgroundColor: accent),
            icon: PhosphorIcon(PhosphorIconsDuotone.user, color: cs.onTertiary, size: 26),
          ),
        ],
      ),
    );
  }
}