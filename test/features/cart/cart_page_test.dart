import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rehlaa/core/design_system/theme/app_theme.dart';
import 'package:rehlaa/features/cart/data/repositories/mock_cart_repository.dart';
import 'package:rehlaa/features/cart/domain/entities/cart.dart';
import 'package:rehlaa/features/cart/domain/entities/cart_item.dart';
import 'package:rehlaa/features/cart/presentation/pages/cart_page.dart';
import 'package:rehlaa/features/catalog/data/mock/catalog_mock_data.dart';
import 'package:rehlaa/features/product_details/domain/entities/product_selection.dart';
import 'package:rehlaa/generated/l10n/app_localizations.dart';
import 'package:rehlaa/shared/domain/money/money.dart';

void main() {
  Widget buildApp({
    required MockCartRepository repository,
    Locale locale = const Locale('en'),
    ThemeMode themeMode = ThemeMode.light,
    double textScale = 1,
  }) => ProviderScope(
    overrides: [cartRepositoryProvider.overrideWithValue(repository)],
    child: MaterialApp(
      locale: locale,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(
          context,
        ).copyWith(textScaler: TextScaler.linear(textScale)),
        child: child!,
      ),
      home: const CartPage(),
    ),
  );

  testWidgets('shows localized empty cart in Dark Arabic at 200%', (
    tester,
  ) async {
    tester.view
      ..physicalSize = const Size(390, 844)
      ..devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      buildApp(
        repository: MockCartRepository(),
        locale: const Locale('ar'),
        themeMode: ThemeMode.dark,
        textScale: 2,
      ),
    );
    await tester.pump();

    expect(find.text('السلة'), findsOneWidget);
    expect(find.text('سلتك فارغة.'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('populated cart updates quantity and typed subtotal', (
    tester,
  ) async {
    tester.view
      ..physicalSize = const Size(390, 844)
      ..devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final repository = MockCartRepository();
    final product = CatalogMockData.homeFeed.featuredProducts.first;
    const selection = ProductSelection(
      optionValueIds: {'s'},
      optionSignature: 's',
      resolvedPrice: Money.sdg(1000),
      isComplete: true,
      selectedRequiredCount: 1,
    );
    final item = CartItem(product: product, selection: selection, quantity: 2);
    repository.saveCart(Cart(items: [item], subtotal: const Money.sdg(2000)));

    await tester.pumpWidget(buildApp(repository: repository));
    await tester.pump();

    expect(find.text(product.nameEn), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.text('20 SDG'), findsOneWidget);

    await tester.tap(find.byTooltip('Increase quantity'));
    await tester.pump();

    expect(find.text('3'), findsOneWidget);
    expect(find.text('30 SDG'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
