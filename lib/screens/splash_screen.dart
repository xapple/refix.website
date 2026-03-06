import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_colors.dart';
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
  final _categoriesSectionKey = GlobalKey();

  Future<void> _scrollToCategories() async {
    final context = _categoriesSectionKey.currentContext;
    if (context == null) {
      return;
    }
    await Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 420),
      curve: Curves.easeOutCubic,
      alignment: 0.02,
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    final text = Theme.of(context).textTheme;
    final accent = cs.tertiary;
    final bg = cs.surface;
    final headerTextColor = cs.onSurface;

    final bottomPadding = MediaQuery.paddingOf(context).bottom;

    return Scaffold(
      backgroundColor: bg,
      drawer: const AppDrawer(),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.only(
              top: MediaQuery.paddingOf(context).top,
              bottom: bottomPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const TopBar(),

                DecoratedBox(
                  decoration: BoxDecoration(
                    color: isLightMode ? null : cs.surfaceContainerLow,
                    gradient: isLightMode ? AppColors.headerGradient(cs) : null,
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
                                    color: cs.shadow.withValues(alpha: 0.12),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: TextField(
                                controller: _searchController,
                                style: text.bodyLarge,
                                textInputAction: TextInputAction.search,
                                onSubmitted: (_) => context.go('/search'),
                                decoration: InputDecoration(
                                  hintText: 'I want to fix my ...',
                                  hintStyle: text.bodyLarge?.copyWith(
                                    color: cs.onSurfaceVariant,
                                  ),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 4),
                                    child: IconButton(
                                      onPressed: () => context.go('/search'),
                                      icon: Icon(
                                        Icons.search,
                                        color: accent,
                                        size: 30,
                                      ),
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
                  decoration: BoxDecoration(color: cs.surfaceContainerLow),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        Text(
                          'Browse categories',
                          style: text.titleLarge?.copyWith(
                            color: cs.onSurface,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        IconButton.filled(
                          onPressed: _scrollToCategories,
                          style: IconButton.styleFrom(
                            backgroundColor: cs.primary,
                            foregroundColor: cs.onPrimary,
                          ),
                          iconSize: 28,
                          icon: const Icon(Icons.keyboard_arrow_down),
                        ),
                      ],
                    ),
                  ),
                ),

                DecoratedBox(
                  decoration: BoxDecoration(color: cs.surfaceContainerLow),
                  child: Padding(
                    key: _categoriesSectionKey,
                    padding: const EdgeInsets.fromLTRB(32, 8, 32, 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _categories.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 20,
                                childAspectRatio: 0.92,
                              ),
                          itemBuilder: (context, index) {
                            final category = _categories[index];
                            return _CategoryCard(category: category);
                          },
                        ),
                        const SizedBox(height: 34),
                        Divider(
                          color: cs.outline.withValues(alpha: 0.35),
                          thickness: 2,
                        ),
                        const SizedBox(height: 28),
                        const _FooterSection(),
                        const SizedBox(height: 44),
                        Center(
                          child: Text(
                            '© 2026 Lucas Sinclair',
                            style: text.bodyMedium,
                          ),
                        ),
                      ],
                    ),
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

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({required this.category});

  final _Category category;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              backgroundColor: cs.surface.withValues(alpha: 0.35),
              side: BorderSide(color: cs.outline),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                category.iconAsset,
                width: 76,
                height: 76,
                fit: BoxFit.contain,
                placeholderBuilder: (context) => const SizedBox(
                  width: 28,
                  height: 28,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.broken_image_outlined,
                  size: 44,
                  color: cs.onSurfaceVariant,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          category.label,
          style: text.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class _FooterLinkButton extends StatelessWidget {
  const _FooterLinkButton({
    required this.label,
    this.textAlign = TextAlign.start,
  });

  final String label;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final isStartAligned = textAlign == TextAlign.start;

    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        foregroundColor: cs.onSurface,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        alignment: isStartAligned
            ? Alignment.centerLeft
            : Alignment.centerRight,
      ),
      child: Text(
        label,
        textAlign: textAlign,
        style: text.bodyMedium?.copyWith(decoration: TextDecoration.underline),
      ),
    );
  }
}

class _FooterSection extends StatelessWidget {
  const _FooterSection();

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final contactStyle = text.bodyMedium;
    final leftLinks = <Widget>[
      const _FooterLinkButton(label: 'FAQ'),
      const SizedBox(height: 4),
      const _FooterLinkButton(label: 'How does it work'),
      const SizedBox(height: 4),
      const _FooterLinkButton(label: 'Become a craftsman'),
      const SizedBox(height: 4),
      const _FooterLinkButton(label: 'Support center'),
    ];

    Widget rightColumn({required TextAlign align}) {
      final isStartAligned = align == TextAlign.start;
      return Column(
        crossAxisAlignment: isStartAligned
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          Text('info@refix.website', style: contactStyle),
          const SizedBox(height: 2),
          Text('+41 22 899 77 13', style: contactStyle),
          const SizedBox(height: 26),
          _FooterLinkButton(label: 'Press', textAlign: align),
          const SizedBox(height: 4),
          _FooterLinkButton(label: 'Report an issue', textAlign: align),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: leftLinks,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(child: rightColumn(align: TextAlign.end)),
      ],
    );
  }
}

class _Category {
  const _Category({required this.label, required this.iconAsset});

  final String label;
  final String iconAsset;
}

const List<_Category> _categories = [
  _Category(label: 'Plumbing', iconAsset: 'assets/category_icons/plumbing.svg'),
  _Category(
    label: 'Electrical',
    iconAsset: 'assets/category_icons/electrical.svg',
  ),
  _Category(label: 'Garden', iconAsset: 'assets/category_icons/garden.svg'),
  _Category(
    label: 'Appliances',
    iconAsset: 'assets/category_icons/appliances.svg',
  ),
  _Category(
    label: 'Furniture',
    iconAsset: 'assets/category_icons/furniture.svg',
  ),
  _Category(label: 'Locks', iconAsset: 'assets/category_icons/locks.svg'),
  _Category(label: 'Heating', iconAsset: 'assets/category_icons/heating.svg'),
  _Category(label: 'Bicycles', iconAsset: 'assets/category_icons/bicycles.svg'),
];
