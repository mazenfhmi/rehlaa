import 'package:flutter_test/flutter_test.dart';
import 'package:rehlaa/core/result/result.dart';
import 'package:rehlaa/features/cart/data/repositories/mock_cart_repository.dart';
import 'package:rehlaa/features/cart/domain/entities/cart.dart';
import 'package:rehlaa/features/cart/domain/entities/cart_item.dart';
import 'package:rehlaa/features/catalog/data/mock/catalog_mock_data.dart';
import 'package:rehlaa/features/product_details/domain/entities/product_selection.dart';
import 'package:rehlaa/shared/domain/money/money.dart';

void main() {
  test('rejects a cart line with quantity below one', () {
    final repository = MockCartRepository();
    final product = CatalogMockData.homeFeed.featuredProducts.first;
    const selection = ProductSelection(
      optionValueIds: {'s'},
      optionSignature: 's',
      resolvedPrice: Money.sdg(1000),
      isComplete: true,
      selectedRequiredCount: 1,
    );
    final invalidCart = Cart(
      items: [CartItem(product: product, selection: selection, quantity: 0)],
      subtotal: const Money.sdg(0),
    );

    final result = repository.saveCart(invalidCart);

    expect(result, isA<Failure<Cart>>());
    expect((result as Failure<Cart>).failure, isA<ValidationFailure>());
    expect(repository.getCart().dataOrThrow.items, isEmpty);
  });
}
