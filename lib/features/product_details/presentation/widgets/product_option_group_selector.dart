import 'package:flutter/material.dart';
import 'package:rehlaa/core/design_system/design_system.dart';
import 'package:rehlaa/shared/domain/catalog/product_option_group.dart';

class ProductOptionGroupSelector extends StatelessWidget {
  const ProductOptionGroupSelector({
    required this.group,
    required this.selectedValueIds,
    required this.onSelected,
    super.key,
  });

  final ProductOptionGroup group;
  final Set<String> selectedValueIds;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppSpacing.lg),
        Text.rich(
          TextSpan(
            text: isRtl ? group.nameAr : group.nameEn,
            children: group.isRequired
                ? [
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ]
                : const [],
          ),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: group.values
              .map((value) {
                final isSelected = selectedValueIds.contains(value.id);
                return ChoiceChip(
                  key: ValueKey('product-option-${value.id}'),
                  label: Text(isRtl ? value.nameAr : value.nameEn),
                  selected: isSelected,
                  onSelected: (_) => onSelected(value.id),
                );
              })
              .toList(growable: false),
        ),
      ],
    );
  }
}
