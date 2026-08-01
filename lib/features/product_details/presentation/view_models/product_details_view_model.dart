import 'package:rehlaa/features/product_details/domain/use_cases/resolve_product_selection.dart';
import 'package:rehlaa/features/product_details/presentation/states/product_details_state.dart';
import 'package:rehlaa/shared/domain/catalog/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_details_view_model.g.dart';

@riverpod
class ProductDetailsViewModel extends _$ProductDetailsViewModel {
  @override
  ProductDetailsState build(Product product) => ProductDetailsState(
    selection: ref.read(resolveProductSelectionProvider)(
      product: product,
      selectedValueIds: const {},
    ),
  );

  void toggleSelection(String optionValueId) {
    final group = product.optionGroups.firstWhere(
      (g) => g.values.any((v) => v.id == optionValueId),
      orElse: () => throw Exception('Option not found in product'),
    );

    final groupValueIds = group.values.map((v) => v.id).toSet();
    final currentSelected = Set<String>.from(state.selection.optionValueIds);

    if (currentSelected.contains(optionValueId)) {
      currentSelected.remove(optionValueId);
    } else {
      currentSelected
        ..removeAll(groupValueIds)
        ..add(optionValueId);
    }

    state = state.copyWith(
      selection: ref.read(resolveProductSelectionProvider)(
        product: product,
        selectedValueIds: currentSelected,
      ),
    );
  }

  void incrementQuantity() {
    state = state.copyWith(quantity: state.quantity + 1);
  }

  void decrementQuantity() {
    if (state.quantity == 1) return;
    state = state.copyWith(quantity: state.quantity - 1);
  }

  void selectMedia(int index) {
    if (index < 0) return;
    state = state.copyWith(mediaIndex: index);
  }
}
