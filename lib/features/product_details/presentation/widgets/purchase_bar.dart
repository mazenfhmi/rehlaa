import 'package:flutter/material.dart';
import 'package:rehlaa/core/design_system/design_system.dart';
import 'package:rehlaa/features/product_details/domain/entities/product_selection.dart';
import 'package:rehlaa/shared/presentation/widgets/product_price.dart';

class PurchaseBar extends StatelessWidget {
  const PurchaseBar({
    required this.selection,
    super.key,
    this.onAddToCart,
    this.onBuyNow,
  });

  final ProductSelection selection;
  final VoidCallback? onAddToCart;
  final VoidCallback? onBuyNow;

  @override
  Widget build(BuildContext context) {
    final isComplete = selection.isComplete;
    
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: AppShadows.md,
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Price',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  ProductPrice(
                    currentPrice: selection.resolvedPrice,
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            ElevatedButton(
              key: const Key('add_to_cart_btn'),
              onPressed: isComplete ? onAddToCart : null,
              child: const Icon(Icons.add_shopping_cart_rounded),
            ),
            const SizedBox(width: AppSpacing.sm),
            ElevatedButton(
              key: const Key('buy_now_btn'),
              onPressed: isComplete ? onBuyNow : null,
              child: const Text('Buy Now'),
            ),
          ],
        ),
      ),
    );
  }
}
