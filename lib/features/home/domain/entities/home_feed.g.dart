// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PromoBanner _$PromoBannerFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_PromoBanner', json, ($checkedConvert) {
      final val = _PromoBanner(
        id: $checkedConvert('id', (v) => v as String),
        imageUrl: $checkedConvert('imageUrl', (v) => v as String),
        linkTarget: $checkedConvert('linkTarget', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$PromoBannerToJson(_PromoBanner instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'linkTarget': instance.linkTarget,
    };

_HomeFeed _$HomeFeedFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_HomeFeed', json, ($checkedConvert) {
      final val = _HomeFeed(
        banners: $checkedConvert(
          'banners',
          (v) => (v as List<dynamic>)
              .map((e) => PromoBanner.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        categories: $checkedConvert(
          'categories',
          (v) => (v as List<dynamic>)
              .map((e) => Category.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        featuredProducts: $checkedConvert(
          'featuredProducts',
          (v) => (v as List<dynamic>)
              .map((e) => Product.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        exclusiveOffers: $checkedConvert(
          'exclusiveOffers',
          (v) => (v as List<dynamic>)
              .map((e) => Product.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        isStale: $checkedConvert('isStale', (v) => v as bool? ?? false),
      );
      return val;
    });

Map<String, dynamic> _$HomeFeedToJson(_HomeFeed instance) => <String, dynamic>{
  'banners': instance.banners.map((e) => e.toJson()).toList(),
  'categories': instance.categories.map((e) => e.toJson()).toList(),
  'featuredProducts': instance.featuredProducts.map((e) => e.toJson()).toList(),
  'exclusiveOffers': instance.exclusiveOffers.map((e) => e.toJson()).toList(),
  'isStale': instance.isStale,
};
