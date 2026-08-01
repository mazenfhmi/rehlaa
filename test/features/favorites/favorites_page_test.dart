import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rehlaa/core/result/result.dart';
import 'package:rehlaa/features/catalog/data/mock/catalog_mock_data.dart';
import 'package:rehlaa/features/favorites/data/repositories/mock_favorites_repository.dart';
import 'package:rehlaa/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:rehlaa/features/favorites/presentation/pages/favorites_page.dart';
import 'package:rehlaa/generated/l10n/app_localizations.dart';
import 'package:rehlaa/shared/presentation/widgets/favorite_button.dart';

class MockFavoritesRepository extends Mock implements FavoritesRepository {}

void main() {
  late MockFavoritesRepository mockRepo;

  setUp(() {
    mockRepo = MockFavoritesRepository();
  });

  Widget buildApp({
    Locale locale = const Locale('en'),
    bool useDarkTheme = false,
    double textScale = 1,
  }) => ProviderScope(
    overrides: [favoritesRepositoryProvider.overrideWithValue(mockRepo)],
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
      home: const FavoritesPage(),
    ),
  );

  testWidgets('FavoritesPage shows empty state', (tester) async {
    when(
      () => mockRepo.getFavorites(),
    ).thenAnswer((_) async => const Success([]));

    await tester.pumpWidget(buildApp());
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('No favorites yet'), findsOneWidget);
  });

  testWidgets('FavoritesPage shows product grid', (tester) async {
    final product = CatalogMockData.homeFeed.featuredProducts.first;
    when(
      () => mockRepo.getFavorites(),
    ).thenAnswer((_) async => Success([product]));

    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(
      buildApp(locale: const Locale('ar'), useDarkTheme: true, textScale: 2),
    );
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.text(product.nameAr), findsOneWidget);
    final productName = tester.widget<Text>(find.text(product.nameAr));
    final colorScheme = Theme.of(
      tester.element(find.byType(FavoritesPage)),
    ).colorScheme;
    expect(productName.style?.color, colorScheme.onSurface);
    expect(tester.takeException(), isNull);

    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });

  testWidgets('favorite disappears before repository toggle completes', (
    tester,
  ) async {
    final product = CatalogMockData.homeFeed.featuredProducts.first;
    final pendingToggle = Completer<Result<void>>();
    when(
      () => mockRepo.getFavorites(),
    ).thenAnswer((_) async => Success([product]));
    when(
      () => mockRepo.toggleFavorite(product.id),
    ).thenAnswer((_) => pendingToggle.future);

    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 1.0;
    await tester.pumpWidget(buildApp());
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    await tester.tap(find.byType(FavoriteButton));
    await tester.pump();

    expect(find.text(product.nameEn), findsNothing);

    pendingToggle.complete(const Success(null));
    await tester.pump();
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });

  testWidgets('empty favorites is localized in Dark Arabic at 200%', (
    tester,
  ) async {
    when(
      () => mockRepo.getFavorites(),
    ).thenAnswer((_) async => const Success([]));
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(
      buildApp(locale: const Locale('ar'), useDarkTheme: true, textScale: 2),
    );
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('لا توجد منتجات في المفضلة'), findsOneWidget);
    expect(tester.takeException(), isNull);

    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });
}
