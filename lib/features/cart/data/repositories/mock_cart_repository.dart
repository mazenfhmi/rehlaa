import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rehlaa/core/result/result.dart';
import 'package:rehlaa/features/cart/domain/entities/cart.dart';
import 'package:rehlaa/features/cart/domain/repositories/cart_repository.dart';
import 'package:rehlaa/shared/domain/money/money.dart';

class MockCartRepository implements CartRepository {
  Cart _cart = const Cart(
    items: [],
    subtotal: Money(minorUnits: 0, currencyCode: 'SDG'),
  );

  @override
  Result<Cart> getCart() => Success(_snapshot(_cart));

  @override
  Result<Cart> saveCart(Cart cart) {
    if (cart.items.any((item) => item.quantity < 1)) {
      return const Failure(
        ValidationFailure(
          message: 'Cart item quantity must be at least one.',
          fieldErrors: {'quantity': 'Must be at least one.'},
        ),
      );
    }
    _cart = _snapshot(cart);
    return Success(_snapshot(_cart));
  }

  Cart _snapshot(Cart cart) =>
      cart.copyWith(items: List.unmodifiable(cart.items));
}

final cartRepositoryProvider = Provider<CartRepository>(
  (ref) => MockCartRepository(),
);
