import 'package:rehlaa/features/home/domain/entities/home_feed.dart';
import 'package:rehlaa/shared/domain/catalog/category.dart';
import 'package:rehlaa/shared/domain/catalog/product.dart';
import 'package:rehlaa/shared/domain/catalog/product_option_group.dart';
import 'package:rehlaa/shared/domain/money/money.dart';

class CatalogMockData {
  static final List<Category> categories = [
    const Category(
      id: 'cat_subscriptions',
      nameAr: 'الاشتراكات',
      nameEn: 'Subscriptions',
      imageUrl: 'https://placehold.co/100/orange/white?text=Sub',
    ),
    const Category(
      id: 'cat_games',
      nameAr: 'بطاقات الألعاب',
      nameEn: 'Game Cards',
      imageUrl: 'https://placehold.co/100/blue/white?text=Games',
    ),
  ];

  static final List<Product> products = [
    const Product(
      id: 'prod_google_one',
      categoryId: 'cat_subscriptions',
      nameAr: 'جوجل ون + جيميناي برو',
      nameEn: 'Google One + Gemini Pro',
      descriptionAr: 'اشتراك جوجل ون مع جيميناي برو لمدة شهر',
      descriptionEn: 'Google One with Gemini Pro for one month',
      imageUrl: 'https://placehold.co/400/orange/white?text=G1',
      galleryUrls: ['https://placehold.co/400/orange/white?text=G1'],
      basePrice: Money.sdg(13500000), // 135,000.00 SDG
      compareAtPrice: Money.sdg(39900000), // 399,000.00 SDG
      rating: 4.8,
      reviewCount: 120,
      stockStatus: StockStatus.inStock,
      isFeatured: true,
      optionGroups: [
        ProductOptionGroup(
          id: 'opt_duration',
          nameAr: 'المدة',
          nameEn: 'Duration',
          isRequired: true,
          values: [
            ProductOptionValue(
              id: 'val_1_month',
              nameAr: 'شهر واحد',
              nameEn: '1 Month',
              priceDelta: Money.sdg(0),
            ),
            ProductOptionValue(
              id: 'val_12_months',
              nameAr: '12 شهر',
              nameEn: '12 Months',
              priceDelta: Money.sdg(120000000),
            ),
          ],
        ),
      ],
    ),
  ];

  static final List<PromoBanner> banners = [
    const PromoBanner(
      id: 'banner_1',
      imageUrl: 'https://placehold.co/800x400/purple/white?text=Promo',
      linkTarget: '/products/prod_google_one',
    ),
  ];

  static HomeFeed get homeFeed => HomeFeed(
        banners: banners,
        categories: categories,
        featuredProducts: products.where((p) => p.isFeatured).toList(),
        exclusiveOffers: products.where((p) => p.compareAtPrice != null).toList(),
      );
}
