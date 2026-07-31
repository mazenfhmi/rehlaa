import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_category.freezed.dart';
part 'home_category.g.dart';

/// Represents a category item on the home page.
@freezed
abstract class HomeCategory with _$HomeCategory {
  const factory HomeCategory({
    required String id,
    required String titleAr,
    required String titleEn,
    required String svgIcon,
    @Default(false) bool isSelected,
  }) = _HomeCategory;

  factory HomeCategory.fromJson(Map<String, dynamic> json) =>
      _$HomeCategoryFromJson(json);
}
