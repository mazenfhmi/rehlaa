// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Category _$CategoryFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Category', json, ($checkedConvert) {
      final val = _Category(
        id: $checkedConvert('id', (v) => v as String),
        nameAr: $checkedConvert('nameAr', (v) => v as String),
        nameEn: $checkedConvert('nameEn', (v) => v as String),
        imageUrl: $checkedConvert('imageUrl', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$CategoryToJson(_Category instance) => <String, dynamic>{
  'id': instance.id,
  'nameAr': instance.nameAr,
  'nameEn': instance.nameEn,
  'imageUrl': instance.imageUrl,
};
