import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rehlaa/core/design_system/theme/app_theme.dart';
import 'package:rehlaa/core/network/connectivity_service.dart';
import 'package:rehlaa/features/cart/data/repositories/mock_cart_repository.dart';
import 'package:rehlaa/features/catalog/data/mock/catalog_mock_data.dart';
import 'package:rehlaa/features/favorites/data/repositories/mock_favorites_repository.dart';
import 'package:rehlaa/features/product_details/presentation/pages/commerce_product_details_page.dart';
import 'package:rehlaa/generated/l10n/app_localizations.dart';

void main() {
  testWidgets('purchase actions stay disabled while catalog is offline', (
    tester,
  ) async {
    final product = CatalogMockData.homeFeed.featuredProducts.first;

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          cartRepositoryProvider.overrideWithValue(MockCartRepository()),
          favoritesRepositoryProvider.overrideWithValue(
            MockFavoritesRepository(),
          ),
          isOnlineProvider.overrideWith((ref) => Stream.value(false)),
        ],
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: CommerceProductDetailsPage(
            productId: product.id,
            initialProduct: product,
          ),
        ),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    final option = find.text('1 Month');
    await tester.ensureVisible(option);
    await tester.pump();
    await tester.tap(option);
    await tester.pump();

    expect(
      tester
          .widget<ElevatedButton>(find.byKey(const Key('add_to_cart_btn')))
          .onPressed,
      isNull,
    );
    expect(
      tester
          .widget<ElevatedButton>(find.byKey(const Key('buy_now_btn')))
          .onPressed,
      isNull,
    );
  });

  testWidgets('Dark Arabic options flow saves favorite and cart line at 200%', (
    tester,
  ) async {
    tester.view
      ..physicalSize = const Size(390, 844)
      ..devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final product = CatalogMockData.homeFeed.featuredProducts.first;
    final cartRepository = MockCartRepository();
    final favoritesRepository = MockFavoritesRepository();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          cartRepositoryProvider.overrideWithValue(cartRepository),
          favoritesRepositoryProvider.overrideWithValue(favoritesRepository),
          isOnlineProvider.overrideWith((ref) => Stream.value(true)),
        ],
        child: MaterialApp(
          locale: const Locale('ar'),
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.dark,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: const TextScaler.linear(2)),
            child: child!,
          ),
          home: CommerceProductDetailsPage(
            productId: product.id,
            initialProduct: product,
          ),
        ),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    await tester.tap(find.byKey(const Key('product_favorite_button')));
    await tester.pump(const Duration(milliseconds: 400));

    final option = find.text('شهر واحد');
    await tester.ensureVisible(option);
    await tester.pump();
    await tester.tap(option);
    await tester.pump();
    await tester.tap(find.byKey(const Key('add_to_cart_btn')));
    await tester.pump();

    expect(cartRepository.getCart().dataOrThrow.items, hasLength(1));
    expect(
      cartRepository.getCart().dataOrThrow.items.single.id,
      '${product.id}_val_1_month',
    );
    final favoriteResult = favoritesRepository.isFavorite(product.id);
    await tester.pump(const Duration(milliseconds: 100));
    expect((await favoriteResult).dataOrThrow, isTrue);
    expect(tester.takeException(), isNull);
  });
}
