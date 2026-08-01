import 'package:flutter/material.dart';

class ProductRating extends StatelessWidget {
  const ProductRating({
    required this.rating,
    required this.reviewCount,
    super.key,
  });
  final double rating;
  final int reviewCount;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Wrap(
      spacing: 4,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Icon(Icons.star_rounded, size: 16, color: colors.tertiary),
        Text(
          rating.toStringAsFixed(1),
          style: textTheme.bodyMedium?.copyWith(
            color: colors.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '($reviewCount)',
          style: textTheme.bodySmall?.copyWith(color: colors.onSurfaceVariant),
        ),
      ],
    );
  }
}
