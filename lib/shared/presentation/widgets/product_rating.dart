import 'package:flutter/material.dart';
import 'package:rehlaa/core/design_system/tokens/app_tokens.dart';

class ProductRating extends StatelessWidget {

  const ProductRating({
    required this.rating, required this.reviewCount, super.key,
  });
  final double rating;
  final int reviewCount;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.star_rounded, size: 16, color: AppColors.warning),
        const SizedBox(width: 4),
        Text(
          rating.toStringAsFixed(1),
          style: textTheme.bodyMedium?.copyWith(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          '($reviewCount)',
          style: textTheme.bodySmall?.copyWith(
            color: AppColors.black40,
          ),
        ),
      ],
    );
  }
}
