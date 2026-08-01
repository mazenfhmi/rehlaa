import 'package:rehlaa/features/product_details/domain/entities/product_selection.dart';
import 'package:rehlaa/shared/domain/catalog/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'resolve_product_selection.g.dart';

@riverpod
ResolveProductSelection resolveProductSelection(Ref ref) =>
    ResolveProductSelection();

class ResolveProductSelection {
  ProductSelection call({
    required Product product,
    required Set<String> selectedValueIds,
  }) {
    final optionValueIds = Set<String>.unmodifiable(selectedValueIds);
    final unmatchedValueIds = Set<String>.from(optionValueIds);
    final requiredGroupCount = product.optionGroups
        .where((group) => group.isRequired)
        .length;
    var selectedRequiredCount = 0;
    var resolvedPrice = product.basePrice;

    for (final group in product.optionGroups) {
      final selectedValues = group.values
          .where((value) => optionValueIds.contains(value.id))
          .toList(growable: false);

      if (selectedValues.length > 1) {
        throw ArgumentError.value(
          optionValueIds,
          'selectedValueIds',
          'Only one value can be selected from option group ${group.id}.',
        );
      }

      if (selectedValues.isEmpty) continue;

      final selectedValue = selectedValues.single;
      unmatchedValueIds.remove(selectedValue.id);
      resolvedPrice += selectedValue.priceDelta;

      if (group.isRequired) {
        selectedRequiredCount++;
      }
    }

    if (unmatchedValueIds.isNotEmpty) {
      throw ArgumentError.value(
        unmatchedValueIds,
        'selectedValueIds',
        'Every selected option must belong to the product.',
      );
    }

    final sortedIds = optionValueIds.toList()..sort();
    final optionSignature = sortedIds.join(':');

    return ProductSelection(
      optionValueIds: optionValueIds,
      optionSignature: optionSignature,
      resolvedPrice: resolvedPrice,
      isComplete: selectedRequiredCount == requiredGroupCount,
      selectedRequiredCount: selectedRequiredCount,
    );
  }
}
