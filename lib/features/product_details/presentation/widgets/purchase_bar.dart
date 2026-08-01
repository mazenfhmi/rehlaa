import 'package:flutter/material.dart';
import 'package:rehlaa/core/design_system/design_system.dart';
import 'package:rehlaa/features/product_details/domain/entities/product_selection.dart';
import 'package:rehlaa/generated/l10n/app_localizations.dart';
import 'package:rehlaa/shared/presentation/widgets/product_price.dart';

class PurchaseBar extends StatelessWidget {
  const PurchaseBar({
    required this.selection,
    required this.quantity,
    super.key,
    this.onAddToCart,
    this.onBuyNow,
  });

  final ProductSelection selection;
  final int quantity;
  final VoidCallback? onAddToCart;
  final VoidCallback? onBuyNow;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colors = Theme.of(context).colorScheme;
    final isComplete = selection.isComplete;
    final useVerticalLayout = MediaQuery.textScalerOf(context).scale(1) > 1.5;
    final price = ProductPrice(currentPrice: selection.resolvedPrice);
    final actions = Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            key: const Key('add_to_cart_btn'),
            onPressed: isComplete ? onAddToCart : null,
            icon: const Icon(Icons.add_shopping_cart_rounded),
            label: Text(l10n.addToCart),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: ElevatedButton(
            key: const Key('buy_now_btn'),
            onPressed: isComplete ? onBuyNow : null,
            child: Text(l10n.buyNow),
          ),
        ),
      ],
    );

    return Material(
      color: colors.surface,
      elevation: 8,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: useVerticalLayout
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${l10n.totalPriceLabel} × $quantity',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    price,
                    const SizedBox(height: AppSpacing.md),
                    actions,
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${l10n.totalPriceLabel} × $quantity',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          price,
                        ],
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(flex: 2, child: actions),
                  ],
                ),
        ),
      ),
    );
  }
}
