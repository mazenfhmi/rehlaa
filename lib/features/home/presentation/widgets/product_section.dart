import 'package:flutter/material.dart';
import 'package:rehlaa/core/design_system/design_system.dart';
import 'package:rehlaa/shared/domain/catalog/product.dart';
import 'package:rehlaa/shared/presentation/widgets/product_card.dart';

class ProductSection extends StatelessWidget {
  const ProductSection({
    required this.title,
    required this.products,
    required this.emptyLabel,
    super.key,
    this.horizontal = false,
    this.onProductTap,
  });

  final String title;
  final List<Product> products;
  final String emptyLabel;
  final bool horizontal;
  final ValueChanged<Product>? onProductTap;

  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.textScalerOf(context).scale(1);
    final horizontalCardHeight = 304 * textScale.clamp(1, 2).toDouble();
    final horizontalCardWidth = 180 * textScale.clamp(1, 1.5).toDouble();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        if (products.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            child: Text(emptyLabel),
          )
        else if (horizontal)
          SizedBox(
            height: horizontalCardHeight,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.md),
              itemBuilder: (context, index) => SizedBox(
                width: horizontalCardWidth,
                child: ProductCard.grid(
                  product: products[index],
                  onTap: () => onProductTap?.call(products[index]),
                ),
              ),
            ),
          )
        else
          GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: AppSpacing.lg,
              crossAxisSpacing: AppSpacing.md,
              childAspectRatio: 0.65,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) => ProductCard.grid(
              product: products[index],
              onTap: () => onProductTap?.call(products[index]),
            ),
          ),
      ],
    );
  }
}
