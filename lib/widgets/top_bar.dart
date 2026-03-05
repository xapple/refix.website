import 'package:flutter/material.dart';

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
          Padding(
            padding: const EdgeInsets.all(8),
            child: Material(
              color: accent,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () => Scaffold.of(context).openDrawer(),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Icon(Icons.menu, color: cs.onTertiary, size: 26),
                ),
              ),
            ),
          ),
          const Spacer(),
          Image.asset('assets/images/logo.png', height: 40),
          const Spacer(),
          const BrightnessToggle(),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Material(
              color: accent,
              shape: const CircleBorder(),
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(Icons.person, color: cs.onTertiary, size: 26),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
