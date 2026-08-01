import 'package:rehlaa/core/result/result.dart';
import 'package:rehlaa/features/cart/domain/entities/cart.dart';

abstract class CartRepository {
  Result<Cart> getCart();

  Result<Cart> saveCart(Cart cart);
}
