import 'package:flutter/material.dart';
import 'package:rehlaa/core/design_system/design_system.dart';
import 'package:rehlaa/shared/domain/catalog/product.dart';
import 'package:rehlaa/shared/presentation/widgets/favorite_button.dart';
import 'package:rehlaa/shared/presentation/widgets/product_rating.dart';

class ProductMetadataCard extends StatelessWidget {
  const ProductMetadataCard({
    required this.product,
    required this.isFavorite,
    required this.onFavoriteTap,
    super.key,
  });

  final Product product;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                isRtl ? product.nameAr : product.nameEn,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            FavoriteButton(
              key: const Key('product_favorite_button'),
              isFavorite: isFavorite,
              onTap: onFavoriteTap,
            ),
          ],
        ),
        ProductRating(rating: product.rating, reviewCount: product.reviewCount),
        const SizedBox(height: AppSpacing.md),
        Text(
          isRtl ? product.descriptionAr : product.descriptionEn,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
