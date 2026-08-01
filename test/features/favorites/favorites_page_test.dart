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

class MockFavoritesRepository extends Mock implements FavoritesRepository {}

void main() {
  late MockFavoritesRepository mockRepo;

  setUp(() {
    mockRepo = MockFavoritesRepository();
  });

  Widget buildApp() => ProviderScope(
      overrides: [
        favoritesRepositoryProvider.overrideWithValue(mockRepo),
      ],
      child: const MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: FavoritesPage(),
      ),
    );

  testWidgets('FavoritesPage shows empty state', (tester) async {
    when(() => mockRepo.getFavorites()).thenAnswer((_) async => const Success([]));

    await tester.pumpWidget(buildApp());
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('No favorites yet'), findsOneWidget);
  });

  testWidgets('FavoritesPage shows product grid', (tester) async {
    final product = CatalogMockData.homeFeed.featuredProducts.first;
    when(() => mockRepo.getFavorites()).thenAnswer((_) async => Success([product]));

    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(buildApp());
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.text(product.nameEn), findsOneWidget);

    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });
}
