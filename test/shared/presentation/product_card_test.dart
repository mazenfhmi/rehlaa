import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rehlaa/shared/domain/catalog/product.dart';
import 'package:rehlaa/shared/domain/money/money.dart';
import 'package:rehlaa/shared/presentation/widgets/product_card.dart';

Widget testApp(Widget child) {
  return MaterialApp(
    home: Scaffold(body: child),
  );
}

void main() {
  final fixtureProduct = Product(
    id: 'prod_google_one',
    categoryId: 'cat_subscriptions',
    nameAr: 'جوجل ون + جيميناي برو',
    nameEn: 'Google One + Gemini Pro',
    descriptionAr: 'اشتراك جوجل ون',
    descriptionEn: 'Google One',
    imageUrl: 'https://placehold.co/400',
    galleryUrls: const [],
    basePrice: const Money.sdg(13500000), // 135,000 SDG
    compareAtPrice: const Money.sdg(39900000), // 399,000 SDG
    rating: 4.8,
    reviewCount: 120,
    stockStatus: StockStatus.inStock,
    isFeatured: true,
    optionGroups: const [],
  );

  testWidgets('renders discounted price and featured badge', (tester) async {
    await tester.pumpWidget(testApp(Center(
      child: SizedBox(
        width: 200,
        child: ProductCard.grid(
          product: fixtureProduct,
          onTap: () {},
        ),
      ),
    )));

    expect(find.text('135,000 SDG'), findsOneWidget);
    expect(find.text('399,000 SDG'), findsOneWidget);
    expect(find.text('Featured'), findsOneWidget);
  });
}
