import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rehlaa/core/design_system/tokens/app_colors.dart';
import 'package:rehlaa/core/design_system/components/cards/app_cards.dart';
import 'package:rehlaa/features/checkout/domain/entities/bank_account.dart';

class BankDetailsCard extends StatelessWidget {
  const BankDetailsCard({
    super.key,
    required this.account,
  });

  final BankAccount account;

  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تم النسخ إلى الحافظة'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.black20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'تفاصيل الحساب',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          _buildDetailRow(
            context,
            label: 'اسم المستفيد',
            value: account.beneficiaryNameAr,
          ),
          const SizedBox(height: 12),
          _buildDetailRow(
            context,
            label: 'رقم الحساب',
            value: account.accountNumber,
            showCopy: true,
          ),
          if (account.instructionsAr.isNotEmpty) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info_outline, color: AppColors.primary, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      account.instructionsAr,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.primaryDark,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context, {
    required String label,
    required String value,
    bool showCopy = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.black60,
              ),
        ),
        Row(
          children: [
            Text(
              value,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            if (showCopy) ...[
              const SizedBox(width: 8),
              InkWell(
                onTap: () => _copyToClipboard(context, value),
                child: const Icon(
                  Icons.copy,
                  size: 20,
                  color: AppColors.primary,
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
