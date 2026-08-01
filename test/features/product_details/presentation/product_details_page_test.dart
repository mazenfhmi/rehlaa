import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rehlaa/features/product_details/domain/entities/product_selection.dart';
import 'package:rehlaa/features/product_details/presentation/pages/product_details_page.dart';
import 'package:rehlaa/generated/l10n/app_localizations.dart';
import 'package:rehlaa/shared/domain/catalog/product.dart';
import 'package:rehlaa/shared/domain/catalog/product_option_group.dart';
import 'package:rehlaa/shared/domain/money/money.dart';
import 'package:rehlaa/shared/presentation/widgets/product_price.dart';
import 'package:rehlaa/shared/presentation/widgets/product_rating.dart';

void main() {
  late Product fixtureProduct;

  setUp(() {
    fixtureProduct = const Product(
      id: 'p1',
      categoryId: 'c1',
      nameAr: 'اختبار',
      nameEn: 'Test Product',
      descriptionAr: 'وصف',
      descriptionEn: 'Desc',
      imageUrl: 'test.jpg',
      galleryUrls: ['gallery-1.jpg', 'gallery-2.jpg'],
      basePrice: Money(minorUnits: 1000, currencyCode: 'SDG'), // 10.00
      rating: 4.5,
      reviewCount: 10,
      stockStatus: StockStatus.inStock,
      isFeatured: false,
      optionGroups: [
        ProductOptionGroup(
          id: 'size',
          nameAr: 'الحجم',
          nameEn: 'Size',
          isRequired: true,
          values: [
            ProductOptionValue(
              id: 's',
              nameAr: 'صغير',
              nameEn: 'S',
              priceDelta: Money(minorUnits: 0, currencyCode: 'SDG'),
            ),
          ],
        ),
      ],
    );
  });

  Widget buildApp(
    Product product, {
    Locale locale = const Locale('en'),
    bool useDarkTheme = false,
    double textScale = 1,
    ProductPurchaseCallback? onAddToCart,
    ProductPurchaseCallback? onBuyNow,
  }) => ProviderScope(
    child: MaterialApp(
      locale: locale,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: useDarkTheme ? ThemeMode.dark : ThemeMode.light,
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(
          context,
        ).copyWith(textScaler: TextScaler.linear(textScale)),
        child: child!,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: ProductDetailsPage(
        product: product,
        onAddToCart: onAddToCart,
        onBuyNow: onBuyNow,
      ),
    ),
  );

  testWidgets(
    'Add to Cart and Buy Now are disabled when required selections are incomplete',
    (tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(buildApp(fixtureProduct));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      final addToCartBtn = tester.widget<ElevatedButton>(
        find.byKey(const Key('add_to_cart_btn')),
      );
      expect(addToCartBtn.onPressed, isNull);

      final buyNowBtn = tester.widget<ElevatedButton>(
        find.byKey(const Key('buy_now_btn')),
      );
      expect(buyNowBtn.onPressed, isNull);

      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
    },
  );

  testWidgets('renders complete product details in Dark Arabic at 200%', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(
      buildApp(
        fixtureProduct,
        locale: const Locale('ar'),
        useDarkTheme: true,
        textScale: 2,
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.byKey(const Key('product_media_gallery')), findsOneWidget);
    expect(find.byKey(const Key('product_favorite_button')), findsOneWidget);
    expect(find.byType(ProductRating), findsOneWidget);
    expect(find.text('اختبار'), findsWidgets);
    expect(find.textContaining('الحجم'), findsOneWidget);
    expect(find.text('الكمية'), findsOneWidget);
    expect(find.text('أضف إلى السلة'), findsOneWidget);
    final priceText = tester.widget<Text>(
      find
          .descendant(
            of: find.byType(ProductPrice).first,
            matching: find.byType(Text),
          )
          .first,
    );
    final colorScheme = Theme.of(
      tester.element(find.byType(ProductDetailsPage)),
    ).colorScheme;
    expect(priceText.style?.color, colorScheme.onSurface);
    expect(tester.takeException(), isNull);

    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });

  testWidgets('selection enables purchase and quantity can be increased', (
    tester,
  ) async {
    ProductSelection? submittedSelection;
    int? submittedQuantity;
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(
      buildApp(
        fixtureProduct,
        onAddToCart: (selection, quantity) {
          submittedSelection = selection;
          submittedQuantity = quantity;
        },
        onBuyNow: (_, _) {},
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    await tester.tap(find.text('S'));
    await tester.pump();

    expect(
      tester
          .widget<ElevatedButton>(find.byKey(const Key('add_to_cart_btn')))
          .onPressed,
      isNotNull,
    );
    expect(
      tester
          .widget<ElevatedButton>(find.byKey(const Key('buy_now_btn')))
          .onPressed,
      isNotNull,
    );

    await tester.tap(find.byKey(const Key('quantity_increment')));
    await tester.pump();
    expect(find.text('2'), findsOneWidget);

    await tester.tap(find.byKey(const Key('add_to_cart_btn')));
    expect(submittedSelection?.optionSignature, 's');
    expect(submittedQuantity, 2);

    await tester.tap(find.byKey(const Key('quantity_decrement')));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);

    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });
}
