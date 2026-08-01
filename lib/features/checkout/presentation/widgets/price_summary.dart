import 'package:flutter/material.dart';
import 'package:rehlaa/core/design_system/tokens/app_colors.dart';
import 'package:rehlaa/features/checkout/domain/entities/checkout_quote.dart';

class PriceSummary extends StatelessWidget {
  const PriceSummary({
    required this.quote,
    super.key,
  });

  final CheckoutQuote quote;

  @override
  Widget build(BuildContext context) {
    final discount = quote.couponDiscount + quote.referralDiscount;
    return Column(
      children: [
        _buildRow(
          context,
          label: 'المجموع الفرعي',
          value: quote.subtotal.formatted,
        ),
        if (discount.minorUnits > 0) ...[
          const SizedBox(height: 12),
          _buildRow(
            context,
            label: 'الخصم',
            value: '-${discount.formatted}',
            valueColor: AppColors.success,
          ),
        ],
        if (quote.walletApplied.minorUnits > 0) ...[
          const SizedBox(height: 12),
          _buildRow(
            context,
            label: 'خصم المحفظة',
            value: '-${quote.walletApplied.formatted}',
            valueColor: AppColors.success,
          ),
        ],
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Divider(height: 1),
        ),
        _buildRow(
          context,
          label: 'الإجمالي',
          value: quote.externalPayable.formatted,
          isTotal: true,
        ),
      ],
    );
  }

  Widget _buildRow(
    BuildContext context, {
    required String label,
    required String value,
    Color? valueColor,
    bool isTotal = false,
  }) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isTotal
              ? Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  )
              : Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.black60,
                  ),
        ),
        Text(
          value,
          style: isTotal
              ? Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  )
              : Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: valueColor,
                  ),
        ),
      ],
    );
}
