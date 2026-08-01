// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CheckoutItem _$CheckoutItemFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_CheckoutItem', json, ($checkedConvert) {
      final val = _CheckoutItem(
        id: $checkedConvert('id', (v) => v as String),
        productId: $checkedConvert('productId', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        quantity: $checkedConvert('quantity', (v) => (v as num).toInt()),
        unitPrice: $checkedConvert(
          'unitPrice',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        totalPrice: $checkedConvert(
          'totalPrice',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        selectedOptions: $checkedConvert(
          'selectedOptions',
          (v) => Map<String, String>.from(v as Map),
        ),
        imageUrl: $checkedConvert('imageUrl', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$CheckoutItemToJson(_CheckoutItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'name': instance.name,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice.toJson(),
      'totalPrice': instance.totalPrice.toJson(),
      'selectedOptions': instance.selectedOptions,
      'imageUrl': ?instance.imageUrl,
    };
