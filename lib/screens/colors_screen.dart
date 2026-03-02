import 'package:flutter/material.dart';
import 'package:web_color_picker/web_color_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

import '../providers/color_providers.dart';

class ColorsScreen extends ConsumerWidget {
  const ColorsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final primary = ref.watch(primaryColorProvider);
    final secondary = ref.watch(secondaryColorProvider);
    final tertiary = ref.watch(tertiaryColorProvider);

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final primaryPalette = SchemeTonalSpot(
      sourceColorHct: Hct.fromInt(primary.toARGB32()),
      isDark: false,
      contrastLevel: 0,
    ).primaryPalette;
    final secondaryPalette = SchemeTonalSpot(
      sourceColorHct: Hct.fromInt(secondary.toARGB32()),
      isDark: false,
      contrastLevel: 0,
    ).primaryPalette;
    final tertiaryPalette = SchemeTonalSpot(
      sourceColorHct: Hct.fromInt(tertiary.toARGB32()),
      isDark: false,
      contrastLevel: 0,
    ).primaryPalette;

    return Scaffold(
      appBar: AppBar(title: const Text('Color Palette')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1400),
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              Text('Seed Colors', style: textTheme.headlineMedium),
              const SizedBox(height: 16),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _ColorPickerCard(
                    label: 'Primary',
                    color: primary,
                    onChanged: (c) =>
                        ref.read(primaryColorProvider.notifier).set(c),
                  ),
                  _ColorPickerCard(
                    label: 'Secondary',
                    color: secondary,
                    onChanged: (c) =>
                        ref.read(secondaryColorProvider.notifier).set(c),
                  ),
                  _ColorPickerCard(
                    label: 'Tertiary',
                    color: tertiary,
                    onChanged: (c) =>
                        ref.read(tertiaryColorProvider.notifier).set(c),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Text(
                'Generated Tonal Palettes (0–100)',
                style: textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                'Generated from your three seed colors.',
                style: textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              _PaletteStrip(
                label: 'Primary',
                swatches: _swatches(primaryPalette),
              ),
              const SizedBox(height: 20),
              _PaletteStrip(
                label: 'Secondary',
                swatches: _swatches(secondaryPalette),
              ),
              const SizedBox(height: 20),
              _PaletteStrip(
                label: 'Tertiary',
                swatches: _swatches(tertiaryPalette),
              ),
              const SizedBox(height: 40),
              Text('Active ColorScheme Roles', style: textTheme.headlineSmall),
              const SizedBox(height: 8),
              Text(
                'Colors currently exposed by ThemeData.colorScheme.',
                style: textTheme.bodyLarge,
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _RoleChip(name: 'primary', color: colorScheme.primary),
                  _RoleChip(
                    name: 'primaryContainer',
                    color: colorScheme.primaryContainer,
                  ),
                  _RoleChip(name: 'secondary', color: colorScheme.secondary),
                  _RoleChip(
                    name: 'secondaryContainer',
                    color: colorScheme.secondaryContainer,
                  ),
                  _RoleChip(name: 'tertiary', color: colorScheme.tertiary),
                  _RoleChip(
                    name: 'tertiaryContainer',
                    color: colorScheme.tertiaryContainer,
                  ),
                  _RoleChip(name: 'surface', color: colorScheme.surface),
                  _RoleChip(name: 'outline', color: colorScheme.outline),
                  _RoleChip(name: 'error', color: colorScheme.error),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Color picker card ────────────────────────────────────────────────────────

class _ColorPickerCard extends StatelessWidget {
  const _ColorPickerCard({
    required this.label,
    required this.color,
    required this.onChanged,
  });

  final String label;
  final Color color;
  final ValueChanged<Color> onChanged;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: 200,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WebColorPicker.builder(
            initialColor: color,
            builder: (context, selectedColor) =>
                Container(height: 100, color: selectedColor),
            onInput: (c, _) => onChanged(c),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: tt.titleSmall),
                const SizedBox(height: 4),
                Text(
                  _hex(color),
                  style: GoogleFonts.robotoMono(
                    fontSize: 12,
                    color: colorScheme.outline,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Supporting widgets ───────────────────────────────────────────────────────

List<_SwatchItem> _swatches(TonalPalette palette) => [
  for (final tone in TonalPalette.commonTones)
    _SwatchItem(tone, Color(palette.get(tone))),
];

class _PaletteStrip extends StatelessWidget {
  const _PaletteStrip({required this.label, required this.swatches});

  final String label;
  final List<_SwatchItem> swatches;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (final s in swatches)
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: _SwatchCard(item: s),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SwatchCard extends StatelessWidget {
  const _SwatchCard({required this.item});

  final _SwatchItem item;

  @override
  Widget build(BuildContext context) {
    final textColor = item.color.computeLuminance() > 0.5
        ? Colors.black
        : Colors.white;
    final textTheme = Theme.of(context).textTheme;
    final border = item.color.computeLuminance() > 0.92
        ? Colors.black12
        : item.color.withValues(alpha: 0.7);

    return Container(
      width: 110,
      height: 120,
      decoration: BoxDecoration(
        color: item.color,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: border),
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

class _RoleChip extends StatelessWidget {
  const _RoleChip({required this.name, required this.color});

  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final fg = color.computeLuminance() > 0.5 ? Colors.black : Colors.white;
    final border = color.computeLuminance() > 0.92
        ? Colors.black12
        : color.withValues(alpha: 0.7);
    final tt = Theme.of(context).textTheme;

    return Container(
      width: 180,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: tt.labelLarge?.copyWith(color: fg)),
          const SizedBox(height: 4),
          Text(
            _hex(color),
            style: tt.labelSmall?.copyWith(color: fg.withValues(alpha: 0.9)),
          ),
        ],
      ),
    );
  }
}

class _SwatchItem {
  const _SwatchItem(this.tone, this.color);

  final int tone;
  final Color color;

  String get hex => _hex(color);
}

String _hex(Color color) =>
    '#${color.toARGB32().toRadixString(16).substring(2).toUpperCase()}';
