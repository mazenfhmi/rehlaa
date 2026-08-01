import 'package:rehlaa/features/home/domain/entities/home_feed.dart';
import 'package:rehlaa/shared/domain/catalog/product.dart';

class HomeViewState {
  const HomeViewState({required this.feed, this.selectedCategoryId});

  final HomeFeed feed;
  final String? selectedCategoryId;

  List<Product> get visibleFeaturedProducts {
    final categoryId = selectedCategoryId;
    if (categoryId == null) return feed.featuredProducts;
    return feed.featuredProducts
        .where((product) => product.categoryId == categoryId)
        .toList(growable: false);
  }

  HomeViewState copyWith({
    HomeFeed? feed,
    String? selectedCategoryId,
    bool clearSelectedCategory = false,
  }) => HomeViewState(
    feed: feed ?? this.feed,
    selectedCategoryId: clearSelectedCategory
        ? null
        : selectedCategoryId ?? this.selectedCategoryId,
  );
}
