import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../providers/font_providers.dart';
import '../theme/app_fonts.dart';
import '../widgets/app_drawer.dart';
import '../widgets/top_bar.dart';

class FontsScreen extends StatelessWidget {
  const FontsScreen({super.key});

  static const String _sample = 'The quick brown fox jumped over the lazy dog';

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final outline = Theme.of(context).colorScheme.outline;

    final styles = [
      (tt.displayLarge, 'displayLarge'),
      (tt.displayMedium, 'displayMedium'),
      (tt.displaySmall, 'displaySmall'),
      (tt.headlineLarge, 'headlineLarge'),
      (tt.headlineMedium, 'headlineMedium'),
      (tt.headlineSmall, 'headlineSmall'),
      (tt.titleLarge, 'titleLarge'),
      (tt.titleMedium, 'titleMedium'),
      (tt.titleSmall, 'titleSmall'),
      (tt.bodyLarge, 'bodyLarge'),
      (tt.bodyMedium, 'bodyMedium'),
      (tt.bodySmall, 'bodySmall'),
      (tt.labelLarge, 'labelLarge'),
      (tt.labelMedium, 'labelMedium'),
      (tt.labelSmall, 'labelSmall'),
    ];

    return Scaffold(
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: ListView(
              padding: const EdgeInsets.only(bottom: 40),
              children: [
                const TopBar(),
                const Padding(
                  padding: EdgeInsets.fromLTRB(32, 40, 32, 0),
                  child: _FontPickerSection(),
                ),
                const SizedBox(height: 48),
                ...styles.map((item) {
                  final (style, name) = item;
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                    ).copyWith(bottom: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_sample, style: style),
                        const SizedBox(height: 4),
                        Text(
                          name,
                          style: GoogleFonts.robotoMono(
                            fontSize: 11,
                            color: outline,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ── Font picker section ──────────────────────────────────────────────────────

class _FontPickerSection extends ConsumerWidget {
  const _FontPickerSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Theme Font Families',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _FontPickerCard(
              label: 'Title font',
              fonts: AppFonts.titleFonts,
              selected: ref.watch(titleFontProvider),
              onChanged: (f) => ref.read(titleFontProvider.notifier).set(f),
            ),
            _FontPickerCard(
              label: 'Body font',
              fonts: AppFonts.bodyFonts,
              selected: ref.watch(bodyFontProvider),
              onChanged: (f) => ref.read(bodyFontProvider.notifier).set(f),
            ),
          ],
        ),
      ],
    );
  }
}

class _FontPickerCard extends StatelessWidget {
  const _FontPickerCard({
    required this.label,
    required this.fonts,
    required this.selected,
    required this.onChanged,
  });

  final String label;
  final List<String> fonts;
  final String selected;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: 340,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: tt.bodyLarge),
          const SizedBox(height: 12),
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: colorScheme.outline),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: DropdownButton<String>(
                value: selected,
                isExpanded: true,
                underline: const SizedBox(),
                items: fonts
                    .map(
                      (f) => DropdownMenuItem(
                        value: f,
                        child: Text(f, style: GoogleFonts.getFont(f)),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value != null) onChanged(value);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
