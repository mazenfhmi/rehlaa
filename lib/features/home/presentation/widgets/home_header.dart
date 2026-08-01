import 'package:flutter/material.dart';
import 'package:rehlaa/core/design_system/design_system.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    required this.searchHint,
    super.key,
    this.onSearchTap,
    this.onCartTap,
    this.onNotificationsTap,
  });

  final String searchHint;
  final VoidCallback? onSearchTap;
  final VoidCallback? onCartTap;
  final VoidCallback? onNotificationsTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: Row(
        children: [
          Expanded(
            child: Semantics(
              button: true,
              label: searchHint,
              child: InkWell(
                key: const ValueKey('home-search'),
                onTap: onSearchTap,
                borderRadius: BorderRadius.circular(AppRadius.md),
                child: Container(
                  constraints: const BoxConstraints(minHeight: 48),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                  ),
                  decoration: BoxDecoration(
                    color: colors.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(AppRadius.md),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: colors.onSurfaceVariant),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: Text(
                          searchHint,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: colors.onSurfaceVariant),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          IconButton(
            constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
            onPressed: onCartTap,
            icon: const Icon(Icons.shopping_bag_outlined),
          ),
          IconButton(
            constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
            onPressed: onNotificationsTap,
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),
    );
  }
}
