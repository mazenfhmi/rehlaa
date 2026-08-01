import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rehlaa/core/design_system/tokens/app_tokens.dart';
import 'package:rehlaa/shared/domain/money/money.dart';

class ProductPrice extends StatelessWidget {

  const ProductPrice({
    required this.currentPrice, super.key,
    this.compareAtPrice,
    this.currentPriceStyle,
    this.compareAtPriceStyle,
  });
  final Money currentPrice;
  final Money? compareAtPrice;
  final TextStyle? currentPriceStyle;
  final TextStyle? compareAtPriceStyle;

  String _formatPrice(Money money) {
    final format = NumberFormat.decimalPattern('en');
    return '${format.format(money.minorUnits / 100)} ${money.currencyCode}';
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Wrap(
      spacing: 8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          _formatPrice(currentPrice),
          style: currentPriceStyle ??
              textTheme.titleMedium?.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
        if (compareAtPrice != null)
          Text(
            _formatPrice(compareAtPrice!),
            style: compareAtPriceStyle ??
                textTheme.bodyMedium?.copyWith(
                  color: AppColors.black40,
                  decoration: TextDecoration.lineThrough,
                ),
          ),
      ],
    );
  }
}
