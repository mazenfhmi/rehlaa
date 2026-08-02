# MangoShop-Inspired Home Redesign Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** إعادة بناء الصفحة الرئيسية في Rehlaa بلغة MangoShop البصرية، مع Hero متعدد الطبقات وشريط Sliver مثبت وفئات وأقسام منتجات متجاوبة، مع الحفاظ على Riverpod والترجمة وRTL والوضعين الفاتح والداكن والوصولية.

**Architecture:** تبقى `HomeViewModel` و`HomeFeed` مصدر حالة وبيانات الصفحة، بينما تتحول `HomePage` إلى منسق Slivers لا يحتوي تفاصيل عرضية. تُبنى المكوّنات كـWidgets صغيرة تعتمد `ColorScheme` وDirectional APIs، وتحتفظ حالة Hero المؤقتة داخل مكوّنه فقط.

**Tech Stack:** Flutter 3 / Dart 3.12، Material، Riverpod 3، GoRouter، `intl`، `cached_network_image`، `flutter_test`، `mocktail`، ARB localization.

## Global Constraints

- التنفيذ على فرع `main` كما طلب المستخدم، مع commit مستقل بعد كل Task.
- المرجع البصري `mangoshop/` للقراءة فقط ولا يُضاف إلى Git.
- لا تُضاف مكتبة Carousel؛ استخدم `PageView` وSlivers من Flutter.
- لا تُنشأ بيانات طلبات أو شركاء أو عروض فئات وهمية؛ الأقسام التي لا يملكها `HomeFeed` لا تظهر.
- تحافظ الصفحة على معالجة الأخطاء الحالية: خطأ أولي حاجب، وفشل تحديث غير حاجب عند وجود بيانات مخزنة، وفشل صورة محلي.
- اللون الزخرفي `#00BFA5`، ولون الإجراء الفاتح `#00796B`، وخلفية الوضع الداكن `#071816`.
- الإنجليزية تستخدم Nunito عبر `google_fonts`، والعربية تستخدم Cairo عبر `google_fonts`.
- النص العادي يحقق تباين 4.5:1، ومناطق اللمس لا تقل عن 48×48.
- التخطيط يعمل عند TextScaler 2.0 وعلى عرض 320 نقطة منطقية دون overflow.
- استخدم `EdgeInsetsDirectional` و`AlignmentDirectional` و`PositionedDirectional` في المكوّنات الجديدة.
- كل نص مرئي جديد يأتي من `AppLocalizations`، ولا تُكتب العملات أو التواريخ يدويًا.
- تحترم Hero وSkeleton إعداد تقليل الحركة من `MediaQuery.disableAnimationsOf`.
- لا تعدل الملفات المولدة يدويًا؛ شغّل مولدات localization وRiverpod/Freezed عند الحاجة.
- ابدأ كل Task باختبار فاشل، ثم أقل تنفيذ ناجح، ثم تحقق، ثم commit.

---

## File Responsibility Map

### ملفات Design System

- `lib/core/design_system/tokens/app_colors.dart`: درجات الهوية والأسطح الدلالية الثابتة.
- `lib/core/design_system/tokens/app_gradients.dart`: تدرجات مبنية من `ColorScheme`.
- `lib/core/design_system/tokens/app_tokens.dart`: تصدير التدرجات الجديدة.
- `lib/core/design_system/theme/app_theme.dart`: إنشاء ColorScheme الفاتح والداكن وTextTheme حسب اللغة.
- `lib/app/app.dart`: تمرير اللغة الحالية إلى الثيم.
- `test/core/design_system/app_theme_test.dart`: التحقق من أدوار اللون والخط والتباين الأساسي.

### ملفات الترجمة والمشترك

- `lib/l10n/app_en.arb` و`lib/l10n/app_ar.arb`: كل نصوص الرئيسية والبطاقات الجديدة.
- `lib/features/home/presentation/widgets/home_section_header.dart`: عنوان قسم موحد وإجراء اتجاهي.
- `test/features/home/widgets/home_section_header_test.dart`: الترجمة والاتجاه ومساحة اللمس.

### مطابقة أسماء المواصفة مع أسماء المشروع

- `HomeHeroCarousel` في المواصفة يُنفذ داخل الملف الحالي باسم `HeroCarousel` للحفاظ على واجهته العامة.
- `HomeCategoryGrid` في المواصفة يُنفذ داخل `CategorySection` حتى لا تتكسر الاستدعاءات الحالية.
- `HomeRepository` لا يتغير؛ يستمر `HomeViewModel` في استهلاك `catalogRepositoryProvider` للحصول على `HomeFeed`.
- `HomeRecentOrders` و`HomePartnersGrid` يبقيان مؤجلين لأن المشروع لا يملك مصدر بيانات حقيقيًا لهما.

### بطاقات المنتجات

- `lib/shared/presentation/widgets/product_card.dart`: تنفيذ `grid` و`compact` و`horizontal` وإزالة النص الثابت.
- `lib/shared/presentation/widgets/product_rating.dart`: تنسيق عدد المراجعات محليًا.
- `test/shared/presentation/product_card_test.dart`: جميع الأنماط واللغات والحالات وTextScaler.

### Hero والرأس

- `lib/features/home/presentation/widgets/hero_carousel.dart`: PageView والخلفية والمؤشر والحركة المخفضة.
- `lib/features/home/presentation/widgets/home_hero_indicator.dart`: مؤشر صفحات مستقل.
- `lib/features/home/presentation/widgets/home_header.dart`: محتوى البحث والسلة والإشعارات.
- `lib/features/home/presentation/widgets/home_sliver_header.dart`: Sliver مثبت وتحول السطح.
- `test/features/home/widgets/hero_carousel_test.dart`: الصفحات والاتجاه والحركة.
- `test/features/home/widgets/home_sliver_header_test.dart`: التثبيت والتحول ومناطق اللمس.

### محتوى الرئيسية

- `lib/features/home/presentation/widgets/trust_benefits.dart`: لوحة مزايا تستجيب للنص والعرض.
- `lib/features/home/presentation/widgets/category_section.dart`: شبكة الفئات وبطاقة المزيد.
- `lib/features/home/presentation/widgets/home_category_sheet.dart`: جميع الفئات داخل Bottom Sheet.
- `lib/features/home/presentation/widgets/product_section.dart`: أنماط horizontal/featured/grid المبنية على Slivers أو Widgets محدودة الارتفاع.
- `lib/features/home/presentation/widgets/home_featured_products.dart`: الخلفية المتدرجة والبطاقة التمهيدية.
- `lib/features/home/presentation/widgets/home_loading_skeleton.dart`: Skeleton يطابق الصفحة.
- `lib/features/home/presentation/pages/home_page.dart`: تركيب Slivers وربط callbacks والبيانات.
- `test/features/home/widgets/category_section_test.dart`: الأعمدة والاختيار ونافذة المزيد.
- `test/features/home/widgets/trust_benefits_test.dart`: الاستجابة وTextScaler.
- `test/features/home/widgets/home_featured_products_test.dart`: المحتوى والفراغ.
- `test/features/home/presentation/home_page_test.dart`: تكامل الصفحة والحالات واللغات والثيم.

### التنظيف والتحقق

- حذف الملفات القديمة فقط بعد إثبات عدم استخدامها: `home_header_widget.dart`، `categories_widget.dart`، `popular_products_widget.dart`، `special_offers_widget.dart`، `discount_banner_widget.dart`.
- `test/features/home/home_page_test.dart`: دمج الاختبارات غير المكررة في مجموعة presentation ثم حذف الملف المكرر.

---

### Task 1: Semantic Teal/Cyan Theme and Locale Typography

**Files:**
- Modify: `lib/core/design_system/tokens/app_colors.dart`
- Create: `lib/core/design_system/tokens/app_gradients.dart`
- Modify: `lib/core/design_system/tokens/app_tokens.dart`
- Modify: `lib/core/design_system/theme/app_theme.dart`
- Modify: `lib/app/app.dart`
- Create: `test/core/design_system/app_theme_test.dart`

**Interfaces:**
- Produces: `AppTheme.lightFor(Locale locale)` و`AppTheme.darkFor(Locale locale)`.
- Preserves: `AppTheme.light` و`AppTheme.dark` كاختصارات إنجليزية للاختبارات الحالية.
- Produces: `AppGradients.hero(ColorScheme)` و`AppGradients.featured(ColorScheme)`.
- Consumes later: كل مكوّن رئيسي يقرأ `Theme.of(context).colorScheme`.

- [ ] **Step 1: Write failing theme tests**

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rehlaa/core/design_system/design_system.dart';

void main() {
  double contrast(Color foreground, Color background) {
    final lighter = foreground.computeLuminance() > background.computeLuminance()
        ? foreground.computeLuminance()
        : background.computeLuminance();
    final darker = foreground.computeLuminance() > background.computeLuminance()
        ? background.computeLuminance()
        : foreground.computeLuminance();
    return (lighter + .05) / (darker + .05);
  }

  test('light theme exposes approved semantic colors', () {
    final scheme = AppTheme.lightFor(const Locale('en')).colorScheme;
    expect(scheme.primary, const Color(0xFF00796B));
    expect(scheme.secondary, const Color(0xFF0288D1));
    expect(scheme.tertiary, const Color(0xFFEF6C00));
    expect(scheme.surface, const Color(0xFFFFFFFF));
  });

  test('dark theme exposes teal-tinted surfaces', () {
    final theme = AppTheme.darkFor(const Locale('ar'));
    expect(theme.scaffoldBackgroundColor, const Color(0xFF071816));
    expect(theme.colorScheme.primary, const Color(0xFF5CEAD4));
    expect(theme.colorScheme.surface, const Color(0xFF0D201D));
    expect(theme.textTheme.bodyMedium?.fontFamily, contains('Cairo'));
  });

  test('primary and surface text meet normal-text contrast', () {
    for (final scheme in <ColorScheme>[
      AppTheme.lightFor(const Locale('en')).colorScheme,
      AppTheme.darkFor(const Locale('ar')).colorScheme,
    ]) {
      expect(contrast(scheme.onPrimary, scheme.primary), greaterThanOrEqualTo(4.5));
      expect(contrast(scheme.onSurface, scheme.surface), greaterThanOrEqualTo(4.5));
    }
  });
}
```

- [ ] **Step 2: Run the focused test and confirm RED**

Run: `flutter test test/core/design_system/app_theme_test.dart`

Expected: compilation failure because `lightFor` and `darkFor` do not exist.

- [ ] **Step 3: Add approved tokens and gradients**

```dart
// app_colors.dart
static const brandAccent = Color(0xFF00BFA5);
static const lightPrimary = Color(0xFF00796B);
static const lightSecondary = Color(0xFF0288D1);
static const lightTertiary = Color(0xFFEF6C00);
static const lightBackground = Color(0xFFF7FBFA);
static const lightSurfaceContainer = Color(0xFFE8F4F1);
static const darkBackground = Color(0xFF071816);
static const darkSurface = Color(0xFF0D201D);
static const darkSurfaceContainer = Color(0xFF142B27);
static const darkSurfaceContainerHigh = Color(0xFF1C3631);
```

```dart
// app_gradients.dart
abstract final class AppGradients {
  static LinearGradient hero(ColorScheme colors) => LinearGradient(
    begin: AlignmentDirectional.topStart,
    end: AlignmentDirectional.bottomEnd,
    colors: [colors.secondary, colors.primary, colors.tertiary],
  );

  static LinearGradient featured(ColorScheme colors) => LinearGradient(
    begin: AlignmentDirectional.topStart,
    end: AlignmentDirectional.bottomEnd,
    colors: [colors.primaryContainer, colors.surface],
  );
}
```

- [ ] **Step 4: Build explicit schemes and locale-aware text themes**

```dart
static ThemeData lightFor(Locale locale) => _build(
  brightness: Brightness.light,
  locale: locale,
  scheme: const ColorScheme.light(
    primary: Color(0xFF00796B),
    onPrimary: Colors.white,
    primaryContainer: Color(0xFFA7FFEB),
    onPrimaryContainer: Color(0xFF10201D),
    secondary: Color(0xFF0288D1),
    onSecondary: Colors.white,
    secondaryContainer: Color(0xFFE1F5FE),
    onSecondaryContainer: Color(0xFF10201D),
    tertiary: Color(0xFFEF6C00),
    onTertiary: Colors.white,
    tertiaryContainer: Color(0xFFFFF3E0),
    onTertiaryContainer: Color(0xFF4D2600),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF10201D),
    onSurfaceVariant: Color(0xFF526662),
    outline: Color(0xFFD4E5E1),
  ),
  scaffold: const Color(0xFFF7FBFA),
);

static ThemeData get light => lightFor(const Locale('en'));

static ThemeData darkFor(Locale locale) => _build(
  brightness: Brightness.dark,
  locale: locale,
  scheme: const ColorScheme.dark(
    primary: Color(0xFF5CEAD4),
    onPrimary: Color(0xFF00382F),
    primaryContainer: Color(0xFF005047),
    onPrimaryContainer: Color(0xFFB8FFF1),
    secondary: Color(0xFF67D4FF),
    onSecondary: Color(0xFF003546),
    secondaryContainer: Color(0xFF003A4D),
    onSecondaryContainer: Color(0xFFC4EEFF),
    tertiary: Color(0xFFFFB66A),
    onTertiary: Color(0xFF4B2800),
    tertiaryContainer: Color(0xFF663500),
    onTertiaryContainer: Color(0xFFFFDDBA),
    surface: Color(0xFF0D201D),
    onSurface: Color(0xFFF3FBF8),
    onSurfaceVariant: Color(0xFFB7CAC5),
    outline: Color(0xFF29443E),
  ),
  scaffold: const Color(0xFF071816),
);

static ThemeData get dark => darkFor(const Locale('en'));
```

In `_build`, choose `GoogleFonts.cairoTextTheme(base)` for `ar` and `GoogleFonts.nunitoTextTheme(base)` otherwise. Preserve the existing button, input, card, sheet, checkbox, and snackbar theme construction, replacing raw palette references with the supplied scheme.

- [ ] **Step 5: Pass locale into RehlaaApp theme creation**

```dart
theme: AppTheme.lightFor(locale),
darkTheme: AppTheme.darkFor(locale),
```

- [ ] **Step 6: Format and verify GREEN**

Run: `dart format lib/core/design_system lib/app/app.dart test/core/design_system/app_theme_test.dart`

Run: `flutter test test/core/design_system/app_theme_test.dart test/features/cart/cart_page_test.dart`

Expected: all selected tests pass.

- [ ] **Step 7: Commit the theme phase**

```bash
git add lib/core/design_system lib/app/app.dart test/core/design_system/app_theme_test.dart
git commit -m "feat(theme): adopt MangoShop semantic palette"
```

---

### Task 2: Localized Home Copy and Reusable Section Header

**Files:**
- Modify: `lib/l10n/app_en.arb`
- Modify: `lib/l10n/app_ar.arb`
- Create: `lib/features/home/presentation/widgets/home_section_header.dart`
- Create: `test/features/home/widgets/home_section_header_test.dart`
- Regenerate: `lib/generated/l10n/app_localizations*.dart`

**Interfaces:**
- Produces localization getters: `homeSeeAll`, `homeMore`, `homeFeaturedLabel`, `homeSoldOutLabel`, `homeReviewsCount`, `homeExclusiveCampaignTitle`, `homeExclusiveCampaignDescription`.
- Produces: `HomeSectionHeader({required String title, String? description, String? actionLabel, VoidCallback? onAction})`.

- [ ] **Step 1: Write the failing header test**

```dart
testWidgets('renders localized action with a 48 point target', (tester) async {
  await tester.pumpWidget(localizedTestApp(
    locale: const Locale('ar'),
    child: HomeSectionHeader(
      title: 'عروض حصرية',
      actionLabel: 'عرض الكل',
      onAction: () {},
    ),
  ));
  expect(find.text('عرض الكل'), findsOneWidget);
  expect(tester.getSize(find.byKey(const ValueKey('section-action'))).height,
      greaterThanOrEqualTo(48));
  expect(Directionality.of(tester.element(find.byType(HomeSectionHeader))),
      TextDirection.rtl);
});
```

Define `localizedTestApp` inside the test file with `AppLocalizations.localizationsDelegates` and `supportedLocales` so the test is self-contained.

- [ ] **Step 2: Run the focused test and confirm RED**

Run: `flutter test test/features/home/widgets/home_section_header_test.dart`

Expected: compilation failure because `HomeSectionHeader` does not exist.

- [ ] **Step 3: Add exact ARB messages**

```json
// app_en.arb entries
"homeSeeAll": "See all",
"homeMore": "More",
"homeFeaturedLabel": "Featured",
"homeSoldOutLabel": "Sold out",
"homeReviewsCount": "{count, plural, =0{No reviews} =1{1 review} other{{count} reviews}}",
"@homeReviewsCount": {"placeholders": {"count": {"type": "int"}}},
"homeExclusiveCampaignTitle": "Exclusive picks",
"homeExclusiveCampaignDescription": "Limited offers selected for you"
```

```json
// app_ar.arb entries
"homeSeeAll": "عرض الكل",
"homeMore": "المزيد",
"homeFeaturedLabel": "مميز",
"homeSoldOutLabel": "غير متوفر",
"homeReviewsCount": "{count, plural, =0{لا توجد مراجعات} =1{مراجعة واحدة} =2{مراجعتان} few{{count} مراجعات} many{{count} مراجعة} other{{count} مراجعة}}",
"@homeReviewsCount": {"placeholders": {"count": {"type": "int"}}},
"homeExclusiveCampaignTitle": "مختارات حصرية",
"homeExclusiveCampaignDescription": "عروض محدودة اخترناها لك"
```

- [ ] **Step 4: Generate localization code**

Run: `flutter gen-l10n`

Expected: generated getters exist in all `app_localizations*.dart` files.

- [ ] **Step 5: Implement the directional header**

```dart
class HomeSectionHeader extends StatelessWidget {
  const HomeSectionHeader({
    required this.title,
    super.key,
    this.description,
    this.actionLabel,
    this.onAction,
  });

  final String title;
  final String? description;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.lg),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Expanded(child: Text(title,
            style: Theme.of(context).textTheme.titleLarge)),
          if (onAction != null && actionLabel != null)
            SizedBox(
              key: const ValueKey('section-action'),
              height: 48,
              child: TextButton.icon(
                onPressed: onAction,
                label: Text(actionLabel!),
                icon: const Icon(Icons.arrow_forward_ios_rounded, size: 14),
              ),
            ),
        ]),
        if (description != null) Text(description!,
          style: Theme.of(context).textTheme.bodySmall),
      ],
    ),
  );
}
```

- [ ] **Step 6: Verify localization and widget behavior**

Run: `dart format lib/features/home/presentation/widgets/home_section_header.dart test/features/home/widgets/home_section_header_test.dart`

Run: `flutter test test/features/home/widgets/home_section_header_test.dart`

Expected: all tests pass in Arabic and English.

- [ ] **Step 7: Commit localized copy and header**

```bash
git add lib/l10n lib/generated/l10n lib/features/home/presentation/widgets/home_section_header.dart test/features/home/widgets/home_section_header_test.dart
git commit -m "feat(home): add localized section header"
```

---

### Task 3: Complete Accessible Product Card Variants

**Files:**
- Modify: `lib/shared/presentation/widgets/product_card.dart`
- Modify: `lib/shared/presentation/widgets/product_rating.dart`
- Modify: `test/shared/presentation/product_card_test.dart`

**Interfaces:**
- Preserves constructors: `ProductCard.grid`, `.compact`, `.horizontal`.
- All variants consume `Product`, localized price widgets, and optional favorite state.
- Grid and compact expose the same semantic product label; horizontal keeps its current row layout.

- [ ] **Step 1: Replace the old test harness and add failing variant tests**

```dart
Widget testApp(Widget child, {Locale locale = const Locale('en')}) => MaterialApp(
  locale: locale,
  theme: AppTheme.lightFor(locale),
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  home: Scaffold(body: Center(child: child)),
);

testWidgets('localizes featured badge in Arabic', (tester) async {
  await tester.pumpWidget(testApp(
    SizedBox(width: 200,
      child: ProductCard.grid(product: fixtureProduct, onTap: () {})),
    locale: const Locale('ar'),
  ));
  expect(find.text('مميز'), findsOneWidget);
  expect(find.text('Featured'), findsNothing);
});

testWidgets('compact and horizontal variants render product content',
    (tester) async {
  for (final card in <Widget>[
    ProductCard.compact(product: fixtureProduct, onTap: () {}),
    ProductCard.horizontal(product: fixtureProduct, onTap: () {}),
  ]) {
    await tester.pumpWidget(testApp(SizedBox(width: 360, child: card)));
    expect(find.text('Google One + Gemini Pro'), findsOneWidget);
    expect(find.text('135,000 SDG'), findsOneWidget);
  }
});
```

- [ ] **Step 2: Run the product-card test and confirm RED**

Run: `flutter test test/shared/presentation/product_card_test.dart`

Expected: Arabic badge test fails and compact content is absent.

- [ ] **Step 3: Localize badges and review counts**

```dart
final l10n = AppLocalizations.of(context);
final featuredLabel = l10n.homeFeaturedLabel;
```

Update `ProductRating` to render `l10n.homeReviewsCount(reviewCount)` instead of the raw parenthesized number. Keep `NumberFormat.decimalPattern(locale)` for numeric-only contexts.

- [ ] **Step 4: Implement compact and harden all variants**

Implement compact as a 144–176 point portrait card with square image, two-line name, rating, and price. Use `Semantics(button: true, label: localizedName)` around every variant, `PositionedDirectional` for badges and favorite actions, `Wrap` for price/rating rows, and keys `product-card-${product.id}`.

```dart
Widget _buildCompact(BuildContext context) => Semantics(
  button: true,
  label: _localizedName(context),
  child: InkWell(
    key: ValueKey('product-card-${product.id}'),
    onTap: onTap,
    borderRadius: BorderRadius.circular(AppRadius.lg),
    child: Padding(
      padding: const EdgeInsets.all(AppSpacing.sm),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        AspectRatio(aspectRatio: 1, child: _ProductImage(product: product)),
        const SizedBox(height: AppSpacing.sm),
        Text(_localizedName(context), maxLines: 2,
          overflow: TextOverflow.ellipsis),
        ProductRating(rating: product.rating, reviewCount: product.reviewCount),
        ProductPrice(currentPrice: displayPrice ?? product.basePrice,
          compareAtPrice: displayPrice == null ? product.compareAtPrice : null),
      ]),
    ),
  ),
);
```

Extract `_ProductImage` and `_ProductBadge` as private top-level Widgets, not methods returning Widgets inside `build`.

- [ ] **Step 5: Add a 200% text-scale regression test**

Pump the grid and horizontal variants at width 320 with `TextScaler.linear(2)` and assert `tester.takeException()` is null after `pumpAndSettle()`.

- [ ] **Step 6: Format and verify all card tests**

Run: `dart format lib/shared/presentation/widgets/product_card.dart lib/shared/presentation/widgets/product_rating.dart test/shared/presentation/product_card_test.dart`

Run: `flutter test test/shared/presentation/product_card_test.dart`

Expected: all card variants, Arabic, and 200% text-scale tests pass.

- [ ] **Step 7: Commit product-card variants**

```bash
git add lib/shared/presentation/widgets/product_card.dart lib/shared/presentation/widgets/product_rating.dart test/shared/presentation/product_card_test.dart
git commit -m "feat(catalog): complete localized product card variants"
```

---

### Task 4: Layered Responsive Hero Carousel

**Files:**
- Modify: `lib/features/home/presentation/widgets/hero_carousel.dart`
- Create: `lib/features/home/presentation/widgets/home_hero_indicator.dart`
- Create: `test/features/home/widgets/hero_carousel_test.dart`

**Interfaces:**
- Preserves: `HeroCarousel({required List<PromoBanner> banners, ValueChanged<PromoBanner>? onBannerTap})`.
- Produces keys: `home-hero`, `hero-page-<id>`, `hero-indicator-<index>`.
- Keeps `PageController` and current index local to the Hero.

- [ ] **Step 1: Write failing Hero behavior tests**

```dart
testWidgets('renders layered hero and changes active indicator', (tester) async {
  await tester.pumpWidget(homeTestApp(
    SizedBox(width: 390, child: HeroCarousel(banners: banners)),
  ));
  expect(find.byKey(const ValueKey('home-hero')), findsOneWidget);
  expect(find.byKey(const ValueKey('hero-indicator-0')), findsOneWidget);
  await tester.drag(find.byType(PageView), const Offset(-320, 0));
  await tester.pumpAndSettle();
  expect(
    tester.getSize(find.byKey(const ValueKey('hero-indicator-1'))).width,
    30,
  );
});
```

Add tests for RTL drag direction, one-banner behavior without dots, and a tap callback receiving the correct banner.

- [ ] **Step 2: Run the Hero tests and confirm RED**

Run: `flutter test test/features/home/widgets/hero_carousel_test.dart`

Expected: PageView and indicator expectations fail against the current horizontal ListView.

- [ ] **Step 3: Implement the indicator**

```dart
class HomeHeroIndicator extends StatelessWidget {
  const HomeHeroIndicator({required this.count, required this.index, super.key});
  final int count;
  final int index;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: List.generate(count, (item) => AnimatedContainer(
      key: ValueKey('hero-indicator-$item'),
      duration: AppDurations.normal,
      width: item == index ? 30 : 12,
      height: 12,
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        color: item == index
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.surface.withValues(alpha: .7),
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
    )),
  );
}
```

- [ ] **Step 4: Replace ListView with layered PageView**

Use `ConsumerStatefulWidget` only for ephemeral `PageController`, timer, and current page. Cancel the timer and dispose the controller. Derive height from `LayoutBuilder`: 290 below 360, 320 below 600, and 420 from 600 upward. Build a background `AnimatedSwitcher`, foreground `PageView.builder(viewportFraction: .84)`, a bottom directional indicator, and a curved surface transition.

```dart
final disableAnimations = MediaQuery.disableAnimationsOf(context);
if (!disableAnimations && widget.banners.length > 1) {
  _timer = Timer.periodic(const Duration(seconds: 9), (_) => _advance());
}
```

Wrap the animated background in `RepaintBoundary` and apply a theme-aware scrim in dark mode.

- [ ] **Step 5: Format and verify Hero tests**

Run: `dart format lib/features/home/presentation/widgets/hero_carousel.dart lib/features/home/presentation/widgets/home_hero_indicator.dart test/features/home/widgets/hero_carousel_test.dart`

Run: `flutter test test/features/home/widgets/hero_carousel_test.dart`

Expected: all PageView, RTL, tap, one-banner, and reduced-motion tests pass.

- [ ] **Step 6: Commit the Hero phase**

```bash
git add lib/features/home/presentation/widgets/hero_carousel.dart lib/features/home/presentation/widgets/home_hero_indicator.dart test/features/home/widgets/hero_carousel_test.dart
git commit -m "feat(home): add layered responsive hero"
```

---

### Task 5: Pinned Sliver Header and Responsive Trust Panel

**Files:**
- Modify: `lib/features/home/presentation/widgets/home_header.dart`
- Create: `lib/features/home/presentation/widgets/home_sliver_header.dart`
- Modify: `lib/features/home/presentation/widgets/trust_benefits.dart`
- Create: `test/features/home/widgets/home_sliver_header_test.dart`
- Create: `test/features/home/widgets/trust_benefits_test.dart`

**Interfaces:**
- Produces: `HomeSliverHeader({required Widget hero, required String searchHint, required double heroHeight, VoidCallback? onSearchTap, VoidCallback? onCartTap, VoidCallback? onNotificationsTap})`.
- Preserves: `HomeHeader` callbacks and adds optional `cartCount` and `notificationCount` with zero defaults.
- Preserves: `TrustBenefits` localized labels.

- [ ] **Step 1: Write failing pinned-header and trust tests**

Test that `HomeSliverHeader` renders a `SliverPersistentHeader(pinned: true)`, header action targets are at least 48×48, and the surface becomes opaque after scrolling past 60 points. Test `TrustBenefits` at width 320 and TextScaler 2.0 with no exception.

```dart
expect(tester.getSize(find.byKey(const ValueKey('home-cart-action'))),
    const Size(48, 48));
await tester.drag(find.byType(CustomScrollView), const Offset(0, -180));
await tester.pump();
final material = tester.widget<Material>(
  find.byKey(const ValueKey('home-pinned-surface')),
);
expect(material.color?.a, 1);
```

- [ ] **Step 2: Run focused tests and confirm RED**

Run: `flutter test test/features/home/widgets/home_sliver_header_test.dart test/features/home/widgets/trust_benefits_test.dart`

Expected: `HomeSliverHeader` is missing and fixed-row trust layout overflows at 200%.

- [ ] **Step 3: Implement the Sliver delegate**

Create a private `_HomeHeaderDelegate extends SliverPersistentHeaderDelegate` whose `minExtent` is 72 and `maxExtent` is `heroHeight`. Calculate `progress = (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0)`, then interpolate between transparent and `colorScheme.surface`.

```dart
@override
Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
  final range = (maxExtent - minExtent).clamp(1.0, double.infinity);
  final progress = (shrinkOffset / range).clamp(0.0, 1.0);
  return Stack(fit: StackFit.expand, children: [
    Positioned.fill(child: hero),
    Align(
      alignment: AlignmentDirectional.topCenter,
      child: Material(
        key: const ValueKey('home-pinned-surface'),
        color: Color.lerp(Colors.transparent,
            Theme.of(context).colorScheme.surface, progress),
        child: SafeArea(bottom: false, child: header),
      ),
    ),
  ]);
}
```

Use `HomeHeader` as the pinned toolbar content and place the Hero in the expanded stack from `HomePage`; the delegate owns only surface interpolation and toolbar placement.

- [ ] **Step 4: Harden Header and TrustBenefits**

Use `Badge` only when a count is greater than zero, `Semantics(button: true)` for actions, and `ConstrainedBox(minHeight: 48, minWidth: 48)`. Replace the trust fixed Row with `LayoutBuilder`; use Row when `maxWidth >= 360 && textScale <= 1.3`, otherwise a 120-point horizontal list of benefit tiles.

- [ ] **Step 5: Verify header and trust widgets**

Run: `dart format lib/features/home/presentation/widgets/home_header.dart lib/features/home/presentation/widgets/home_sliver_header.dart lib/features/home/presentation/widgets/trust_benefits.dart test/features/home/widgets/home_sliver_header_test.dart test/features/home/widgets/trust_benefits_test.dart`

Run: `flutter test test/features/home/widgets/home_sliver_header_test.dart test/features/home/widgets/trust_benefits_test.dart`

Expected: all focused tests pass without overflow.

- [ ] **Step 6: Commit header and trust phase**

```bash
git add lib/features/home/presentation/widgets/home_header.dart lib/features/home/presentation/widgets/home_sliver_header.dart lib/features/home/presentation/widgets/trust_benefits.dart test/features/home/widgets/home_sliver_header_test.dart test/features/home/widgets/trust_benefits_test.dart
git commit -m "feat(home): add pinned header and responsive trust panel"
```

---

### Task 6: Adaptive Category Grid and More Sheet

**Files:**
- Modify: `lib/features/home/presentation/widgets/category_section.dart`
- Create: `lib/features/home/presentation/widgets/home_category_sheet.dart`
- Create: `test/features/home/widgets/category_section_test.dart`

**Interfaces:**
- Extends: `CategorySection` with `String moreLabel` and optional `ValueChanged<Category>? onCategoryOpen` only if navigation needs it.
- Preserves: `selectedCategoryId` and `ValueChanged<String?> onSelected`.
- Produces key: `home-category-more`.

- [ ] **Step 1: Write failing grid and sheet tests**

Create 11 category fixtures. At width 390 assert the first surface uses five columns and renders `home-category-more`. Tap More and assert all 11 localized category names appear in a `DraggableScrollableSheet`. At width 320 with TextScaler 2.0 assert four columns and no overflow.

```dart
await tester.tap(find.byKey(const ValueKey('home-category-more')));
await tester.pumpAndSettle();
expect(find.byType(DraggableScrollableSheet), findsOneWidget);
expect(find.text('Category 11'), findsOneWidget);
```

- [ ] **Step 2: Run the category test and confirm RED**

Run: `flutter test test/features/home/widgets/category_section_test.dart`

Expected: no grid or More sheet exists in the current horizontal implementation.

- [ ] **Step 3: Implement adaptive column calculation**

```dart
int categoryColumnCount(double width, double textScale) {
  if (width >= 600) return 8;
  if (width < 360 || textScale > 1.3) return 4;
  return 5;
}
```

Render at most `columns * 2 - 1` categories followed by More when the list exceeds capacity. Use `GridView.builder(shrinkWrap: true, physics: NeverScrollableScrollPhysics())`, `childAspectRatio` derived from TextScaler, and two-line labels.

- [ ] **Step 4: Implement the shared category sheet**

Use `showModalBottomSheet(useSafeArea: true, isScrollControlled: true)` and `DraggableScrollableSheet(initialChildSize: .72, minChildSize: .5, maxChildSize: .92)`. The sheet reuses the same category list and `onSelected`, closes after selection, and applies `EdgeInsetsDirectional`.

- [ ] **Step 5: Verify selection, RTL, and 200% scaling**

Run: `dart format lib/features/home/presentation/widgets/category_section.dart lib/features/home/presentation/widgets/home_category_sheet.dart test/features/home/widgets/category_section_test.dart`

Run: `flutter test test/features/home/widgets/category_section_test.dart`

Expected: grid, More sheet, selection state, RTL, and scale tests pass.

- [ ] **Step 6: Commit categories phase**

```bash
git add lib/features/home/presentation/widgets/category_section.dart lib/features/home/presentation/widgets/home_category_sheet.dart test/features/home/widgets/category_section_test.dart
git commit -m "feat(home): add adaptive category grid"
```

---

### Task 7: Featured Product Surface and Section Variants

**Files:**
- Modify: `lib/features/home/presentation/widgets/product_section.dart`
- Create: `lib/features/home/presentation/widgets/home_featured_products.dart`
- Create: `test/features/home/widgets/home_featured_products_test.dart`

**Interfaces:**
- Introduces: `enum HomeProductSectionVariant { horizontal, featured, grid }`.
- Produces: `HomeFeaturedProducts({required String title, required String campaignTitle, required String campaignDescription, required List<Product> products, required String emptyLabel, required ValueChanged<Product> onProductTap, VoidCallback? onSeeAll})`.
- Uses: `HomeSectionHeader`, `ProductCard.compact`, and `AppGradients.featured`.

- [ ] **Step 1: Write failing featured-section tests**

Test that non-empty data renders the campaign copy, a horizontal list of `ProductCard.compact`, and a See All action only when a callback exists. Test that an empty list renders `emptyLabel` in the generic grid section but the optional promotional wrapper is omitted by `HomePage`.

```dart
expect(find.text('Exclusive picks'), findsOneWidget);
expect(find.byType(ProductCard), findsNWidgets(products.length));
expect(find.byKey(const ValueKey('featured-products-background')),
    findsOneWidget);
```

- [ ] **Step 2: Run focused tests and confirm RED**

Run: `flutter test test/features/home/widgets/home_featured_products_test.dart`

Expected: `HomeFeaturedProducts` and the featured background key do not exist.

- [ ] **Step 3: Implement the featured surface**

Build a Stack with a directional gradient background, a constrained campaign intro tile of 132–156 points, and a horizontal `ListView.separated` of compact product cards. Calculate list height from TextScaler with `baseHeight * scale.clamp(1, 1.6)` and isolate the gradient in `RepaintBoundary`.

```dart
final scale = MediaQuery.textScalerOf(context).scale(1).clamp(1.0, 1.6);
return DecoratedBox(
  key: const ValueKey('featured-products-background'),
  decoration: BoxDecoration(gradient: AppGradients.featured(colors)),
  child: SizedBox(
    height: 310 * scale,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.lg),
      itemCount: products.length + 1,
      itemBuilder: (context, index) => index == 0
          ? _CampaignIntro(title: campaignTitle, description: campaignDescription)
          : SizedBox(width: 176,
              child: ProductCard.compact(
                product: products[index - 1],
                onTap: () => onProductTap(products[index - 1]),
              )),
      separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.md),
    ),
  ),
);
```

- [ ] **Step 4: Refactor ProductSection to explicit variants**

Replace the boolean `horizontal` with `HomeProductSectionVariant variant`, while temporarily accepting the old constructor argument only during the same edit so all call sites are migrated before commit. Use `HomeSectionHeader` for every title and lazy builders for horizontal lists.

```dart
enum HomeProductSectionVariant { horizontal, featured, grid }

const ProductSection({
  required this.title,
  required this.products,
  required this.emptyLabel,
  required this.variant,
  super.key,
  this.onProductTap,
  this.onSeeAll,
});
```

- [ ] **Step 5: Verify featured and generic sections**

Run: `dart format lib/features/home/presentation/widgets/product_section.dart lib/features/home/presentation/widgets/home_featured_products.dart test/features/home/widgets/home_featured_products_test.dart`

Run: `flutter test test/features/home/widgets/home_featured_products_test.dart test/shared/presentation/product_card_test.dart`

Expected: section and product-card suites pass.

- [ ] **Step 6: Commit product-section phase**

```bash
git add lib/features/home/presentation/widgets/product_section.dart lib/features/home/presentation/widgets/home_featured_products.dart test/features/home/widgets/home_featured_products_test.dart
git commit -m "feat(home): add featured product surface"
```

---

### Task 8: Sliver Home Composition, Loading, and Existing Data Flow

**Files:**
- Modify: `lib/features/home/presentation/pages/home_page.dart`
- Create: `lib/features/home/presentation/widgets/home_loading_skeleton.dart`
- Modify: `lib/core/design_system/components/feedback/app_skeleton.dart`
- Create: `test/core/design_system/app_skeleton_test.dart`
- Modify: `test/features/home/presentation/home_page_test.dart`

**Interfaces:**
- Preserves: `HomePage({ValueChanged<Product>? onProductTap, VoidCallback? onCartTap})`.
- Preserves: `homeViewModelProvider`, refresh, category selection, stale data, offline banner, and product navigation.
- Consumes: all components from Tasks 2–7.

- [ ] **Step 1: Rewrite integration expectations before production code**

Add tests asserting one `CustomScrollView`, one pinned header, one Hero, category grid, exclusive featured surface, featured product grid, Arabic/dark/200% layout, pull-to-refresh, stale banner, and product callback. Add a test that no recent-orders or partners heading appears because `HomeFeed` has no such data. Preserve explicit error handling tests: initial repository failure renders `AppErrorState`, refresh failure with cached data retains the feed and exposes a non-blocking message, and a failed image renders `image_not_supported_outlined`.

```dart
expect(find.byType(CustomScrollView), findsOneWidget);
expect(find.byType(HomeSliverHeader), findsOneWidget);
expect(find.byType(HeroCarousel), findsOneWidget);
expect(find.byType(HomeFeaturedProducts), findsOneWidget);
expect(find.text('Latest orders'), findsNothing);
```

- [ ] **Step 2: Run the page tests and confirm RED**

Run: `flutter test test/features/home/presentation/home_page_test.dart`

Expected: Sliver header and featured-surface assertions fail against the old composition.

- [ ] **Step 3: Implement the matching loading skeleton**

Build `HomeLoadingSkeleton` as a `CustomScrollView` with a 320-point Hero block, a three-item trust row, a two-row category block, and two product strips. Use `AppSkeleton` and `AppCircleSkeleton`; no new animation controller is required.

Update `AppSkeleton` so `MediaQuery.disableAnimationsOf(context)` renders a static midpoint opacity and does not repeat its controller. Verify this in `app_skeleton_test.dart` with `MediaQueryData(disableAnimations: true)`.

- [ ] **Step 4: Compose HomePage with Slivers**

Use `RefreshIndicator` around `CustomScrollView`. Convert ordinary sections with `SliverToBoxAdapter`, use `SliverPadding` for spacing, and avoid any vertically scrolling child list. Keep the offline banner outside the Expanded scroll area as today.

Map current data exactly:

```text
feed.banners          -> HeroCarousel
feed.categories       -> CategorySection
feed.exclusiveOffers  -> HomeFeaturedProducts
visibleFeaturedProducts -> ProductSection.variant(grid)
```

Hide Hero when banners are empty and hide the optional promotional wrapper when exclusive offers are empty. Keep the generic featured grid empty label translated.

- [ ] **Step 5: Preserve state and callbacks**

Keep `openProduct` behavior unchanged, invoke `homeViewModelProvider.notifier.selectCategory`, and use `PageStorageKey('home-scroll')` on the CustomScrollView. The cached-data banner remains a live region.

- [ ] **Step 6: Format and run page regression tests**

Run: `dart format lib/features/home/presentation/pages/home_page.dart lib/features/home/presentation/widgets/home_loading_skeleton.dart lib/core/design_system/components/feedback/app_skeleton.dart test/core/design_system/app_skeleton_test.dart test/features/home/presentation/home_page_test.dart`

Run: `flutter test test/core/design_system/app_skeleton_test.dart test/features/home/presentation/home_page_test.dart test/features/home/presentation/home_view_model_test.dart`

Expected: success, Arabic/dark/200%, stale, error, refresh, selection, and navigation tests pass.

- [ ] **Step 7: Commit page composition**

```bash
git add lib/features/home/presentation/pages/home_page.dart lib/features/home/presentation/widgets/home_loading_skeleton.dart lib/core/design_system/components/feedback/app_skeleton.dart test/core/design_system/app_skeleton_test.dart test/features/home/presentation/home_page_test.dart
git commit -m "feat(home): compose responsive MangoShop home"
```

---

### Task 9: Remove Proven-Dead Home Components and Duplicate Tests

**Files:**
- Delete after proof: `lib/features/home/presentation/widgets/home_header_widget.dart`
- Delete after proof: `lib/features/home/presentation/widgets/categories_widget.dart`
- Delete after proof: `lib/features/home/presentation/widgets/popular_products_widget.dart`
- Delete after proof: `lib/features/home/presentation/widgets/special_offers_widget.dart`
- Delete after proof: `lib/features/home/presentation/widgets/discount_banner_widget.dart`
- Modify: `test/features/home/presentation/home_page_test.dart`
- Delete after migration: `test/features/home/home_page_test.dart`

**Interfaces:**
- Produces no new runtime interface.
- Preserves loading, repository, offline, error, and typed-category coverage by moving unique cases into the presentation test file.

- [ ] **Step 1: Prove production files are unreferenced**

Run each search and require no results outside the file itself and the old duplicate test:

```powershell
Get-ChildItem lib,test -Recurse -File -Filter *.dart | Select-String 'HomeHeaderWidget|CategoriesWidget|PopularProductsWidget|SpecialOffersWidget|DiscountBannerWidget'
```

Expected: no production imports remain after Task 8; `CategoriesWidget` may remain only in `test/features/home/home_page_test.dart`.

- [ ] **Step 2: Move unique test cases**

Copy the pending loading, repository failure, and connectivity-unavailable assertions into `test/features/home/presentation/home_page_test.dart`, using the same `MockCatalogRepository` and provider overrides already defined there. Replace the old `CategoriesWidget` test with `CategorySection` coverage already owned by Task 6.

- [ ] **Step 3: Run combined Home tests before deletion**

Run: `flutter test test/features/home test/shared/presentation/product_card_test.dart`

Expected: all tests pass while both old and new files still exist.

- [ ] **Step 4: Delete only the proven-dead files**

Delete the five old Widgets and `test/features/home/home_page_test.dart`. Do not delete `section_title_widget.dart` until a separate search proves no remaining consumer anywhere in `lib/`.

- [ ] **Step 5: Run tests after deletion**

Run: `flutter test test/features/home test/shared/presentation/product_card_test.dart`

Expected: the same suite passes after deletion, proving coverage migration and absence of imports.

- [ ] **Step 6: Commit cleanup**

```bash
git add lib/features/home/presentation/widgets test/features/home
git commit -m "refactor(home): remove superseded home widgets"
```

---

### Task 10: Accessibility, Directionality, and Final Quality Gate

**Files:**
- Modify as failures identify: files changed in Tasks 1–9 only.
- Create: `test/features/home/presentation/home_accessibility_test.dart`
- Modify: `docs/superpowers/specs/2026-08-02-mangoshop-home-redesign-design.md` only if implementation reveals an approved-spec discrepancy; document the exact decision in the same final commit.

**Interfaces:**
- Produces no new public interface.
- Verifies the complete acceptance contract from the design specification.

- [ ] **Step 1: Add the accessibility matrix test**

Pump HomePage for this matrix:

```dart
const cases = <({Locale locale, ThemeMode mode, double scale, Size size})>[
  (locale: Locale('en'), mode: ThemeMode.light, scale: 1, size: Size(320, 720)),
  (locale: Locale('ar'), mode: ThemeMode.light, scale: 2, size: Size(320, 720)),
  (locale: Locale('en'), mode: ThemeMode.dark, scale: 2, size: Size(390, 844)),
  (locale: Locale('ar'), mode: ThemeMode.dark, scale: 1, size: Size(800, 1100)),
];
```

For each case assert `tester.takeException()` is null, the search/cart/category Semantics nodes exist, actions are at least 48×48, and no English `Featured` appears in Arabic.

- [ ] **Step 2: Run the matrix and fix only observed failures**

Run: `flutter test test/features/home/presentation/home_accessibility_test.dart`

Expected: pass after resolving any reported overflow, semantics, or localization failure in the owning component.

- [ ] **Step 3: Scan for forbidden hard-coded and directional patterns**

Run:

```powershell
$homeFiles = Get-ChildItem lib\features\home,lib\shared\presentation\widgets -Recurse -File -Filter *.dart
$homeFiles | Select-String -Pattern "'Featured'|'See All'|'Sold Out'|EdgeInsets\.only\(left|EdgeInsets\.only\(right|Positioned\(.*left|Positioned\(.*right"
```

Expected: no user-facing English literals and no new non-directional positioning in the redesigned components.

- [ ] **Step 4: Run formatter, localization generation, analyzer, and complete tests**

Run: `flutter gen-l10n`

Run: `dart format --set-exit-if-changed lib test`

Run: `flutter analyze`

Run: `flutter test`

Expected: all commands exit 0; analyzer reports no issues and the test runner reports zero failures.

- [ ] **Step 5: Inspect Git scope before final commit**

Run: `git status --short`

Run: `git diff --check`

Run: `git diff --name-only`

Expected: only intended Rehlaa source, test, generated localization, and approved documentation files are changed; `mangoshop/` remains untracked and unstaged.

- [ ] **Step 6: Commit final accessibility and quality gate**

```bash
git add lib test docs/superpowers/specs/2026-08-02-mangoshop-home-redesign-design.md
git commit -m "test(home): verify responsive localized redesign"
```

---

## Execution Checkpoints

- After Task 1: review light/dark screens for palette regression outside Home.
- After Task 4: review Hero on 320, 390, and 800 logical-pixel widths.
- After Task 6: review Arabic category labels at TextScaler 2.0.
- After Task 8: compare the complete Home rhythm with MangoShop preview while checking Rehlaa content remains unchanged.
- After Task 10: require fresh `flutter analyze` and `flutter test` evidence before claiming completion.

## Deferred Data-Backed Sections

`HomeRecentOrders`, `HomePartnersGrid`, and a distinct `HomeCategoryPromotion` are intentionally not implementation tasks because the current repository has no real order, partner, or category-promotion source. Adding any of them requires a separate domain/data specification defining repository contracts, caching, authorization, empty states, and navigation. This plan satisfies the approved rule that absent optional data produces no placeholder section.
