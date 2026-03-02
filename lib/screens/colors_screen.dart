import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';

class ColorsScreen extends StatelessWidget {
  const ColorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final primaryCore = CorePalette.of(AppPrimary.shade600.toARGB32());
    final secondaryCore = CorePalette.of(AppSecondary.shade500.toARGB32());
    final accentCore = CorePalette.of(AppAccent.shade500.toARGB32());

    return Scaffold(
      backgroundColor: AppSecondary.shade50,
      appBar: AppBar(
        title: Text('Color Palette', style: AppFonts.title(fontSize: 28)),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              Text(
                'Your selected scales',
                style: AppFonts.title(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: AppPrimary.shade700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'A visualization of the explicit shades you defined in app_colors.dart.',
                style: AppFonts.body(
                  fontSize: 16,
                  color: AppSecondary.shade700,
                ),
              ),
              const SizedBox(height: 24),
              PaletteStrip(
                label: 'Primary (Indigo)',
                swatches: AppSwatches.primary,
              ),
              const SizedBox(height: 20),
              PaletteStrip(
                label: 'Secondary (Blue Grey)',
                swatches: AppSwatches.secondary,
              ),
              const SizedBox(height: 20),
              PaletteStrip(
                label: 'Accent (Amber)',
                swatches: AppSwatches.accent,
              ),
              const SizedBox(height: 40),
              Text(
                'Generated tonal palettes (0-100)',
                style: AppFonts.title(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: AppPrimary.shade700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'These strips are generated from a single seed using the same Material color utilities behind ColorScheme.fromSeed.',
                style: AppFonts.body(
                  fontSize: 16,
                  color: AppSecondary.shade700,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Seed: Primary (shade600)',
                style: AppFonts.body(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppSecondary.shade800,
                ),
              ),
              const SizedBox(height: 10),
              PaletteStrip(
                label: 'Primary tones',
                swatches: tonalSwatches(primaryCore.primary),
              ),
              const SizedBox(height: 20),
              PaletteStrip(
                label: 'Secondary tones',
                swatches: tonalSwatches(primaryCore.secondary),
              ),
              const SizedBox(height: 20),
              PaletteStrip(
                label: 'Tertiary tones',
                swatches: tonalSwatches(primaryCore.tertiary),
              ),
              const SizedBox(height: 20),
              PaletteStrip(
                label: 'Neutral tones',
                swatches: tonalSwatches(primaryCore.neutral),
              ),
              const SizedBox(height: 20),
              PaletteStrip(
                label: 'Neutral variant tones',
                swatches: tonalSwatches(primaryCore.neutralVariant),
              ),
              const SizedBox(height: 24),
              Text(
                'Alternate seeds',
                style: AppFonts.body(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppSecondary.shade800,
                ),
              ),
              const SizedBox(height: 10),
              PaletteStrip(
                label: 'Secondary seed -> primary tones',
                swatches: tonalSwatches(secondaryCore.primary),
              ),
              const SizedBox(height: 20),
              PaletteStrip(
                label: 'Accent seed -> primary tones',
                swatches: tonalSwatches(accentCore.primary),
              ),
              const SizedBox(height: 40),
              Text(
                'Material ColorScheme roles',
                style: AppFonts.title(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: AppPrimary.shade700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'These are the role colors currently active in ThemeData.colorScheme.',
                style: AppFonts.body(
                  fontSize: 16,
                  color: AppSecondary.shade700,
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
                  RoleChip(name: 'onPrimary', color: colorScheme.onPrimary),
                  RoleChip(name: 'onSecondary', color: colorScheme.onSecondary),
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

class AppSwatches {
  AppSwatches._();

  static const primary = <SwatchItem>[
    SwatchItem(50, AppPrimary.shade50),
    SwatchItem(100, AppPrimary.shade100),
    SwatchItem(200, AppPrimary.shade200),
    SwatchItem(300, AppPrimary.shade300),
    SwatchItem(400, AppPrimary.shade400),
    SwatchItem(500, AppPrimary.shade500),
    SwatchItem(600, AppPrimary.shade600),
    SwatchItem(700, AppPrimary.shade700),
    SwatchItem(800, AppPrimary.shade800),
    SwatchItem(900, AppPrimary.shade900),
  ];

  static const secondary = <SwatchItem>[
    SwatchItem(50, AppSecondary.shade50),
    SwatchItem(100, AppSecondary.shade100),
    SwatchItem(200, AppSecondary.shade200),
    SwatchItem(300, AppSecondary.shade300),
    SwatchItem(400, AppSecondary.shade400),
    SwatchItem(500, AppSecondary.shade500),
    SwatchItem(600, AppSecondary.shade600),
    SwatchItem(700, AppSecondary.shade700),
    SwatchItem(800, AppSecondary.shade800),
    SwatchItem(900, AppSecondary.shade900),
  ];

  static const accent = <SwatchItem>[
    SwatchItem(50, AppAccent.shade50),
    SwatchItem(100, AppAccent.shade100),
    SwatchItem(200, AppAccent.shade200),
    SwatchItem(300, AppAccent.shade300),
    SwatchItem(400, AppAccent.shade400),
    SwatchItem(500, AppAccent.shade500),
    SwatchItem(600, AppAccent.shade600),
    SwatchItem(700, AppAccent.shade700),
    SwatchItem(800, AppAccent.shade800),
    SwatchItem(900, AppAccent.shade900),
  ];
}

class PaletteStrip extends StatelessWidget {
  const PaletteStrip({super.key, required this.label, required this.swatches});

  final String label;
  final List<SwatchItem> swatches;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppFonts.body(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppSecondary.shade800,
          ),
        ),
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

class SwatchCard extends StatelessWidget {
  const SwatchCard({super.key, required this.item});

  final SwatchItem item;

  @override
  Widget build(BuildContext context) {
    final textColor = item.color.computeLuminance() > 0.5
        ? Colors.black
        : Colors.white;
    final borderColor = item.color.computeLuminance() > 0.92
        ? AppSecondary.shade300
        : item.color;

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
            style: AppFonts.body(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            item.hex,
            style: AppFonts.body(
              fontSize: 12,
              fontWeight: FontWeight.w600,
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
    final borderColor = color.computeLuminance() > 0.92
        ? AppSecondary.shade300
        : color;

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
          Text(
            name,
            style: AppFonts.body(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: foreground,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            _hex(color),
            style: AppFonts.body(
              fontSize: 12,
              fontWeight: FontWeight.w600,
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
