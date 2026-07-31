// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeCategoryImpl _$$HomeCategoryImplFromJson(Map<String, dynamic> json) =>
    _$HomeCategoryImpl(
      id: json['id'] as String,
      titleAr: json['titleAr'] as String,
      titleEn: json['titleEn'] as String,
      svgIcon: json['svgIcon'] as String,
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$$HomeCategoryImplToJson(_$HomeCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titleAr': instance.titleAr,
      'titleEn': instance.titleEn,
      'svgIcon': instance.svgIcon,
      'isSelected': instance.isSelected,
    };
