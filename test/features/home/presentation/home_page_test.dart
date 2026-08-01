import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rehlaa/core/design_system/design_system.dart';
import 'package:rehlaa/core/network/connectivity_service.dart';
import 'package:rehlaa/core/result/result.dart';
import 'package:rehlaa/features/catalog/data/mock/catalog_mock_data.dart';
import 'package:rehlaa/features/catalog/domain/repositories/catalog_repository.dart';
import 'package:rehlaa/features/catalog/presentation/providers/catalog_provider.dart';
import 'package:rehlaa/features/home/presentation/pages/home_page.dart';
import 'package:rehlaa/generated/l10n/app_localizations.dart';
import 'package:rehlaa/shared/presentation/widgets/product_card.dart';

class MockCatalogRepository extends Mock implements CatalogRepository {}

void main() {
  late MockCatalogRepository mockRepository;

  setUp(() {
    mockRepository = MockCatalogRepository();
    when(
      () => mockRepository.getHomeFeed(),
    ).thenAnswer((_) async => Success(CatalogMockData.homeFeed));
  });

  Widget buildApp(
    List<dynamic> overrides, {
    Locale locale = const Locale('en'),
    bool useDarkTheme = false,
    double textScale = 1,
  }) => ProviderScope(
    overrides: overrides.cast(),
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
      home: const HomePage(),
    ),
  );

  testWidgets('HomePage renders success state correctly', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(
      buildApp([
        catalogRepositoryProvider.overrideWithValue(mockRepository),
        isOnlineProvider.overrideWith((ref) => Stream.value(true)),
      ]),
    );

    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('Featured Products'), findsOneWidget);
    expect(find.text('Search products'), findsOneWidget);
    expect(find.text('Categories'), findsOneWidget);
    expect(find.text('Exclusive Offers'), findsOneWidget);
    expect(find.byType(ProductCard), findsWidgets);

    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });

  testWidgets('HomePage localizes marketplace sections in Arabic', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(
      buildApp(
        [
          catalogRepositoryProvider.overrideWithValue(mockRepository),
          isOnlineProvider.overrideWith((ref) => Stream.value(true)),
        ],
        locale: const Locale('ar'),
        useDarkTheme: true,
        textScale: 2,
      ),
    );

    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('ابحث عن المنتجات'), findsOneWidget);
    expect(find.text('الفئات'), findsOneWidget);
    expect(find.text('عروض حصرية'), findsOneWidget);
    expect(find.text('منتجات مميزة'), findsOneWidget);
    expect(tester.takeException(), isNull);

    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });

  testWidgets('HomePage renders translated empty product sections', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 1.0;
    when(() => mockRepository.getHomeFeed()).thenAnswer(
      (_) async => Success(
        CatalogMockData.homeFeed.copyWith(
          exclusiveOffers: [],
          featuredProducts: [],
        ),
      ),
    );

    await tester.pumpWidget(
      buildApp([
        catalogRepositoryProvider.overrideWithValue(mockRepository),
        isOnlineProvider.overrideWith((ref) => Stream.value(true)),
      ]),
    );
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('No items found.'), findsNWidgets(2));
    expect(tester.takeException(), isNull);

    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });

  testWidgets('HomePage renders AppOfflineBanner when stale', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 1.0;

    when(() => mockRepository.getHomeFeed()).thenAnswer(
      (_) async => Success(CatalogMockData.homeFeed.copyWith(isStale: true)),
    );

    await tester.pumpWidget(
      buildApp([
        catalogRepositoryProvider.overrideWithValue(mockRepository),
        isOnlineProvider.overrideWith((ref) => Stream.value(false)),
      ]),
    );

    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('Showing saved catalog data'), findsOneWidget);
    expect(find.byType(AppOfflineBanner), findsOneWidget);

    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });
}
