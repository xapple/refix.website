import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _emergencyMode = false;
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final accent = cs.tertiary;
    final bg = cs.surfaceContainerLowest;

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Material(
            color: accent,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {},
              child: Icon(Icons.menu, color: cs.onTertiary, size: 26),
            ),
          ),
        ),
        title: Image.asset('assets/images/logo.png', height: 40),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Material(
              color: accent,
              shape: const CircleBorder(),
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(Icons.person, color: cs.onTertiary, size: 26),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search bar
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.08),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _searchController,
                      style: text.bodyLarge,
                      decoration: InputDecoration(
                        hintText: 'I want to fix my ...',
                        hintStyle: text.bodyLarge?.copyWith(
                          color: Colors.grey.shade400,
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Icon(Icons.search, color: accent, size: 30),
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Subtitle
                  Text(
                    'Find a local repair man/women near you',
                    style: text.bodyMedium?.copyWith(color: accent),
                  ),
                  const SizedBox(height: 8),

                  // Emergency mode toggle
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Emergency mode',
                        style: text.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Switch(
                        value: _emergencyMode,
                        onChanged: (val) =>
                            setState(() => _emergencyMode = val),
                        activeTrackColor: const Color(0xFF1A1A3A),
                        activeThumbColor: Colors.white,
                        inactiveThumbColor: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Tagline
                  Text(
                    "Don't trash it, fix it.",
                    style: text.displaySmall?.copyWith(
                      color: accent,
                      fontWeight: FontWeight.bold,
                      height: 1.1,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Hero image
            Image.asset(
              'assets/images/hero.jpg',
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            // Browse categories
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Text(
                    'Browse categories',
                    style: text.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Material(
                    color: const Color(0xFF1A1A3A),
                    shape: const CircleBorder(),
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
