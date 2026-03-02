import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      appBar: AppBar(title: const Text('Fonts')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
            itemCount: styles.length,
            separatorBuilder: (context, index) => const SizedBox(height: 32),
            itemBuilder: (context, i) {
              final (style, name) = styles[i];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_sample, style: style),
                  const SizedBox(height: 4),
                  Text(
                    name,
                    style: GoogleFonts.robotoMono(fontSize: 11, color: outline),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
