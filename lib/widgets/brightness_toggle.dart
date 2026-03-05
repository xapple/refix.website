import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/theme_mode_provider.dart';

/// Icon button that toggles between light and dark mode.
///
/// On load it follows the system brightness. Tapping switches to the opposite
/// explicit mode. If the system brightness changes, we resync automatically.
class BrightnessToggle extends ConsumerStatefulWidget {
  const BrightnessToggle({super.key});

  @override
  ConsumerState<BrightnessToggle> createState() => _BrightnessToggleState();
}

class _BrightnessToggleState extends ConsumerState<BrightnessToggle> {
  Brightness? _lastPlatformBrightness;

  @override
  Widget build(BuildContext context) {
    final platformBrightness = MediaQuery.platformBrightnessOf(context);

    // Resync to system whenever the platform brightness changes.
    if (_lastPlatformBrightness != null &&
        _lastPlatformBrightness != platformBrightness) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(themeModeProvider.notifier).set(ThemeMode.system);
      });
    }
    _lastPlatformBrightness = platformBrightness;

    // Resolve effective brightness: system mode defers to platform.
    final mode = ref.watch(themeModeProvider);
    final isDark = switch (mode) {
      ThemeMode.dark => true,
      ThemeMode.light => false,
      ThemeMode.system => platformBrightness == Brightness.dark,
    };

    return IconButton(
      icon: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
      tooltip: isDark ? 'Dark mode' : 'Light mode',
      onPressed: () => ref
          .read(themeModeProvider.notifier)
          .set(isDark ? ThemeMode.light : ThemeMode.dark),
    );
  }
}
