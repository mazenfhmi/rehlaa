// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Product _$ProductFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_Product',
  json,
  ($checkedConvert) {
    final val = _Product(
      id: $checkedConvert('id', (v) => v as String),
      categoryId: $checkedConvert('categoryId', (v) => v as String),
      nameAr: $checkedConvert('nameAr', (v) => v as String),
      nameEn: $checkedConvert('nameEn', (v) => v as String),
      descriptionAr: $checkedConvert('descriptionAr', (v) => v as String),
      descriptionEn: $checkedConvert('descriptionEn', (v) => v as String),
      imageUrl: $checkedConvert('imageUrl', (v) => v as String),
      galleryUrls: $checkedConvert(
        'galleryUrls',
        (v) => (v as List<dynamic>).map((e) => e as String).toList(),
      ),
      basePrice: $checkedConvert(
        'basePrice',
        (v) => Money.fromJson(v as Map<String, dynamic>),
      ),
      compareAtPrice: $checkedConvert(
        'compareAtPrice',
        (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
      ),
      rating: $checkedConvert('rating', (v) => (v as num).toDouble()),
      reviewCount: $checkedConvert('reviewCount', (v) => (v as num).toInt()),
      stockStatus: $checkedConvert(
        'stockStatus',
        (v) => $enumDecode(_$StockStatusEnumMap, v),
      ),
      isFeatured: $checkedConvert('isFeatured', (v) => v as bool),
      optionGroups: $checkedConvert(
        'optionGroups',
        (v) => (v as List<dynamic>)
            .map((e) => ProductOptionGroup.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
    return val;
  },
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'id': instance.id,
  'categoryId': instance.categoryId,
  'nameAr': instance.nameAr,
  'nameEn': instance.nameEn,
  'descriptionAr': instance.descriptionAr,
  'descriptionEn': instance.descriptionEn,
  'imageUrl': instance.imageUrl,
  'galleryUrls': instance.galleryUrls,
  'basePrice': instance.basePrice.toJson(),
  'compareAtPrice': ?instance.compareAtPrice?.toJson(),
  'rating': instance.rating,
  'reviewCount': instance.reviewCount,
  'stockStatus': _$StockStatusEnumMap[instance.stockStatus]!,
  'isFeatured': instance.isFeatured,
  'optionGroups': instance.optionGroups.map((e) => e.toJson()).toList(),
};

const _$StockStatusEnumMap = {
  StockStatus.inStock: 'inStock',
  StockStatus.outOfStock: 'outOfStock',
  StockStatus.lowStock: 'lowStock',
};
