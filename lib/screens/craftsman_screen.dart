import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../data/fake_data.dart';
import '../widgets/app_drawer.dart';
import '../widgets/dashed_divider.dart';
import '../widgets/top_bar.dart';

class CraftsmanScreen extends StatelessWidget {
  const CraftsmanScreen({super.key, required this.craftsmanId});

  final String craftsmanId;

  @override
  Widget build(BuildContext context) {
    final craftsman = fakeCraftsmen.firstWhere(
      (c) => c.id == craftsmanId,
      orElse: () => fakeCraftsmen.first,
    );
    final cs = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final bg = cs.surface;

    return Scaffold(
      backgroundColor: bg,
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.only(
          top: MediaQuery.paddingOf(context).top,
          bottom: MediaQuery.paddingOf(context).bottom + 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TopBar(),

            // Hero image
            AspectRatio(
              aspectRatio: 4 / 3,
              child: Image.network(
                craftsman.avatarUrl.replaceAll('400&h=400', '800&h=600'),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: cs.primaryContainer,
                  child: Icon(
                    Icons.person,
                    size: 80,
                    color: cs.onPrimaryContainer,
                  ),
                ),
              ),
            ),

            // Info section
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  Text(
                    craftsman.name,
                    style: text.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Location + last seen row
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              craftsman.location,
                              style: text.bodyMedium?.copyWith(
                                color: cs.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              craftsman.phone,
                              style: text.bodyMedium?.copyWith(
                                color: cs.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'last seen ${craftsman.lastSeen}',
                              style: text.bodySmall?.copyWith(
                                color: cs.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'member since ${craftsman.memberSince}',
                              style: text.bodySmall?.copyWith(
                                color: cs.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Specialties chips
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: craftsman.specialties.map((s) {
                      return Chip(
                        label: Text(s),
                        backgroundColor: cs.surfaceContainerLow,
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelStyle: text.labelMedium?.copyWith(
                          color: cs.onSurface,
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  const DashedDivider(),
                  const SizedBox(height: 20),

                  // Bio
                  Text(
                    'Bio',
                    style: text.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    craftsman.bio,
                    style: text.bodyMedium?.copyWith(
                      color: cs.onSurfaceVariant,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const DashedDivider(),
                  const SizedBox(height: 20),

                  // Reviews
                  _ReviewsSection(craftsman: craftsman),
                  const SizedBox(height: 20),
                  const DashedDivider(),
                  const SizedBox(height: 20),

                  // Portfolio
                  _PortfolioSection(craftsman: craftsman),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReviewsSection extends StatelessWidget {
  const _ReviewsSection({required this.craftsman});

  final Craftsman craftsman;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final maxCount = craftsman.ratingDistribution.values.fold(
      0,
      (a, b) => a > b ? a : b,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Reviews',
          style: text.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Rating bars
            Expanded(
              flex: 3,
              child: Column(
                children: List.generate(5, (index) {
                  final star = index + 1;
                  final count = craftsman.ratingDistribution[star] ?? 0;
                  final fraction = maxCount > 0 ? count / maxCount : 0.0;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 14,
                          child: Text(
                            '$star',
                            style: text.bodySmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(Icons.star, size: 14, color: cs.primary),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: LinearProgressIndicator(
                              value: fraction,
                              minHeight: 10,
                              backgroundColor: cs.surfaceContainerHighest,
                              color: cs.tertiary.withValues(alpha: 0.6),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(width: 20),

            // Average + count
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(
                    'average',
                    style: text.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    craftsman.rating.toStringAsFixed(1),
                    style: text.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${craftsman.reviewCount} reviews',
                    style: text.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // See all reviews button
        Align(
          alignment: Alignment.centerRight,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Text('See all reviews'),
            label: const Icon(Icons.arrow_forward, size: 18),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: cs.outline),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PortfolioSection extends StatelessWidget {
  const _PortfolioSection({required this.craftsman});

  final Craftsman craftsman;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Portfolio',
          style: text.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: craftsman.portfolioUrls.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                craftsman.portfolioUrls[index],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: cs.surfaceContainerHighest,
                  child: Icon(
                    PhosphorIconsDuotone.image,
                    color: cs.onSurfaceVariant,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
