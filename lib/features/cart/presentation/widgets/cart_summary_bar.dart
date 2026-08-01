import 'package:flutter/material.dart';
import 'package:rehlaa/core/design_system/design_system.dart';
import 'package:rehlaa/features/cart/domain/entities/cart.dart';
import 'package:rehlaa/generated/l10n/app_localizations.dart';
import 'package:rehlaa/shared/presentation/widgets/product_price.dart';

class CartSummaryBar extends StatelessWidget {
  const CartSummaryBar({
    required this.cart,
    required this.onCheckout,
    super.key,
  });
  final Cart cart;
  final VoidCallback onCheckout;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final l10n = AppLocalizations.of(context);

    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppRadius.sheet),
        ),
        border: Border(top: BorderSide(color: colors.outlineVariant)),
        boxShadow: theme.brightness == Brightness.dark
            ? AppShadows.none
            : AppShadows.lg,
      ),
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(l10n.subTotal, style: theme.textTheme.titleMedium),
                ProductPrice(currentPrice: cart.subtotal),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onCheckout,
                child: Text(l10n.checkout),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
