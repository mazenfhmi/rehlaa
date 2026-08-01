// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeCategory _$HomeCategoryFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_HomeCategory', json, ($checkedConvert) {
      final val = _HomeCategory(
        id: $checkedConvert('id', (v) => v as String),
        titleAr: $checkedConvert('titleAr', (v) => v as String),
        titleEn: $checkedConvert('titleEn', (v) => v as String),
        svgIcon: $checkedConvert('svgIcon', (v) => v as String),
        isSelected: $checkedConvert('isSelected', (v) => v as bool? ?? false),
      );
      return val;
    });

Map<String, dynamic> _$HomeCategoryToJson(_HomeCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titleAr': instance.titleAr,
      'titleEn': instance.titleEn,
      'svgIcon': instance.svgIcon,
      'isSelected': instance.isSelected,
    };
