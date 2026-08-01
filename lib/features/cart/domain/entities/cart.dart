import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehlaa/features/cart/domain/entities/cart_item.dart';
import 'package:rehlaa/shared/domain/money/money.dart';

part 'cart.freezed.dart';

@freezed
abstract class Cart with _$Cart {
  const factory Cart({required List<CartItem> items, required Money subtotal}) =
      _Cart;
}
