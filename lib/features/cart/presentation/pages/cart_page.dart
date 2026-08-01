import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rehlaa/core/design_system/design_system.dart';
import 'package:rehlaa/features/cart/presentation/view_models/cart_view_model.dart';
import 'package:rehlaa/features/cart/presentation/widgets/cart_item_tile.dart';
import 'package:rehlaa/features/cart/presentation/widgets/cart_summary_bar.dart';
import 'package:rehlaa/features/cart/presentation/widgets/empty_cart_content.dart';
import 'package:rehlaa/features/checkout/presentation/widgets/checkout_sheet.dart';
import 'package:rehlaa/generated/l10n/app_localizations.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key, this.onCheckout});

  final VoidCallback? onCheckout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartViewModelProvider);
    final l10n = AppLocalizations.of(context);

    return AppScaffold(
      appBar: AppPageHeader(title: l10n.cartTitle),
      body: cart.items.isEmpty
          ? const EmptyCartContent()
          : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                      AppSpacing.base,
                      AppSpacing.sm,
                      AppSpacing.base,
                      AppSpacing.lg,
                    ),
                    itemCount: cart.items.length,
                    separatorBuilder: (_, _) =>
                        const SizedBox(height: AppSpacing.md),
                    itemBuilder: (context, index) {
                      final item = cart.items[index];
                      return CartItemTile(item: item);
                    },
                  ),
                ),
                CartSummaryBar(
                  cart: cart,
                  onCheckout:
                      onCheckout ??
                      () => showCheckoutSheet(context, price: cart.subtotal),
                ),
              ],
            ),
    );
  }
}
