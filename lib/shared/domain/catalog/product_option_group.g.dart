// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_option_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductOptionValue _$ProductOptionValueFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ProductOptionValue', json, ($checkedConvert) {
      final val = _ProductOptionValue(
        id: $checkedConvert('id', (v) => v as String),
        nameAr: $checkedConvert('nameAr', (v) => v as String),
        nameEn: $checkedConvert('nameEn', (v) => v as String),
        priceDelta: $checkedConvert(
          'priceDelta',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ProductOptionValueToJson(_ProductOptionValue instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
      'priceDelta': instance.priceDelta.toJson(),
    };

_ProductOptionGroup _$ProductOptionGroupFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ProductOptionGroup', json, ($checkedConvert) {
      final val = _ProductOptionGroup(
        id: $checkedConvert('id', (v) => v as String),
        nameAr: $checkedConvert('nameAr', (v) => v as String),
        nameEn: $checkedConvert('nameEn', (v) => v as String),
        isRequired: $checkedConvert('isRequired', (v) => v as bool),
        values: $checkedConvert(
          'values',
          (v) => (v as List<dynamic>)
              .map(
                (e) => ProductOptionValue.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ProductOptionGroupToJson(_ProductOptionGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
      'isRequired': instance.isRequired,
      'values': instance.values.map((e) => e.toJson()).toList(),
    };
