// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CheckoutQuote _$CheckoutQuoteFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_CheckoutQuote', json, ($checkedConvert) {
      final val = _CheckoutQuote(
        subtotal: $checkedConvert(
          'subtotal',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        couponDiscount: $checkedConvert(
          'couponDiscount',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        referralDiscount: $checkedConvert(
          'referralDiscount',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        walletApplied: $checkedConvert(
          'walletApplied',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        externalPayable: $checkedConvert(
          'externalPayable',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        grandTotal: $checkedConvert(
          'grandTotal',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$CheckoutQuoteToJson(_CheckoutQuote instance) =>
    <String, dynamic>{
      'subtotal': instance.subtotal.toJson(),
      'couponDiscount': instance.couponDiscount.toJson(),
      'referralDiscount': instance.referralDiscount.toJson(),
      'walletApplied': instance.walletApplied.toJson(),
      'externalPayable': instance.externalPayable.toJson(),
      'grandTotal': instance.grandTotal.toJson(),
    };
