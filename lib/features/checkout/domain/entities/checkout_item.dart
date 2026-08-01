import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehlaa/shared/domain/money/money.dart';

part 'checkout_item.freezed.dart';
part 'checkout_item.g.dart';

@freezed
abstract class CheckoutItem with _$CheckoutItem {
  const factory CheckoutItem({
    required String id,
    required String productId,
    required String name,
    required int quantity,
    required Money unitPrice,
    required Money totalPrice,
    required Map<String, String> selectedOptions,
    String? imageUrl,
  }) = _CheckoutItem;

  factory CheckoutItem.fromJson(Map<String, dynamic> json) =>
      _$CheckoutItemFromJson(json);
}
