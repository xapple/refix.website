import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

import '../theme/app_theme.dart';

class ColorsScreen extends StatelessWidget {
  const ColorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final corePalette = CorePalette.of(AppTheme.seedColor.toARGB32());

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text('Color Palette', style: textTheme.headlineSmall),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              Text(
                'Seed Color',
                style: textTheme.headlineMedium?.copyWith(
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'The app theme is generated from one seed color using Material 3.',
                style: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.8),
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  const SeedChip(name: 'App Seed', color: AppTheme.seedColor),
                ],
              ),
              const SizedBox(height: 40),
              Text(
                'Generated Tonal Palettes (0-100)',
                style: textTheme.headlineSmall?.copyWith(
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'These are the generated Material tonal palettes from the app seed.',
                style: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.8),
                ),
              ),
              const SizedBox(height: 24),
              PaletteStrip(
                label: 'Primary tones',
                swatches: tonalSwatches(corePalette.primary),
              ),
              const SizedBox(height: 20),
              PaletteStrip(
                label: 'Secondary tones',
                swatches: tonalSwatches(corePalette.secondary),
              ),
              const SizedBox(height: 20),
              PaletteStrip(
                label: 'Tertiary tones',
                swatches: tonalSwatches(corePalette.tertiary),
              ),
              const SizedBox(height: 20),
              PaletteStrip(
                label: 'Neutral tones',
                swatches: tonalSwatches(corePalette.neutral),
              ),
              const SizedBox(height: 20),
              PaletteStrip(
                label: 'Neutral variant tones',
                swatches: tonalSwatches(corePalette.neutralVariant),
              ),
              const SizedBox(height: 20),
              Text(
                'Active Theme ColorScheme Roles',
                style: textTheme.headlineSmall?.copyWith(
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'These are the colors currently exposed by ThemeData.colorScheme.',
                style: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.8),
                ),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  RoleChip(name: 'primary', color: colorScheme.primary),
                  RoleChip(
                    name: 'primaryContainer',
                    color: colorScheme.primaryContainer,
                  ),
                  RoleChip(name: 'secondary', color: colorScheme.secondary),
                  RoleChip(
                    name: 'secondaryContainer',
                    color: colorScheme.secondaryContainer,
                  ),
                  RoleChip(name: 'tertiary', color: colorScheme.tertiary),
                  RoleChip(
                    name: 'tertiaryContainer',
                    color: colorScheme.tertiaryContainer,
                  ),
                  RoleChip(name: 'surface', color: colorScheme.surface),
                  RoleChip(name: 'outline', color: colorScheme.outline),
                  RoleChip(name: 'error', color: colorScheme.error),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<SwatchItem> tonalSwatches(TonalPalette palette) {
  return [
    for (final tone in TonalPalette.commonTones)
      SwatchItem(tone, Color(palette.get(tone))),
  ];
}

class PaletteStrip extends StatelessWidget {
  const PaletteStrip({super.key, required this.label, required this.swatches});

  final String label;
  final List<SwatchItem> swatches;

  @override
  Widget build(BuildContext context) {
    final onSurface = Theme.of(context).colorScheme.onSurface;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: textTheme.titleMedium?.copyWith(color: onSurface)),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (final swatch in swatches)
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SwatchCard(item: swatch),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class SeedChip extends StatelessWidget {
  const SeedChip({super.key, required this.name, required this.color});

  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final foreground = color.computeLuminance() > 0.5
        ? Colors.black
        : Colors.white;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: 170,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: textTheme.labelLarge?.copyWith(color: foreground)),
          const SizedBox(height: 4),
          Text(
            _hex(color),
            style: textTheme.labelSmall?.copyWith(
              color: foreground.withValues(alpha: 0.9),
            ),
          ),
        ],
      ),
    );
  }
}

class SwatchCard extends StatelessWidget {
  const SwatchCard({super.key, required this.item});

  final SwatchItem item;

  @override
  Widget build(BuildContext context) {
    final textColor = item.color.computeLuminance() > 0.5
        ? Colors.black
        : Colors.white;
    final textTheme = Theme.of(context).textTheme;
    final borderColor = item.color.computeLuminance() > 0.92
        ? Colors.black12
        : item.color.withValues(alpha: 0.7);

    return Container(
      width: 110,
      height: 120,
      decoration: BoxDecoration(
        color: item.color,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '${item.tone}',
            style: textTheme.titleMedium?.copyWith(color: textColor),
          ),
          const SizedBox(height: 2),
          Text(
            item.hex,
            style: textTheme.labelSmall?.copyWith(
              color: textColor.withValues(alpha: 0.9),
            ),
          ),
        ],
      ),
    );
  }
}

class RoleChip extends StatelessWidget {
  const RoleChip({super.key, required this.name, required this.color});

  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final foreground = color.computeLuminance() > 0.5
        ? Colors.black
        : Colors.white;
    final textTheme = Theme.of(context).textTheme;
    final borderColor = color.computeLuminance() > 0.92
        ? Colors.black12
        : color.withValues(alpha: 0.7);

    return Container(
      width: 180,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: textTheme.labelLarge?.copyWith(color: foreground)),
          const SizedBox(height: 4),
          Text(
            _hex(color),
            style: textTheme.labelSmall?.copyWith(
              color: foreground.withValues(alpha: 0.9),
            ),
          ),
        ],
      ),
    );
  }
}

class SwatchItem {
  const SwatchItem(this.tone, this.color);

  final int tone;
  final Color color;

  String get hex => _hex(color);
}

String _hex(Color color) =>
    '#${color.toARGB32().toRadixString(16).substring(2).toUpperCase()}';
