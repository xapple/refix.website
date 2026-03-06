import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../data/fake_data.dart';
import '../theme/app_color_tokens.dart';
import '../widgets/app_drawer.dart';
import '../widgets/top_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController(text: 'Washing machine');
  final _activeFilters = <String>['25 km away', 'Free quote'];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _removeFilter(String filter) {
    setState(() => _activeFilters.remove(filter));
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tokens = Theme.of(context).extension<AppColorTokens>()!;
    final text = Theme.of(context).textTheme;
    final bg = cs.surfaceContainerLowest;

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

            // Search + filters section
            DecoratedBox(
              decoration: BoxDecoration(color: tokens.searchBackground),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Search bar
                    Container(
                      decoration: BoxDecoration(
                        color: cs.surface,
                        borderRadius: BorderRadius.circular(32),
                        border: Border.all(
                          color: cs.outline.withValues(alpha: 0.3),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: cs.shadow.withValues(alpha: 0.08),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _searchController,
                        style: text.bodyLarge,
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          hintStyle: text.bodyLarge?.copyWith(
                            color: cs.onSurfaceVariant,
                          ),
                          suffixIcon: Container(
                            margin: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: cs.primary,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Icon(
                              Icons.search,
                              color: cs.onPrimary,
                              size: 24,
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
                    const SizedBox(height: 16),

                    // Filter + Sort row
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: PhosphorIcon(
                              PhosphorIconsBold.funnel,
                              size: 18,
                            ),
                            label: const Text('Add Filter'),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: cs.secondaryContainer,
                              foregroundColor: cs.onSecondaryContainer,
                              side: BorderSide(
                                color: cs.outline.withValues(alpha: 0.3),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: PhosphorIcon(
                              PhosphorIconsBold.sortDescending,
                              size: 18,
                            ),
                            label: const Text('Sort by...'),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: cs.surface,
                              foregroundColor: cs.onSurface,
                              side: BorderSide(
                                color: cs.outline.withValues(alpha: 0.3),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Active filter chips
                    if (_activeFilters.isNotEmpty)
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: _activeFilters.map((filter) {
                          return InputChip(
                            label: Text(filter),
                            onDeleted: () => _removeFilter(filter),
                            deleteIcon: const Icon(Icons.close, size: 16),
                            backgroundColor: cs.surface,
                            side: BorderSide(
                              color: cs.outline.withValues(alpha: 0.4),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          );
                        }).toList(),
                      ),
                  ],
                ),
              ),
            ),

            // Results list
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Column(
                children: fakeCraftsmen
                    .map((c) => _CraftsmanResultCard(craftsman: c))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CraftsmanResultCard extends StatelessWidget {
  const _CraftsmanResultCard({required this.craftsman});

  final Craftsman craftsman;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return InkWell(
      onTap: () => context.go('/craftsman/${craftsman.id}'),
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Avatar
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    craftsman.avatarUrl,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: cs.primaryContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          craftsman.name[0],
                          style: text.headlineMedium?.copyWith(
                            color: cs.onPrimaryContainer,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 14),

                // Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name
                      Text(
                        craftsman.name,
                        style: text.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),

                      // Location + last seen
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              craftsman.location,
                              style: text.bodySmall?.copyWith(
                                color: cs.onSurfaceVariant,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              'last seen ${craftsman.lastSeen}',
                              style: text.bodySmall?.copyWith(
                                color: cs.onSurfaceVariant,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),

                      // Rating
                      Row(
                        children: [
                          Icon(Icons.star, size: 16, color: cs.primary),
                          const SizedBox(width: 4),
                          Text(
                            '${craftsman.rating}',
                            style: text.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '(${craftsman.reviewCount} reviews)',
                            style: text.bodySmall?.copyWith(
                              color: cs.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),

                      // Specialties
                      Text(
                        craftsman.specialties.join(', '),
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
            Divider(color: cs.outline.withValues(alpha: 0.2), height: 1),
          ],
        ),
      ),
    );
  }
}
