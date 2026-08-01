import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rehlaa/shared/domain/money/money.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    required this.currentPrice,
    super.key,
    this.compareAtPrice,
    this.currentPriceStyle,
    this.compareAtPriceStyle,
  });
  final Money currentPrice;
  final Money? compareAtPrice;
  final TextStyle? currentPriceStyle;
  final TextStyle? compareAtPriceStyle;

  String _formatPrice(BuildContext context, Money money) {
    final locale = Localizations.localeOf(context).toLanguageTag();
    final format = NumberFormat.currency(
      locale: locale,
      symbol: '',
      decimalDigits: money.minorUnits % 100 == 0 ? 0 : 2,
    );
    return '${format.format(money.minorUnits / 100).trim()} '
        '${money.currencyCode}';
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Wrap(
      spacing: 8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          _formatPrice(context, currentPrice),
          style:
              currentPriceStyle ??
              textTheme.titleMedium?.copyWith(
                color: colors.onSurface,
                fontWeight: FontWeight.bold,
              ),
        ),
        if (compareAtPrice != null)
          Text(
            _formatPrice(context, compareAtPrice!),
            style:
                compareAtPriceStyle ??
                textTheme.bodyMedium?.copyWith(
                  color: colors.onSurfaceVariant,
                  decoration: TextDecoration.lineThrough,
                ),
          ),
      ],
    );
  }
}
