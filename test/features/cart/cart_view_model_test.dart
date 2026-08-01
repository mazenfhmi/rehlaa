import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rehlaa/features/cart/presentation/view_models/cart_view_model.dart';
import 'package:rehlaa/features/catalog/data/mock/catalog_mock_data.dart';
import 'package:rehlaa/features/product_details/domain/entities/product_selection.dart';
import 'package:rehlaa/shared/domain/money/money.dart';

void main() {
  test('restores cart from repository after provider rebuild', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final subscription = container.listen(cartViewModelProvider, (_, _) {});
    addTearDown(subscription.close);
    final viewModel = container.read(cartViewModelProvider.notifier);
    final product = CatalogMockData.homeFeed.featuredProducts.first;

    const selection = ProductSelection(
      optionValueIds: {'s'},
      optionSignature: 's',
      resolvedPrice: Money(minorUnits: 1000, currencyCode: 'SDG'),
      isComplete: true,
      selectedRequiredCount: 1,
    );

    viewModel.addItem(product, selection, 2);
    container.invalidate(cartViewModelProvider);

    final restoredCart = container.read(cartViewModelProvider);
    expect(restoredCart.items, hasLength(1));
    expect(restoredCart.items.single.quantity, 2);
    expect(restoredCart.subtotal, const Money.sdg(2000));
  });

  test(
    'Same product and signature increments quantity; different signature creates new line',
    () {
      final container = ProviderContainer();
      final viewModel = container.read(cartViewModelProvider.notifier);

      final product = CatalogMockData.homeFeed.featuredProducts.first;

      const selection1 = ProductSelection(
        optionValueIds: {'s'},
        optionSignature: 's',
        resolvedPrice: Money(minorUnits: 1000, currencyCode: 'SDG'),
        isComplete: true,
        selectedRequiredCount: 1,
      );

      const selection2 = ProductSelection(
        optionValueIds: {'m'},
        optionSignature: 'm',
        resolvedPrice: Money(minorUnits: 1200, currencyCode: 'SDG'),
        isComplete: true,
        selectedRequiredCount: 1,
      );

      viewModel.addItem(product, selection1);
      expect(container.read(cartViewModelProvider).items.length, 1);
      expect(container.read(cartViewModelProvider).items.first.quantity, 1);

      viewModel.addItem(product, selection1, 2);
      expect(container.read(cartViewModelProvider).items.length, 1);
      expect(container.read(cartViewModelProvider).items.first.quantity, 3);

      viewModel.addItem(product, selection2);
      expect(container.read(cartViewModelProvider).items.length, 2);
      expect(container.read(cartViewModelProvider).items.last.quantity, 1);

      expect(container.read(cartViewModelProvider).subtotal.minorUnits, 4200);
    },
  );

  test('does not merge a different currency into the cart subtotal', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final viewModel = container.read(cartViewModelProvider.notifier);
    final product = CatalogMockData.homeFeed.featuredProducts.first;

    const sdgSelection = ProductSelection(
      optionValueIds: {'sdg'},
      optionSignature: 'sdg',
      resolvedPrice: Money(minorUnits: 1000, currencyCode: 'SDG'),
      isComplete: true,
      selectedRequiredCount: 1,
    );
    const usdSelection = ProductSelection(
      optionValueIds: {'usd'},
      optionSignature: 'usd',
      resolvedPrice: Money(minorUnits: 500, currencyCode: 'USD'),
      isComplete: true,
      selectedRequiredCount: 1,
    );

    viewModel
      ..addItem(product, sdgSelection)
      ..addItem(product, usdSelection);

    final cart = container.read(cartViewModelProvider);
    expect(cart.items, hasLength(1));
    expect(cart.subtotal, const Money.sdg(1000));
  });
}
