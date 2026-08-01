import 'package:flutter/material.dart';
import 'package:rehlaa/core/design_system/design_system.dart';
import 'package:rehlaa/shared/domain/catalog/product.dart';

class ProductMediaGallery extends StatelessWidget {
  const ProductMediaGallery({
    required this.product,
    required this.currentIndex,
    required this.onPageChanged,
    super.key,
  });

  final Product product;
  final int currentIndex;
  final ValueChanged<int> onPageChanged;

  @override
  Widget build(BuildContext context) {
    final mediaUrls = product.galleryUrls.isEmpty
        ? [product.imageUrl]
        : product.galleryUrls;
    final colors = Theme.of(context).colorScheme;

    return ColoredBox(
      key: const Key('product_media_gallery'),
      color: colors.surfaceContainerHighest,
      child: Column(
        children: [
          SizedBox(
            height: 300,
            child: PageView.builder(
              itemCount: mediaUrls.length,
              onPageChanged: onPageChanged,
              itemBuilder: (context, index) => AppNetworkImage(
                mediaUrls[index],
                width: double.infinity,
                height: 300,
              ),
            ),
          ),
          if (mediaUrls.length > 1) ...[
            const SizedBox(height: AppSpacing.sm),
            AppDotsIndicator(
              count: mediaUrls.length,
              currentIndex: currentIndex.clamp(0, mediaUrls.length - 1),
            ),
            const SizedBox(height: AppSpacing.md),
          ],
        ],
      ),
    );
  }
}
