import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product_model.dart';

class CartItem {
  final ProductModel product;
  final int quantity;
  final String? selectedSize;
  final String? selectedColor;

  CartItem({
    required this.product,
    this.quantity = 1,
    this.selectedSize,
    this.selectedColor,
  });

  CartItem copyWith({
    ProductModel? product,
    int? quantity,
    String? selectedSize,
    String? selectedColor,
  }) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      selectedSize: selectedSize ?? this.selectedSize,
      selectedColor: selectedColor ?? this.selectedColor,
    );
  }
}

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier()
      : super([
          CartItem(
            product: demoPopularProducts[0],
            quantity: 1,
            selectedSize: "S",
          ),
          CartItem(
            product: demoPopularProducts[2],
            quantity: 2,
            selectedSize: "M",
          ),
        ]);

  void addProduct(ProductModel product, {int quantity = 1, String? size, String? color}) {
    final index = state.indexWhere((item) => item.product.title == product.title);
    if (index >= 0) {
      final existing = state[index];
      final updated = existing.copyWith(quantity: existing.quantity + quantity);
      state = [
        ...state.sublist(0, index),
        updated,
        ...state.sublist(index + 1),
      ];
    } else {
      state = [
        ...state,
        CartItem(
          product: product,
          quantity: quantity,
          selectedSize: size,
          selectedColor: color,
        )
      ];
    }
  }

  void removeProduct(int index) {
    if (index >= 0 && index < state.length) {
      state = [
        ...state.sublist(0, index),
        ...state.sublist(index + 1),
      ];
    }
  }

  void updateQuantity(int index, int newQuantity) {
    if (newQuantity <= 0) {
      removeProduct(index);
      return;
    }
    if (index >= 0 && index < state.length) {
      state = [
        for (int i = 0; i < state.length; i++)
          if (i == index) state[i].copyWith(quantity: newQuantity) else state[i]
      ];
    }
  }

  void clearCart() {
    state = [];
  }

  double get totalPrice {
    double total = 0.0;
    for (var item in state) {
      final itemPrice = item.product.priceAfterDiscount ?? item.product.price;
      total += itemPrice * item.quantity;
    }
    return total;
  }

  int get totalItemCount {
    int count = 0;
    for (var item in state) {
      count += item.quantity;
    }
    return count;
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});
