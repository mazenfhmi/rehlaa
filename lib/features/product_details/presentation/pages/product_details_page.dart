import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rehlaa/core/design_system/design_system.dart';
import 'package:rehlaa/features/product_details/presentation/view_models/product_details_view_model.dart';
import 'package:rehlaa/features/product_details/presentation/widgets/purchase_bar.dart';
import 'package:rehlaa/shared/domain/catalog/product.dart';

class ProductDetailsPage extends ConsumerWidget {
  const ProductDetailsPage({required this.product, super.key});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selection = ref.watch(productDetailsViewModelProvider(product));
    
    return AppScaffold(
      appBar: AppPageHeader(title: product.nameEn),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 120),
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  color: AppColors.lightGrey,
                  child: AppNetworkImage(product.imageUrl),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                  ),
                  padding: const EdgeInsets.all(AppSpacing.xl),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.nameEn, style: Theme.of(context).textTheme.titleLarge),
                      ...product.optionGroups.map((group) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: AppSpacing.lg),
                            Text(group.nameEn, style: Theme.of(context).textTheme.titleMedium),
                            Wrap(
                              spacing: AppSpacing.sm,
                              children: group.values.map((val) {
                                final isSelected = selection.optionValueIds.contains(val.id);
                                return ChoiceChip(
                                  label: Text(val.nameEn),
                                  selected: isSelected,
                                  onSelected: (_) {
                                    ref.read(productDetailsViewModelProvider(product).notifier)
                                       .toggleSelection(val.id);
                                  },
                                );
                              }).toList(),
                            )
                          ],
                        )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: PurchaseBar(
              selection: selection,
              onAddToCart: () {},
              onBuyNow: () {},
            ),
          ),
        ],
      ),
    );
  }
}
