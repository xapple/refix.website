import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('refix', style: text.displayMedium),
            const SizedBox(height: 8),
            Text('find what fits', style: text.bodyLarge),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () => context.go('/colors'),
              child: const Text('View Color Palette'),
            ),
          ],
        ),
      ),
    );
  }
}
