import 'package:flutter/material.dart';
import 'package:rehlaa/core/design_system/design_system.dart';
import 'package:rehlaa/generated/l10n/app_localizations.dart';

class EmptyCartContent extends StatelessWidget {
  const EmptyCartContent({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colors = Theme.of(context).colorScheme;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              size: 64,
              color: colors.onSurfaceVariant,
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              l10n.cartEmpty,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(color: colors.onSurface),
            ),
          ],
        ),
      ),
    );
  }
}
