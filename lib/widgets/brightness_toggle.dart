import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../providers/theme_mode_provider.dart';

/// Icon button that toggles between light and dark mode.
///
/// On load it follows the system brightness. Tapping switches to the opposite
/// explicit mode. If the system brightness changes, we resync automatically.
class BrightnessToggle extends ConsumerStatefulWidget {
  const BrightnessToggle({super.key, this.size = 26});

  final double size;

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

    final colorScheme = Theme.of(context).colorScheme;
    final accent = Color.lerp(colorScheme.primary, colorScheme.secondary, 0.5)!;

    return IconButton(
      icon: PhosphorIcon(
        isDark ? PhosphorIconsBold.moon : PhosphorIconsBold.sun,
        color: accent,
        size: widget.size,
      ),
      tooltip: isDark ? 'Dark mode' : 'Light mode',
      onPressed: () => ref
          .read(themeModeProvider.notifier)
          .set(isDark ? ThemeMode.light : ThemeMode.dark),
    );
  }
}
