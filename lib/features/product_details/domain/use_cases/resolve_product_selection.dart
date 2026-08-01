import 'package:rehlaa/features/product_details/domain/entities/product_selection.dart';
import 'package:rehlaa/shared/domain/catalog/product.dart';
import 'package:rehlaa/shared/domain/money/money.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'resolve_product_selection.g.dart';

@riverpod
ResolveProductSelection resolveProductSelection(Ref ref) => ResolveProductSelection();

class ResolveProductSelection {
  ProductSelection call({
    required Product product,
    required Set<String> selectedValueIds,
  }) {
    // 1. Calculate completeness
    final requiredGroupIds = product.optionGroups
        .where((g) => g.isRequired)
        .map((g) => g.id)
        .toSet();
        
    var selectedRequiredCount = 0;
    
    // Calculate the total added price
    var additionalMinorUnits = 0;

    // Check which required groups are satisfied and accumulate price
    for (final group in product.optionGroups) {
      var hasSelectedValueInGroup = false;
      for (final value in group.values) {
        if (selectedValueIds.contains(value.id)) {
          hasSelectedValueInGroup = true;
          additionalMinorUnits += value.priceDelta.minorUnits;
          break; // Usually one selection per group
        }
      }
      if (group.isRequired && hasSelectedValueInGroup) {
        selectedRequiredCount++;
      }
    }

    final isComplete = selectedRequiredCount == requiredGroupIds.length;

    // 2. Generate signature
    final sortedIds = selectedValueIds.toList()..sort();
    final optionSignature = sortedIds.join(':');

    // 3. Resolve price
    final basePrice = product.basePrice;
    final resolvedPrice = Money(
      minorUnits: basePrice.minorUnits + additionalMinorUnits,
      currencyCode: basePrice.currencyCode,
    );

    return ProductSelection(
      optionValueIds: selectedValueIds,
      optionSignature: optionSignature,
      resolvedPrice: resolvedPrice,
      isComplete: isComplete,
      selectedRequiredCount: selectedRequiredCount,
    );
  }
}
