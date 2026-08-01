import 'dart:async';

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
import 'package:rehlaa/features/home/domain/entities/home_category.dart';
import 'package:rehlaa/features/home/domain/entities/home_feed.dart';
import 'package:rehlaa/features/home/presentation/pages/home_page.dart';
import 'package:rehlaa/features/home/presentation/widgets/categories_widget.dart';
import 'package:rehlaa/generated/l10n/app_localizations.dart';

class _MockCatalogRepository extends Mock implements CatalogRepository {}

void main() {
  testWidgets('shows category loading feedback while Home data is pending', (
    tester,
  ) async {
    final repository = _MockCatalogRepository();
    final pendingFeed = Completer<Result<HomeFeed>>();
    when(() => repository.getHomeFeed()).thenAnswer((_) => pendingFeed.future);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          catalogRepositoryProvider.overrideWithValue(repository),
          isOnlineProvider.overrideWith((ref) => Stream.value(true)),
        ],
        child: const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: HomePage(),
        ),
      ),
    );

    expect(find.byType(AppLoadingIndicator), findsOneWidget);
  });

  testWidgets('renders typed categories and reports the selected id', (
    tester,
  ) async {
    String? selectedId;

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: CategoriesWidget(
            categories: _categories,
            onSelected: (id) => selectedId = id,
          ),
        ),
      ),
    );

    expect(find.text('Gaming'), findsOneWidget);

    await tester.tap(find.text('Gaming'));

    expect(selectedId, 'gaming');
  });

  testWidgets('renders categories returned by CatalogRepository', (
    tester,
  ) async {
    final repository = _MockCatalogRepository();
    when(
      () => repository.getHomeFeed(),
    ).thenAnswer((_) async => Success(CatalogMockData.homeFeed));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          catalogRepositoryProvider.overrideWithValue(repository),
          isOnlineProvider.overrideWith((ref) => Stream.value(true)),
        ],
        child: const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: HomePage(),
        ),
      ),
    );
    await tester.pump();

    expect(find.text('Game Cards'), findsOneWidget);
  });

  testWidgets('shows offline feedback when connectivity is unavailable', (
    tester,
  ) async {
    final repository = _MockCatalogRepository();
    when(
      () => repository.getHomeFeed(),
    ).thenAnswer((_) async => Success(CatalogMockData.homeFeed));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          catalogRepositoryProvider.overrideWithValue(repository),
          isOnlineProvider.overrideWith((ref) => Stream.value(false)),
        ],
        child: const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: HomePage(),
        ),
      ),
    );
    await tester.pump();

    expect(find.byType(AppOfflineBanner), findsOneWidget);
  });

  testWidgets('shows error feedback when loading categories fails', (
    tester,
  ) async {
    final repository = _MockCatalogRepository();
    when(() => repository.getHomeFeed()).thenAnswer(
      (_) async =>
          const Failure(NetworkFailure(message: 'catalog unavailable')),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          catalogRepositoryProvider.overrideWithValue(repository),
          isOnlineProvider.overrideWith((ref) => Stream.value(true)),
        ],
        child: const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: HomePage(),
        ),
      ),
    );
    await tester.pump();

    expect(find.byType(AppErrorState), findsOneWidget);
    expect(find.textContaining('catalog unavailable'), findsOneWidget);
  });
}

const _categories = [
  HomeCategory(
    id: 'all',
    titleAr: 'الكل',
    titleEn: 'All',
    svgIcon: 'assets/icons/Category.svg',
    isSelected: true,
  ),
  HomeCategory(
    id: 'gaming',
    titleAr: 'الألعاب',
    titleEn: 'Gaming',
    svgIcon: 'assets/icons/Game Icon.svg',
  ),
];
