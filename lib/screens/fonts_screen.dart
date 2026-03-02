import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../providers/font_providers.dart';
import '../theme/app_fonts.dart';

class FontsScreen extends StatelessWidget {
  const FontsScreen({super.key});

  static const String _sample = 'The quick brown fox jumped over the lazy dog';

  @override
  Widget build(BuildContext context) {
    final tt      = Theme.of(context).textTheme;
    final outline = Theme.of(context).colorScheme.outline;

    final styles = [
      (tt.displayLarge,   'displayLarge'),
      (tt.displayMedium,  'displayMedium'),
      (tt.displaySmall,   'displaySmall'),
      (tt.headlineLarge,  'headlineLarge'),
      (tt.headlineMedium, 'headlineMedium'),
      (tt.headlineSmall,  'headlineSmall'),
      (tt.titleLarge,     'titleLarge'),
      (tt.titleMedium,    'titleMedium'),
      (tt.titleSmall,     'titleSmall'),
      (tt.bodyLarge,      'bodyLarge'),
      (tt.bodyMedium,     'bodyMedium'),
      (tt.bodySmall,      'bodySmall'),
      (tt.labelLarge,     'labelLarge'),
      (tt.labelMedium,    'labelMedium'),
      (tt.labelSmall,     'labelSmall'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Fonts')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
            children: [
              const _FontPickerSection(),
              const SizedBox(height: 48),
              ...styles.map((item) {
                final (style, name) = item;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_sample, style: style),
                      const SizedBox(height: 4),
                      Text(
                        name,
                        style: GoogleFonts.robotoMono(fontSize: 11, color: outline),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class _FontPickerSection extends StatelessWidget {
  const _FontPickerSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Theme Font Families', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _FontPickerCard(
              label:    'Title font',
              fonts:    AppFonts.titleFonts,
              provider: titleFontProvider,
            ),
            _FontPickerCard(
              label:    'Body font',
              fonts:    AppFonts.bodyFonts,
              provider: bodyFontProvider,
            ),
          ],
        ),
      ],
    );
  }
}

class _FontPickerCard extends ConsumerWidget {
  const _FontPickerCard({
    required this.label,
    required this.fonts,
    required this.provider,
  });

  final String             label;
  final List<String>       fonts;
  final StateProvider<String> provider;

  static const String _preview = 'The quick brown fox';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected    = ref.watch(provider);
    final tt          = Theme.of(context).textTheme;
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
          Text(label, style: tt.titleMedium),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: selected,
            isExpanded: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            items: fonts
                .map((f) => DropdownMenuItem(
                      value: f,
                      child: Text(f, style: GoogleFonts.getFont(f)),
                    ))
                .toList(),
            onChanged: (value) {
              if (value != null) ref.read(provider.notifier).state = value;
            },
          ),
          const SizedBox(height: 16),
          Text(
            _preview,
            style: GoogleFonts.getFont(selected, textStyle: tt.headlineSmall),
          ),
        ],
      ),
    );
  }
}
