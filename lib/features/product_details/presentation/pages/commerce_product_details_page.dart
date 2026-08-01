import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rehlaa/core/design_system/design_system.dart';
import 'package:rehlaa/core/network/connectivity_service.dart';
import 'package:rehlaa/features/cart/presentation/view_models/cart_view_model.dart';
import 'package:rehlaa/features/catalog/presentation/providers/catalog_provider.dart';
import 'package:rehlaa/features/checkout/presentation/widgets/checkout_sheet.dart';
import 'package:rehlaa/features/favorites/presentation/view_models/favorites_view_model.dart';
import 'package:rehlaa/features/product_details/presentation/pages/product_details_page.dart';
import 'package:rehlaa/generated/l10n/app_localizations.dart';
import 'package:rehlaa/shared/domain/catalog/product.dart';
import 'package:rehlaa/shared/domain/money/money.dart';

class CommerceProductDetailsPage extends ConsumerWidget {
  const CommerceProductDetailsPage({
    required this.productId,
    super.key,
    this.initialProduct,
  });

  final String productId;
  final Product? initialProduct;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = initialProduct;
    if (product != null) {
      return _buildDetails(context, ref, product);
    }

    return ref
        .watch(productByIdProvider(productId))
        .when(
          data: (loadedProduct) => _buildDetails(context, ref, loadedProduct),
          loading: () => const AppScaffold(body: AppLoadingIndicator()),
          error: (error, _) =>
              AppScaffold(body: AppErrorState(message: error.toString())),
        );
  }

  Widget _buildDetails(BuildContext context, WidgetRef ref, Product product) {
    final favorites = ref.watch(favoritesViewModelProvider).value ?? const [];
    final isFavorite = favorites.any((item) => item.id == product.id);
    final isOnline = ref.watch(isOnlineProvider).value ?? false;

    return ProductDetailsPage(
      product: product,
      isFavorite: isFavorite,
      onFavoriteToggle: () =>
          ref.read(favoritesViewModelProvider.notifier).toggleFavorite(product),
      onAddToCart: isOnline
          ? (selection, quantity) {
              ref
                  .read(cartViewModelProvider.notifier)
                  .addItem(product, selection, quantity);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(AppLocalizations.of(context).addToCart)),
              );
            }
          : null,
      onBuyNow: isOnline
          ? (selection, quantity) => showCheckoutSheet(
              context,
              price: Money(
                minorUnits: selection.resolvedPrice.minorUnits * quantity,
                currencyCode: selection.resolvedPrice.currencyCode,
              ),
            )
          : null,
    );
  }
}
