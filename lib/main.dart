import 'package:iphone16_wrapper/iphone16_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/theme_mode_provider.dart';
import 'theme/app_theme.dart';
import 'router/app_router.dart';

void main() {
  runApp(const ProviderScope(child: RefixDemoShell()));
}

class RefixDemoShell extends ConsumerWidget {
  const RefixDemoShell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themes = ref.watch(appThemeProvider);
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      title: 'Refix',
      debugShowCheckedModeBanner: false,
      theme: themes.light,
      darkTheme: themes.dark,
      themeMode: themeMode,
      routerConfig: appRouter,
      builder: (context, child) {
        return IPhone16Wrapper(
          urlBar: 'refix.website',
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}
