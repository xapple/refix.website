import 'package:flutter/material.dart';

import '../theme/app_color_tokens.dart';
import '../widgets/app_drawer.dart';
import '../widgets/top_bar.dart';

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
    final tokens = Theme.of(context).extension<AppColorTokens>()!;
    final text = Theme.of(context).textTheme;
    final accent = cs.tertiary;
    final bg = cs.surfaceContainerLowest;
    final headerTextColor = cs.onSecondaryContainer;

    final bottomPadding = MediaQuery.paddingOf(context).bottom;

    return Scaffold(
      backgroundColor: bg,
      drawer: const AppDrawer(),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(
              top: MediaQuery.paddingOf(context).top,
              bottom: bottomPadding + 72,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const TopBar(),

                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        tokens.splashHeaderGradientTop,
                        tokens.splashHeaderGradientBottom,
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(34, 16, 34, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Search bar
                            Container(
                              decoration: BoxDecoration(
                                color: cs.surface,
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
                                    color: cs.onSurfaceVariant,
                                  ),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 4),
                                    child: Icon(
                                      Icons.search,
                                      color: accent,
                                      size: 30,
                                    ),
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
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Find a local repair man/women near you',
                                textAlign: TextAlign.center,
                                style: text.bodyLarge?.copyWith(
                                  color: headerTextColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),

                            // Emergency mode toggle
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Emergency mode',
                                  style: text.bodyMedium?.copyWith(
                                    color: headerTextColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Switch(
                                  value: _emergencyMode,
                                  onChanged: (val) =>
                                      setState(() => _emergencyMode = val),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),

                            // Tagline
                            Text(
                              "Don't trash it, fix it.",
                              style: text.displaySmall?.copyWith(
                                color: headerTextColor,
                                fontWeight: FontWeight.bold,
                                height: 1.1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),

                // Hero image
                Image.asset(
                  'assets/images/hero.jpg',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                // Browse categories
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: tokens.browseCategoriesBackground,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        Text(
                          'Browse categories',
                          style: text.titleLarge?.copyWith(
                            color: cs.onSecondaryContainer,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Material(
                          color: cs.primary,
                          shape: const CircleBorder(),
                          child: InkWell(
                            customBorder: const CircleBorder(),
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: cs.onPrimary,
                                size: 28,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Lorem ipsum filler content
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 8, 32, 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Why choose Refix?',
                        style: text.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur '
                        'adipiscing elit. Sed do eiusmod tempor '
                        'incididunt ut labore et dolore magna aliqua. '
                        'Ut enim ad minim veniam, quis nostrud '
                        'exercitation ullamco laboris nisi ut aliquip '
                        'ex ea commodo consequat.',
                        style: text.bodyMedium,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Trusted Professionals',
                        style: text.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Duis aute irure dolor in reprehenderit in '
                        'voluptate velit esse cillum dolore eu fugiat '
                        'nulla pariatur. Excepteur sint occaecat '
                        'cupidatat non proident, sunt in culpa qui '
                        'officia deserunt mollit anim id est laborum. '
                        'Sed ut perspiciatis unde omnis iste natus '
                        'error sit voluptatem accusantium doloremque '
                        'laudantium.',
                        style: text.bodyMedium,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Fast & Reliable',
                        style: text.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Nemo enim ipsam voluptatem quia voluptas sit '
                        'aspernatur aut odit aut fugit, sed quia '
                        'consequuntur magni dolores eos qui ratione '
                        'voluptatem sequi nesciunt. Neque porro '
                        'quisquam est, qui dolorem ipsum quia dolor '
                        'sit amet, consectetur, adipisci velit.',
                        style: text.bodyMedium,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'How it works',
                        style: text.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Ut enim ad minima veniam, quis nostrum '
                        'exercitationem ullam corporis suscipit '
                        'laboriosam, nisi ut aliquid ex ea commodi '
                        'consequatur? Quis autem vel eum iure '
                        'reprehenderit qui in ea voluptate velit esse '
                        'quam nihil molestiae consequatur, vel illum '
                        'qui dolorem eum fugiat quo voluptas nulla '
                        'pariatur.',
                        style: text.bodyMedium,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'At vero eos et accusamus et iusto odio '
                        'dignissimos ducimus qui blanditiis '
                        'praesentium voluptatum deleniti atque '
                        'corrupti quos dolores et quas molestias '
                        'excepturi sint occaecati cupiditate non '
                        'provident, similique sunt in culpa qui '
                        'officia deserunt mollitia animi, id est '
                        'laborum et dolorum fuga.',
                        style: text.bodyMedium,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Our Community',
                        style: text.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Et harum quidem rerum facilis est et expedita '
                        'distinctio. Nam libero tempore, cum soluta '
                        'nobis est eligendi optio cumque nihil impedit '
                        'quo minus id quod maxime placeat facere '
                        'possimus, omnis voluptas assumenda est, omnis '
                        'dolor repellendus.',
                        style: text.bodyMedium,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Temporibus autem quibusdam et aut officiis '
                        'debitis aut rerum necessitatibus saepe '
                        'eveniet ut et voluptates repudiandae sint et '
                        'molestiae non recusandae. Itaque earum rerum '
                        'hic tenetur a sapiente delectus, ut aut '
                        'reiciendis voluptatibus maiores alias '
                        'consequatur aut perferendis doloribus '
                        'asperiores repellat.',
                        style: text.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
