import 'package:rehlaa/features/cart/domain/entities/cart.dart';
import 'package:rehlaa/features/cart/domain/entities/cart_item.dart';
import 'package:rehlaa/features/product_details/domain/entities/product_selection.dart';
import 'package:rehlaa/shared/domain/catalog/product.dart';
import 'package:rehlaa/shared/domain/money/money.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_view_model.g.dart';

@riverpod
class CartViewModel extends _$CartViewModel {
  @override
  Cart build() => const Cart(
    items: [],
    subtotal: Money(minorUnits: 0, currencyCode: 'SDG'),
  );

  void addItem(
    Product product,
    ProductSelection selection, [
    int quantity = 1,
  ]) {
    if (quantity < 1) return;

    final newItem = CartItem(
      product: product,
      selection: selection,
      quantity: quantity,
    );
    final items = List<CartItem>.from(state.items);

    final index = items.indexWhere((item) => item.id == newItem.id);
    if (index != -1) {
      items[index] = items[index].copyWith(
        quantity: items[index].quantity + quantity,
      );
    } else {
      items.add(newItem);
    }

    _updateState(items);
  }

  void updateQuantity(String itemId, int quantity) {
    if (quantity < 1) return;

    final items = List<CartItem>.from(state.items);
    final index = items.indexWhere((item) => item.id == itemId);

    if (index != -1) {
      items[index] = items[index].copyWith(quantity: quantity);
      _updateState(items);
    }
  }

  void removeItem(String itemId) {
    final items = state.items.where((item) => item.id != itemId).toList();
    _updateState(items);
  }

  void clear() {
    _updateState([]);
  }

  void _updateState(List<CartItem> items) {
    var totalMinorUnits = 0;
    var currencyCode = 'SDG';
    if (items.isNotEmpty) {
      currencyCode = items.first.totalPrice.currencyCode;
      for (final item in items) {
        totalMinorUnits += item.totalPrice.minorUnits;
      }
    }

    state = state.copyWith(
      items: items,
      subtotal: Money(minorUnits: totalMinorUnits, currencyCode: currencyCode),
    );
  }
}
