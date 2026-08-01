import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rehlaa/core/design_system/design_system.dart';
import 'package:rehlaa/features/cart/domain/entities/cart_item.dart';
import 'package:rehlaa/features/cart/presentation/view_models/cart_view_model.dart';
import 'package:rehlaa/generated/l10n/app_localizations.dart';
import 'package:rehlaa/shared/presentation/widgets/product_card.dart';

class CartItemTile extends ConsumerWidget {
  const CartItemTile({required this.item, super.key});
  final CartItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);
    final viewModel = ref.read(cartViewModelProvider.notifier);

    return Dismissible(
      key: Key(item.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => viewModel.removeItem(item.id),
      background: Semantics(
        label: l10n.removeFromCart,
        child: Container(
          decoration: BoxDecoration(
            color: colors.error,
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
          alignment: AlignmentDirectional.centerEnd,
          padding: const EdgeInsetsDirectional.only(end: AppSpacing.lg),
          child: Icon(Icons.delete_outline, color: colors.onError),
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(color: colors.outlineVariant),
        ),
        child: Column(
          children: [
            ProductCard.horizontal(
              product: item.product,
              displayPrice: item.selection.resolvedPrice,
              onTap: () {},
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(
                AppSpacing.md,
                0,
                AppSpacing.xs,
                AppSpacing.sm,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      l10n.quantityLabel,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  IconButton(
                    tooltip: l10n.decreaseQuantity,
                    onPressed: item.quantity > 1
                        ? () => viewModel.updateQuantity(
                            item.id,
                            item.quantity - 1,
                          )
                        : null,
                    icon: const Icon(Icons.remove),
                  ),
                  Semantics(
                    label: '${l10n.quantityLabel}: ${item.quantity}',
                    liveRegion: true,
                    child: SizedBox(
                      width: AppSpacing.xxxl,
                      child: Text(
                        '${item.quantity}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                  IconButton(
                    tooltip: l10n.increaseQuantity,
                    onPressed: () =>
                        viewModel.updateQuantity(item.id, item.quantity + 1),
                    icon: const Icon(Icons.add),
                  ),
                  IconButton(
                    tooltip: l10n.removeFromCart,
                    onPressed: () => viewModel.removeItem(item.id),
                    color: colors.error,
                    icon: const Icon(Icons.delete_outline),
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
