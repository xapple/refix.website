import 'package:device_wrapper/device_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'theme/app_theme.dart';
import 'router/app_router.dart';

void main() {
  runApp(const ProviderScope(child: RefixDemoShell()));
}

class RefixDemoShell extends StatelessWidget {
  const RefixDemoShell({super.key});

  @override
  Widget build(BuildContext context) {
    // Pin the ambient font to Inter before DeviceWrapper renders its status
    // bar — the status bar text has no fontFamily set so it inherits from
    // DefaultTextStyle, which would otherwise pick up our app's Averia/Barlow.
    return DefaultTextStyle.merge(
      style: GoogleFonts.inter(),
      child: DeviceWrapper(
        initialMode: DeviceMode.iphone,
        showModeToggle: false,
        mobileDeviceBehavior: MobileDeviceBehavior.alwaysShowFrame,
        backgroundColor: const Color(0xFF1E1E1E),
        child: const RefixApp(),
      ),
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
