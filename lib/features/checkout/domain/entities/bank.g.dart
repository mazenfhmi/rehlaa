// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Bank _$BankFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Bank', json, ($checkedConvert) {
      final val = _Bank(
        id: $checkedConvert('id', (v) => v as String),
        nameAr: $checkedConvert('nameAr', (v) => v as String),
        nameEn: $checkedConvert('nameEn', (v) => v as String),
        logoUrl: $checkedConvert('logoUrl', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$BankToJson(_Bank instance) => <String, dynamic>{
  'id': instance.id,
  'nameAr': instance.nameAr,
  'nameEn': instance.nameEn,
  'logoUrl': instance.logoUrl,
};
