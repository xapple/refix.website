import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: cs.primary),
              child: Image.asset('assets/images/logo.png', height: 48),
            ),
            ListTile(
              leading: Icon(Icons.home, color: cs.onSurface),
              title: const Text('Home'),
              onTap: () {
                Navigator.of(context).pop();
                context.go('/');
              },
            ),
            ListTile(
              leading: Icon(Icons.palette, color: cs.onSurface),
              title: const Text('Colors'),
              onTap: () {
                Navigator.of(context).pop();
                context.go('/colors');
              },
            ),
            ListTile(
              leading: Icon(Icons.text_fields, color: cs.onSurface),
              title: const Text('Fonts'),
              onTap: () {
                Navigator.of(context).pop();
                context.go('/fonts');
              },
            ),
          ],
        ),
      ),
    );
  }
}
