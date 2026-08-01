import 'package:flutter/material.dart';
import 'package:rehlaa/core/design_system/tokens/app_colors.dart';
import 'package:rehlaa/core/design_system/tokens/app_colors.dart';
import 'package:rehlaa/features/checkout/domain/entities/payment_method.dart';

class PaymentMethodTile extends StatelessWidget {
  const PaymentMethodTile({
    super.key,
    required this.method,
    required this.isSelected,
    required this.onTap,
  });

  final PaymentMethod method;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryLight : AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.black20,
            width: 1.5,
          ),
        ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.black5,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                method.logoUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.account_balance_wallet, color: AppColors.black40),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  method.nameAr,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                if (method.descriptionAr.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    method.descriptionAr,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.black60,
                        ),
                  ),
                ],
              ],
            ),
          ),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? AppColors.primary : AppColors.black20,
                width: isSelected ? 6 : 2,
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}
