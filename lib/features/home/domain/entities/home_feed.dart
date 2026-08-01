import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehlaa/shared/domain/catalog/category.dart';
import 'package:rehlaa/shared/domain/catalog/product.dart';

part 'home_feed.freezed.dart';
part 'home_feed.g.dart';

@freezed
abstract class PromoBanner with _$PromoBanner {
  const factory PromoBanner({
    required String id,
    required String imageUrl,
    required String linkTarget,
  }) = _PromoBanner;

  factory PromoBanner.fromJson(Map<String, dynamic> json) =>
      _$PromoBannerFromJson(json);
}

@freezed
abstract class HomeFeed with _$HomeFeed {
  const factory HomeFeed({
    required List<PromoBanner> banners,
    required List<Category> categories,
    required List<Product> featuredProducts,
    required List<Product> exclusiveOffers,
    @Default(false) bool isStale,
  }) = _HomeFeed;

  factory HomeFeed.fromJson(Map<String, dynamic> json) =>
      _$HomeFeedFromJson(json);
}
