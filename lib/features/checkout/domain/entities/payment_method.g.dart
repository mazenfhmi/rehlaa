// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_PaymentMethod', json, ($checkedConvert) {
      final val = _PaymentMethod(
        id: $checkedConvert('id', (v) => v as String),
        code: $checkedConvert('code', (v) => v as String),
        nameAr: $checkedConvert('nameAr', (v) => v as String),
        nameEn: $checkedConvert('nameEn', (v) => v as String),
        logoUrl: $checkedConvert('logoUrl', (v) => v as String),
        descriptionAr: $checkedConvert('descriptionAr', (v) => v as String),
        descriptionEn: $checkedConvert('descriptionEn', (v) => v as String),
        isBankTransfer: $checkedConvert(
          'isBankTransfer',
          (v) => v as bool? ?? false,
        ),
      );
      return val;
    });

Map<String, dynamic> _$PaymentMethodToJson(_PaymentMethod instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
      'logoUrl': instance.logoUrl,
      'descriptionAr': instance.descriptionAr,
      'descriptionEn': instance.descriptionEn,
      'isBankTransfer': instance.isBankTransfer,
    };
