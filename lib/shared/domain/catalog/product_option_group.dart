import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehlaa/shared/domain/money/money.dart';

part 'product_option_group.freezed.dart';
part 'product_option_group.g.dart';

@freezed
abstract class ProductOptionValue with _$ProductOptionValue {
  const factory ProductOptionValue({
    required String id,
    required String nameAr,
    required String nameEn,
    required Money priceDelta,
  }) = _ProductOptionValue;

  factory ProductOptionValue.fromJson(Map<String, dynamic> json) =>
      _$ProductOptionValueFromJson(json);
}

@freezed
abstract class ProductOptionGroup with _$ProductOptionGroup {
  const factory ProductOptionGroup({
    required String id,
    required String nameAr,
    required String nameEn,
    required bool isRequired,
    required List<ProductOptionValue> values,
  }) = _ProductOptionGroup;

  factory ProductOptionGroup.fromJson(Map<String, dynamic> json) =>
      _$ProductOptionGroupFromJson(json);
}
