import 'package:flutter/material.dart';
import 'package:rehlaa/core/design_system/components/images/app_network_image.dart';
import 'package:rehlaa/core/design_system/tokens/app_tokens.dart';
import 'package:rehlaa/shared/domain/catalog/product.dart';
import 'package:rehlaa/shared/presentation/widgets/favorite_button.dart';
import 'package:rehlaa/shared/presentation/widgets/product_price.dart';
import 'package:rehlaa/shared/presentation/widgets/product_rating.dart';

enum ProductCardVariant { grid, compact, horizontal }

class ProductCard extends StatelessWidget {

  const ProductCard.grid({
    required this.product, required this.onTap, super.key,
    this.onFavoriteTap,
    this.isFavorite = false,
  }) : variant = ProductCardVariant.grid;

  const ProductCard.compact({
    required this.product, required this.onTap, super.key,
    this.onFavoriteTap,
    this.isFavorite = false,
  }) : variant = ProductCardVariant.compact;

  const ProductCard.horizontal({
    required this.product, required this.onTap, super.key,
    this.onFavoriteTap,
    this.isFavorite = false,
  }) : variant = ProductCardVariant.horizontal;
  final Product product;
  final VoidCallback onTap;
  final VoidCallback? onFavoriteTap;
  final bool isFavorite;
  final ProductCardVariant variant;

  @override
  Widget build(BuildContext context) {
    switch (variant) {
      case ProductCardVariant.grid:
        return _buildGrid(context);
      case ProductCardVariant.compact:
        return _buildCompact(context);
      case ProductCardVariant.horizontal:
        return _buildHorizontal(context);
    }
  }

  Widget _buildGrid(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final name = isRtl ? product.nameAr : product.nameEn;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.black5, // surfaceMuted
                    borderRadius: BorderRadius.circular(12),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: AppNetworkImage(
                    product.imageUrl,
                    width: double.infinity,
                    height: double.infinity,
                    radius: 0,
                  ),
                ),
                if (product.isFeatured)
                  Positioned(
                    top: 8,
                    left: isRtl ? null : 8,
                    right: isRtl ? 8 : null,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Featured', // We can localize this if needed
                        style: textTheme.labelSmall?.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  top: 4,
                  right: isRtl ? null : 4,
                  left: isRtl ? 4 : null,
                  child: FavoriteButton(
                    isFavorite: isFavorite,
                    onTap: onFavoriteTap ?? () {},
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: textTheme.bodyMedium?.copyWith(
              color: AppColors.black,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          ProductRating(
            rating: product.rating,
            reviewCount: product.reviewCount,
          ),
          const SizedBox(height: 4),
          ProductPrice(
            currentPrice: product.basePrice,
            compareAtPrice: product.compareAtPrice,
          ),
        ],
      ),
    );
  }

  Widget _buildCompact(BuildContext context) => const SizedBox.shrink();

  Widget _buildHorizontal(BuildContext context) => const SizedBox.shrink();
}
