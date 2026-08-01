import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehlaa/shared/domain/catalog/product_option_group.dart';
import 'package:rehlaa/shared/domain/money/money.dart';

part 'product.freezed.dart';
part 'product.g.dart';

enum StockStatus { inStock, outOfStock, lowStock }

@freezed
abstract class Product with _$Product {
  const factory Product({
    required String id,
    required String categoryId,
    required String nameAr,
    required String nameEn,
    required String descriptionAr,
    required String descriptionEn,
    required String imageUrl,
    required List<String> galleryUrls,
    required Money basePrice,
    required double rating,
    required int reviewCount,
    required StockStatus stockStatus,
    required bool isFeatured,
    required List<ProductOptionGroup> optionGroups,
    Money? compareAtPrice,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
