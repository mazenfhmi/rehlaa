# Flutter Catalog and Cart Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** تنفيذ Home والكتالوج وتفاصيل المنتج والخيارات والمفضلة والسلة، ببيانات Mock وتخزين قراءة محلي وحالات Offline واضحة.

**Architecture:** تشترك ميزات Home وCatalog وProduct Details في Product entities موحدة داخل `shared/domain/catalog`. تبقى المفضلة والسلة بعقود مستقلة، وتستخدم Widgets المنتجات المشتركة في `shared/presentation/widgets`.

**Tech Stack:** Riverpod، Freezed، Drift، cached_network_image، flutter_svg، go_router، mocktail.

## Global Constraints

- لا منطق أسعار أو خيارات داخل Widgets.
- المنتج في السلة يحدد بواسطة productId + optionSignature.
- المفضلة ترتبط بالمنتج فقط.
- البيانات المقروءة يمكن عرضها Offline، والشراء معطل Offline.
- عقد الواجهة الملزم: `doc/specs/2026-08-01-ui-design-system.md`.
- Home تتبع: Search/Actions → PromoBanner → Categories → Exclusive Offers → Product Sections.
- جميع Product/Category/Promo widgets typed، مترجمة، وتستهلك semantic theme roles فقط.
- التسليم البصري يثبت Light/Dark وRTL/LTR و48×48 و200% text scale.

---

### Task 1: Define shared catalog entities and money value object

**Files:**
- Create: `lib/shared/domain/money/money.dart`
- Create: `lib/shared/domain/catalog/product.dart`
- Create: `lib/shared/domain/catalog/category.dart`
- Create: `lib/shared/domain/catalog/product_option_group.dart`
- Test: `test/shared/domain/money_test.dart`

**Interfaces:**
- Produces: `Money(currencyCode: 'SDG', minorUnits: int)`.
- Produces: immutable Product and option entities.

- [ ] **Step 1: Write money tests**

```dart
test('adds amounts with the same currency', () {
  const left = Money.sdg(500000);
  const right = Money.sdg(100000);
  expect((left + right).minorUnits, 600000);
});

test('rejects mixed currencies', () {
  expect(() => const Money('SDG', 1) + const Money('USD', 1), throwsStateError);
});
```

- [ ] **Step 2: Implement Money without double**

Store SDG values in hundredths: 5,000.00 SDG = `500000` minor units.

- [ ] **Step 3: Implement Product entities**

Include bilingual names, media, base price, compare-at price, rating, review count, stock status, featured flag, option groups, and option values.

- [ ] **Step 4: Generate, test, commit**

```bash
dart run build_runner build
flutter test test/shared/domain/money_test.dart
git add lib/shared/domain test/shared/domain
git commit -m "feat(catalog): add shared product and money domain"
```

### Task 2: Implement catalog Mock repository and local read cache

**Files:**
- Create: `lib/features/catalog/domain/repositories/catalog_repository.dart`
- Create: `lib/features/catalog/data/mock/catalog_mock_data.dart`
- Create: `lib/features/catalog/data/repositories/mock_catalog_repository.dart`
- Create: `lib/features/catalog/data/data_sources/catalog_local_data_source.dart`
- Test: `test/features/catalog/data/mock_catalog_repository_test.dart`

**Interfaces:**
- Produces: `getHomeFeed`, `getProducts`, `getProductById`, `getCategories`.
- Produces: cache write/read methods for catalog snapshots.

- [ ] **Step 1: Write repository tests**

Assert deterministic products matching supplied screens, including Google One + Gemini Pro at 135,000 SDG and compare-at 399,000 SDG.

- [ ] **Step 2: Implement Mock feed**

Provide banners, categories, featured products, ratings, stock badges, and option groups.

- [ ] **Step 3: Implement cache policy**

On successful mock read, persist snapshot and timestamp. When Offline, return cache with `isStale: true`; if no cache, return `OfflineFailure`.

- [ ] **Step 4: Test and commit**

```bash
flutter test test/features/catalog/data/mock_catalog_repository_test.dart
git add lib/features/catalog test/features/catalog
git commit -m "feat(catalog): add mock repository and offline read cache"
```

### Task 3: Build shared product widgets

**Files:**
- Create: `lib/shared/presentation/widgets/product_card.dart`
- Create: `lib/shared/presentation/widgets/product_horizontal_card.dart`
- Create: `lib/shared/presentation/widgets/product_price.dart`
- Create: `lib/shared/presentation/widgets/product_rating.dart`
- Create: `lib/shared/presentation/widgets/favorite_button.dart`
- Test: `test/shared/presentation/product_card_test.dart`

**Interfaces:**
- Produces: widgets with plain data and callbacks, no provider reads.

- [ ] **Step 1: Write card rendering test**

```dart
testWidgets('renders discounted price and featured badge', (tester) async {
  await tester.pumpWidget(testApp(ProductCard(product: fixtureProduct, onTap: () {})));
  expect(find.text('135,000 SDG'), findsOneWidget);
  expect(find.text('399,000 SDG'), findsOneWidget);
  expect(find.text('Featured'), findsOneWidget);
});
```

- [ ] **Step 2: Implement cards using design tokens**

Use `AppNetworkImage`, `ProductPrice`, `ProductRating`, and `FavoriteButton`; support compact and grid variants through typed constructors.

The grid variant uses square `surfaceMuted` media with radius 12, a two-line
name, localized current and compare-at prices, an optional status badge, and a
48-pixel favorite target. Add typed `compact`, `grid`, and `horizontal`
variants; none reads providers or calculates price.

- [ ] **Step 3: Test RTL/LTR and commit**

```bash
flutter test test/shared/presentation/product_card_test.dart
git add lib/shared/presentation/widgets test/shared/presentation
git commit -m "feat(ui): add reusable product widgets"
```

### Task 4: Implement Home page composition

**Files:**
- Create: `lib/features/home/domain/entities/home_feed.dart`
- Create: `lib/features/home/presentation/view_models/home_view_model.dart`
- Create: widgets `home_header.dart`, `home_search_field.dart`, `hero_carousel.dart`, `trust_benefits.dart`, `category_section.dart`, `exclusive_offers.dart`
- Modify: `lib/features/home/presentation/pages/home_page.dart`
- Test: `test/features/home/presentation/home_page_test.dart`

**Interfaces:**
- Produces: `HomeViewModel.refresh()` and `selectCategory(String?)`.

- [ ] **Step 1: Write page state tests**

Test success, loading, offline-cache banner, and empty offers.

- [ ] **Step 2: Implement ViewModel**

Keep selected category separate from fetched feed and derive filtered offers via provider.

- [ ] **Step 3: Compose thin page**

`HomePage` composes six widgets and contains no raw styling or repository calls.

It watches the Home ViewModel and connectivity state, preserves
Loading/Empty/Error/Offline, uses a 20-pixel section rhythm, and delegates
selection through typed callbacks. Static lists copied from `ui.txt` are not
allowed inside presentation widgets.

- [ ] **Step 4: Test and commit**

```bash
flutter test test/features/home/presentation/home_page_test.dart
git add lib/features/home test/features/home
git commit -m "feat(home): build marketplace home page"
```

### Task 5: Implement product option selection and pricing

**Files:**
- Create: `lib/features/product_details/domain/entities/product_selection.dart`
- Create: `lib/features/product_details/domain/use_cases/resolve_product_selection.dart`
- Create: `lib/features/product_details/presentation/view_models/product_details_view_model.dart`
- Test: `test/features/product_details/domain/resolve_product_selection_test.dart`

**Interfaces:**
- Produces: `ProductSelection(optionValueIds, optionSignature, resolvedPrice, isComplete)`.
- Produces: stable sorted option signature.

- [ ] **Step 1: Write option resolution tests**

```dart
test('selection is incomplete until all required groups are selected', () {
  final result = useCase(product: fixtureProduct, selectedValueIds: const {'year'});
  expect(result.isComplete, isFalse);
  expect(result.selectedRequiredCount, 1);
});
```

- [ ] **Step 2: Implement deterministic signature**

```dart
final signature = [...selectedValueIds]..sort();
return signature.join(':');
```

- [ ] **Step 3: Implement price resolution in domain**

Use base price plus option deltas; never calculate inside UI.

- [ ] **Step 4: Test and commit**

```bash
flutter test test/features/product_details/domain/resolve_product_selection_test.dart
git add lib/features/product_details/domain lib/features/product_details/presentation/view_models test/features/product_details/domain
git commit -m "feat(product): resolve required options and variant pricing"
```

### Task 6: Build Product Details page

**Files:**
- Create: `lib/features/product_details/presentation/pages/product_details_page.dart`
- Create: widgets `product_hero.dart`, `product_metadata_card.dart`, `product_option_group.dart`, `selection_validation_message.dart`, `purchase_bar.dart`
- Test: `test/features/product_details/presentation/product_details_page_test.dart`

**Interfaces:**
- Consumes: ProductDetailsViewModel.
- Produces: callbacks `addToCart()` and `buyNow()` only when selection complete.

**Visual composition:** `ProductMediaGallery` on `surfaceMuted`,
`ProductDetailsSurface` with radius-40 top corners, `FavoriteButton`,
`ProductRating`, typed option selectors, quantity selector, localized price,
and a safe-area sticky purchase action. Content remains scrollable at 200%
text scaling and no action covers content.

- [ ] **Step 1: Write disabled purchase test**

Ensure `Add to Cart` and `Buy Now` are disabled when required selections are incomplete.

- [ ] **Step 2: Implement sticky purchase bar**

Place above bottom safe area; reflect resolved price and selection count.

- [ ] **Step 3: Test light/RTL and commit**

```bash
flutter test test/features/product_details/presentation/product_details_page_test.dart
git add lib/features/product_details/presentation test/features/product_details/presentation
git commit -m "feat(product): add product details and option selection ui"
```

### Task 7: Implement Favorites feature

**Files:**
- Create: `lib/features/favorites/domain/repositories/favorites_repository.dart`
- Create: `lib/features/favorites/data/repositories/mock_favorites_repository.dart`
- Create: `lib/features/favorites/presentation/view_models/favorites_view_model.dart`
- Create: `lib/features/favorites/presentation/pages/favorites_page.dart`
- Test: `test/features/favorites/favorites_view_model_test.dart`

**Interfaces:**
- Produces: `toggleFavorite(productId)` with optimistic update and rollback.

- [ ] **Step 1: Write optimistic update test**

Verify product disappears immediately and returns if repository returns failure.

- [ ] **Step 2: Implement repository uniqueness**

Use `Set<String>` product IDs in Mock storage.

- [ ] **Step 3: Compose page with ProductCard grid and Empty State**

- [ ] **Step 4: Test and commit**

```bash
flutter test test/features/favorites
git add lib/features/favorites test/features/favorites
git commit -m "feat(favorites): add optimistic favorites management"
```

### Task 8: Implement Cart domain and screens

**Files:**
- Create: `lib/features/cart/domain/entities/cart.dart`
- Create: `lib/features/cart/domain/entities/cart_item.dart`
- Create: `lib/features/cart/domain/repositories/cart_repository.dart`
- Create: `lib/features/cart/data/repositories/mock_cart_repository.dart`
- Create: `lib/features/cart/presentation/view_models/cart_view_model.dart`
- Create: `lib/features/cart/presentation/pages/cart_page.dart`
- Create: widgets `empty_cart_content.dart`, `cart_item_tile.dart`, `cart_summary_bar.dart`
- Test: `test/features/cart/cart_view_model_test.dart`

**Interfaces:**
- Produces: add, remove, update quantity, clear.
- Enforces: `productId + optionSignature` identity.

- [ ] **Step 1: Write merge identity test**

Same product and signature increments quantity; same product with different signature creates a new line.

- [ ] **Step 2: Implement repository and ViewModel**

Reject quantity below 1 and keep subtotal in Money.

- [ ] **Step 3: Build empty and populated states**

Empty state matches supplied illustration layout; populated state uses shared product widgets and sticky summary.

The populated state uses the horizontal ProductCard language and a radius-30
`CartSummaryBar`. Delete/swipe actions are directional, accessible, and never
identify a cart item without its `productId + optionSignature`.

- [ ] **Step 4: Run full catalog flow test**

```bash
flutter test test/features/catalog test/features/product_details test/features/favorites test/features/cart
flutter analyze
```

- [ ] **Step 5: Commit**

```bash
git add lib/features/cart test/features/cart
git commit -m "feat(cart): add option aware cart and empty state"
```
