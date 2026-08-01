import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rehlaa/core/design_system/design_system.dart';
import 'package:rehlaa/features/product_details/domain/entities/product_selection.dart';
import 'package:rehlaa/features/product_details/presentation/view_models/product_details_view_model.dart';
import 'package:rehlaa/features/product_details/presentation/widgets/product_media_gallery.dart';
import 'package:rehlaa/features/product_details/presentation/widgets/product_metadata_card.dart';
import 'package:rehlaa/features/product_details/presentation/widgets/product_option_group_selector.dart';
import 'package:rehlaa/features/product_details/presentation/widgets/purchase_bar.dart';
import 'package:rehlaa/features/product_details/presentation/widgets/quantity_selector.dart';
import 'package:rehlaa/features/product_details/presentation/widgets/selection_validation_message.dart';
import 'package:rehlaa/generated/l10n/app_localizations.dart';
import 'package:rehlaa/shared/domain/catalog/product.dart';

typedef ProductPurchaseCallback =
    void Function(ProductSelection selection, int quantity);

class ProductDetailsPage extends ConsumerWidget {
  const ProductDetailsPage({
    required this.product,
    super.key,
    this.isFavorite = false,
    this.onFavoriteToggle,
    this.onAddToCart,
    this.onBuyNow,
  });

  final Product product;
  final bool isFavorite;
  final VoidCallback? onFavoriteToggle;
  final ProductPurchaseCallback? onAddToCart;
  final ProductPurchaseCallback? onBuyNow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final details = ref.watch(productDetailsViewModelProvider(product));
    final notifier = ref.read(
      productDetailsViewModelProvider(product).notifier,
    );
    final selection = details.selection;
    final l10n = AppLocalizations.of(context);
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final colors = Theme.of(context).colorScheme;

    return AppScaffold(
      appBar: AppPageHeader(title: isRtl ? product.nameAr : product.nameEn),
      bottomNavigationBar: PurchaseBar(
        selection: selection,
        quantity: details.quantity,
        onAddToCart: onAddToCart == null
            ? null
            : () => onAddToCart!(selection, details.quantity),
        onBuyNow: onBuyNow == null
            ? null
            : () => onBuyNow!(selection, details.quantity),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            ProductMediaGallery(
              product: product,
              currentIndex: details.mediaIndex,
              onPageChanged: notifier.selectMedia,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductMetadataCard(
                    product: product,
                    isFavorite: isFavorite,
                    onFavoriteTap: onFavoriteToggle ?? () {},
                  ),
                  ...product.optionGroups.map(
                    (group) => ProductOptionGroupSelector(
                      group: group,
                      selectedValueIds: selection.optionValueIds,
                      onSelected: notifier.toggleSelection,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  QuantitySelector(
                    label: l10n.quantityLabel,
                    quantity: details.quantity,
                    onIncrement: notifier.incrementQuantity,
                    onDecrement: details.quantity > 1
                        ? notifier.decrementQuantity
                        : null,
                  ),
                  if (!selection.isComplete) ...[
                    const SizedBox(height: AppSpacing.lg),
                    SelectionValidationMessage(
                      message: l10n.selectRequiredOptions,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
