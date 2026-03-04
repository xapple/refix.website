import 'package:device_wrapper/device_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'theme/app_theme.dart';
import 'router/app_router.dart';

void main() {
  runApp(const ProviderScope(child: RefixDemoShell()));
}

class RefixDemoShell extends StatelessWidget {
  const RefixDemoShell({super.key});

  @override
  Widget build(BuildContext context) {
    return DeviceWrapper(
      initialMode: DeviceMode.iphone,
      initialTheme: WrapperTheme.dark,
      initialRealisticFrame: true,
      showModeToggle: false,
      mobileDeviceBehavior: MobileDeviceBehavior.alwaysShowFrame,
      backgroundColor: const Color(0xFF1E1E1E),
      child: const RefixApp(),
    );
  }
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
