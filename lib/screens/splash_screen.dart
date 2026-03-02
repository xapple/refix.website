import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPrimary.shade600,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'refix',
              style: AppFonts.title(fontSize: 56, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              'find what fits',
              style: AppFonts.body(
                fontSize: 16,
                color: AppPrimary.shade200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
