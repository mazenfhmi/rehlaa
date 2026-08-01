import 'package:rehlaa/features/product_details/domain/entities/product_selection.dart';
import 'package:rehlaa/features/product_details/domain/use_cases/resolve_product_selection.dart';
import 'package:rehlaa/shared/domain/catalog/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_details_view_model.g.dart';

@riverpod
class ProductDetailsViewModel extends _$ProductDetailsViewModel {
  @override
  ProductSelection build(Product product) => ref.read(resolveProductSelectionProvider)(
      product: product,
      selectedValueIds: const {},
    );

  void toggleSelection(String optionValueId) {
    final group = product.optionGroups.firstWhere(
      (g) => g.values.any((v) => v.id == optionValueId),
      orElse: () => throw Exception('Option not found in product'),
    );

    final groupValueIds = group.values.map((v) => v.id).toSet();
    final currentSelected = Set<String>.from(state.optionValueIds);
    
    if (currentSelected.contains(optionValueId)) {
      currentSelected.remove(optionValueId);
    } else {
      currentSelected
        ..removeAll(groupValueIds)
        ..add(optionValueId);
    }

    state = ref.read(resolveProductSelectionProvider)(
      product: product,
      selectedValueIds: currentSelected,
    );
  }
}
