import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_method.freezed.dart';
part 'payment_method.g.dart';

@freezed
abstract class PaymentMethod with _$PaymentMethod {
  const factory PaymentMethod({
    required String id,
    required String code, // e.g. 'BRAVO', 'CASHIL_PAY', 'BANK_TRANSFER'
    required String nameAr,
    required String nameEn,
    required String logoUrl,
    required String descriptionAr,
    required String descriptionEn,
    @Default(false) bool isBankTransfer,
  }) = _PaymentMethod;

  factory PaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodFromJson(json);
}
