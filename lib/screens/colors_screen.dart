import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

import '../theme/app_theme.dart';

class ColorsScreen extends StatelessWidget {
  const ColorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final primaryCore = CorePalette.of(AppTheme.primarySeed.toARGB32());
    final secondaryCore = CorePalette.of(AppTheme.secondarySeed.toARGB32());
    final tertiaryCore = CorePalette.of(AppTheme.tertiarySeed.toARGB32());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Palette'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1400),
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              Text(
                'Theme Seed Colors',
                style: textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'The app theme uses three configurable seeds: primary, secondary, and tertiary.',
                style: textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  const SeedChip(name: 'Primary', color: AppTheme.primarySeed),
                  const SeedChip(
                    name: 'Secondary',
                    color: AppTheme.secondarySeed,
                  ),
                  const SeedChip(
                    name: 'Tertiary',
                    color: AppTheme.tertiarySeed,
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Text(
                'Generated Tonal Palettes (0-100)',
                style: textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                'These are generated from your three theme seeds.',
                style: textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              PaletteStrip(
                label: 'Primary seed tones',
                swatches: tonalSwatches(primaryCore.primary),
              ),
              const SizedBox(height: 20),
              PaletteStrip(
                label: 'Secondary seed tones',
                swatches: tonalSwatches(secondaryCore.primary),
              ),
              const SizedBox(height: 20),
              PaletteStrip(
                label: 'Tertiary seed tones',
                swatches: tonalSwatches(tertiaryCore.primary),
              ),
              const SizedBox(height: 20),
              Text(
                'Active Theme ColorScheme Roles',
                style: textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                'These are the colors currently exposed by ThemeData.colorScheme.',
                style: textTheme.bodyLarge,
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
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: textTheme.titleMedium),
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