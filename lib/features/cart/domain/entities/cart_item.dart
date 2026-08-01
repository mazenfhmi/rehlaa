import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehlaa/features/product_details/domain/entities/product_selection.dart';
import 'package:rehlaa/shared/domain/catalog/product.dart';
import 'package:rehlaa/shared/domain/money/money.dart';

part 'cart_item.freezed.dart';

@freezed
abstract class CartItem with _$CartItem {
  const factory CartItem({
    required Product product,
    required ProductSelection selection,
    required int quantity,
  }) = _CartItem;

  const CartItem._();

  String get id => '${product.id}_${selection.optionSignature}';
  Money get totalPrice => Money(
    minorUnits: selection.resolvedPrice.minorUnits * quantity, 
    currencyCode: selection.resolvedPrice.currencyCode,
  );
}
