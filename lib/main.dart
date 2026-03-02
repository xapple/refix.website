import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'theme/app_theme.dart';
import 'router/app_router.dart';
import 'widgets/fake_ios_status_bar.dart';

void main() {
  runApp(const ProviderScope(child: RefixDemoShell()));
}

// Outer shell — dark canvas with an iPhone frame, like Figma preview
class RefixDemoShell extends StatelessWidget {
  const RefixDemoShell({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF1E1E1E),
        body: Center(
          child: DeviceFrame(
            device: Devices.ios.iPhone16,
            isFrameVisible: true,
            screen: Stack(
              children: [
                const RefixApp(),
                const Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: FakeIOSStatusBar(),
                ),
              ],
            ),
          ),
        ),
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
