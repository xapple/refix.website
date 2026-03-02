import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'theme/app_theme.dart';
import 'router/app_router.dart';

void main() {
  runApp(const ProviderScope(child: RefixApp()));
}

class RefixApp extends ConsumerWidget {
  const RefixApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themes = ref.watch(appThemeProvider);

    return MaterialApp.router(
      title: 'Refix',
      debugShowCheckedModeBanner: false,
      theme: themes.light,
      darkTheme: themes.dark,
      themeMode: ThemeMode.system,
      routerConfig: appRouter,
    );
  }
}
