import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rehlaa/features/product_details/presentation/pages/product_details_page.dart';
import 'package:rehlaa/generated/l10n/app_localizations.dart';
import 'package:rehlaa/shared/domain/catalog/product.dart';
import 'package:rehlaa/shared/domain/catalog/product_option_group.dart';
import 'package:rehlaa/shared/domain/money/money.dart';

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
      galleryUrls: [],
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
            ProductOptionValue(id: 's', nameAr: 'صغير', nameEn: 'S', priceDelta: Money(minorUnits: 0, currencyCode: 'SDG')),
          ],
        ),
      ],
    );
  });

  Widget buildApp(Product product) => ProviderScope(
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: ProductDetailsPage(product: product),
      ),
    );

  testWidgets('Add to Cart and Buy Now are disabled when required selections are incomplete', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(buildApp(fixtureProduct));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    final addToCartBtn = tester.widget<ElevatedButton>(find.byKey(const Key('add_to_cart_btn')));
    expect(addToCartBtn.onPressed, isNull);

    final buyNowBtn = tester.widget<ElevatedButton>(find.byKey(const Key('buy_now_btn')));
    expect(buyNowBtn.onPressed, isNull);

    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });
}
