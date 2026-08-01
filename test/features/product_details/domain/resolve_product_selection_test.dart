import 'package:flutter_test/flutter_test.dart';
import 'package:rehlaa/features/product_details/domain/use_cases/resolve_product_selection.dart';
import 'package:rehlaa/shared/domain/catalog/product.dart';
import 'package:rehlaa/shared/domain/catalog/product_option_group.dart';
import 'package:rehlaa/shared/domain/money/money.dart';

void main() {
  late ResolveProductSelection useCase;
  late Product fixtureProduct;

  setUp(() {
    useCase = ResolveProductSelection();
    fixtureProduct = const Product(
      id: 'p1',
      categoryId: 'c1',
      nameAr: 'اختبار',
      nameEn: 'Test',
      descriptionAr: 'اختبار',
      descriptionEn: 'Test',
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
            ProductOptionValue(id: 'm', nameAr: 'وسط', nameEn: 'M', priceDelta: Money(minorUnits: 200, currencyCode: 'SDG')),
          ],
        ),
        ProductOptionGroup(
          id: 'color',
          nameAr: 'اللون',
          nameEn: 'Color',
          isRequired: true,
          values: [
            ProductOptionValue(id: 'red', nameAr: 'أحمر', nameEn: 'Red', priceDelta: Money(minorUnits: 0, currencyCode: 'SDG')),
          ],
        ),
        ProductOptionGroup(
          id: 'extras',
          nameAr: 'إضافات',
          nameEn: 'Extras',
          isRequired: false,
          values: [
            ProductOptionValue(id: 'gift', nameAr: 'تغليف', nameEn: 'Gift Wrap', priceDelta: Money(minorUnits: 500, currencyCode: 'SDG')),
          ],
        ),
      ],
    );
  });

  test('selection is incomplete until all required groups are selected', () {
    final result = useCase(product: fixtureProduct, selectedValueIds: const {'s'});
    expect(result.isComplete, isFalse);
    expect(result.selectedRequiredCount, 1);
  });

  test('selection is complete when all required groups are selected', () {
    final result = useCase(product: fixtureProduct, selectedValueIds: const {'s', 'red'});
    expect(result.isComplete, isTrue);
    expect(result.selectedRequiredCount, 2);
    expect(result.resolvedPrice.minorUnits, 1000);
  });

  test('generates sorted signature', () {
    final result = useCase(product: fixtureProduct, selectedValueIds: const {'red', 's'});
    expect(result.optionSignature, 'red:s'); // sorted alphabetically
  });

  test('resolves correct price based on selection', () {
    final result = useCase(product: fixtureProduct, selectedValueIds: const {'m', 'red', 'gift'});
    // base: 1000, m: 200, gift: 500 -> 1700
    expect(result.resolvedPrice.minorUnits, 1700);
  });
}
