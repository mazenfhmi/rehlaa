import 'package:flutter/material.dart';
import 'package:rehlaa/core/design_system/design_system.dart';

class TrustBenefits extends StatelessWidget {
  const TrustBenefits({
    required this.securePaymentsLabel,
    required this.instantDeliveryLabel,
    required this.supportAnytimeLabel,
    super.key,
  });

  final String securePaymentsLabel;
  final String instantDeliveryLabel;
  final String supportAnytimeLabel;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
    child: Row(
      children: [
        Expanded(
          child: _Benefit(
            icon: Icons.verified_user_outlined,
            label: securePaymentsLabel,
          ),
        ),
        Expanded(
          child: _Benefit(
            icon: Icons.bolt_outlined,
            label: instantDeliveryLabel,
          ),
        ),
        Expanded(
          child: _Benefit(
            icon: Icons.support_agent_outlined,
            label: supportAnytimeLabel,
          ),
        ),
      ],
    ),
  );
}

class _Benefit extends StatelessWidget {
  const _Benefit({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Semantics(
      label: label,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
        child: Column(
          children: [
            Icon(icon, color: colors.primary),
            const SizedBox(height: AppSpacing.xs),
            Text(
              label,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}
