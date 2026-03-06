import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../data/fake_data.dart';
import '../theme/app_color_tokens.dart';
import '../widgets/app_drawer.dart';
import '../widgets/dashed_divider.dart';
import '../widgets/top_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = fakeUser;
    final cs = Theme.of(context).colorScheme;
    final tokens = Theme.of(context).extension<AppColorTokens>()!;
    final text = Theme.of(context).textTheme;
    final bg = tokens.pageBackground;

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

            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // User info header
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Avatar
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          user.avatarUrl,
                          width: 110,
                          height: 130,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                width: 110,
                                height: 130,
                                decoration: BoxDecoration(
                                  color: cs.primaryContainer,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Icon(
                                  Icons.person,
                                  size: 48,
                                  color: cs.onPrimaryContainer,
                                ),
                              ),
                        ),
                      ),
                      const SizedBox(width: 18),

                      // Name + member since + buttons
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.name,
                              style: text.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'member since ${user.memberSince}',
                              style: text.bodyMedium?.copyWith(
                                color: tokens.secondaryText,
                              ),
                            ),
                            const SizedBox(height: 14),

                            // Action buttons
                            _SmallActionButton(
                              icon: PhosphorIconsDuotone.pencilSimple,
                              label: 'Change name',
                              onPressed: () {},
                            ),
                            const SizedBox(height: 8),
                            _SmallActionButton(
                              icon: PhosphorIconsDuotone.pencilSimple,
                              label: 'Edit picture',
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const DashedDivider(),
                  const SizedBox(height: 20),

                  // Settings buttons
                  _WideButton(
                    icon: PhosphorIconsDuotone.gear,
                    label: 'Settings',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 10),
                  _WideButton(
                    icon: PhosphorIconsDuotone.trash,
                    label: 'Delete account',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 10),
                  _WideButton(
                    icon: PhosphorIconsDuotone.key,
                    label: 'Change password',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 24),
                  const DashedDivider(),
                  const SizedBox(height: 20),

                  // Reservations
                  Text(
                    'My reservations',
                    style: text.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  ...user.reservations.map((r) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _ReservationCard(reservation: r),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SmallActionButton extends StatelessWidget {
  const _SmallActionButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tokens = Theme.of(context).extension<AppColorTokens>()!;

    return Align(
      alignment: Alignment.centerRight,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: PhosphorIcon(icon, size: 18),
        label: Text(label),
        style: OutlinedButton.styleFrom(
          backgroundColor: tokens.sectionBackground.withValues(alpha: 0.5),
          foregroundColor: tokens.onSectionBackground,
          side: BorderSide(color: cs.outline.withValues(alpha: 0.3)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          textStyle: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}

class _WideButton extends StatelessWidget {
  const _WideButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tokens = Theme.of(context).extension<AppColorTokens>()!;
    final text = Theme.of(context).textTheme;

    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: PhosphorIcon(icon, size: 22),
        label: Text(label),
        style: OutlinedButton.styleFrom(
          backgroundColor: tokens.sectionBackground.withValues(alpha: 0.4),
          foregroundColor: tokens.onSectionBackground,
          side: BorderSide(color: cs.outline.withValues(alpha: 0.25)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
          textStyle: text.titleSmall?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class _ReservationCard extends StatelessWidget {
  const _ReservationCard({required this.reservation});

  final Reservation reservation;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tokens = Theme.of(context).extension<AppColorTokens>()!;
    final text = Theme.of(context).textTheme;
    final c = reservation.craftsman;

    return InkWell(
      onTap: () => context.go('/craftsman/${c.id}'),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: cs.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: cs.outline.withValues(alpha: 0.2)),
          boxShadow: [
            BoxShadow(
              color: cs.shadow.withValues(alpha: 0.06),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Craftsman avatar
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                c.avatarUrl,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: cs.primaryContainer,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      c.name[0],
                      style: text.titleLarge?.copyWith(
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
                  // Name + rating
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          c.name,
                          style: text.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Icon(Icons.star, size: 14, color: cs.primary),
                      const SizedBox(width: 2),
                      Text(
                        '${c.rating} (${c.reviewCount})',
                        style: text.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    c.location,
                    style: text.bodySmall?.copyWith(
                      color: tokens.secondaryText,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Booked for:',
                    style: text.bodySmall?.copyWith(
                      color: tokens.secondaryText,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    reservation.dateTime,
                    style: text.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
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
