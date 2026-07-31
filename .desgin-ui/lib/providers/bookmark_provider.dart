import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product_model.dart';

class BookmarkNotifier extends StateNotifier<List<ProductModel>> {
  BookmarkNotifier() : super(demoPopularProducts.take(3).toList());

  void toggleBookmark(ProductModel product) {
    final isBookmarked = state.any((p) => p.title == product.title);
    if (isBookmarked) {
      state = state.where((p) => p.title != product.title).toList();
    } else {
      state = [...state, product];
    }
  }

  bool isBookmarked(ProductModel product) {
    return state.any((p) => p.title == product.title);
  }
}

final bookmarkProvider =
    StateNotifierProvider<BookmarkNotifier, List<ProductModel>>((ref) {
  return BookmarkNotifier();
});
