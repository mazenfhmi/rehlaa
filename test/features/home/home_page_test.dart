import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rehlaa/core/design_system/design_system.dart';
import 'package:rehlaa/core/network/connectivity_service.dart';
import 'package:rehlaa/core/result/result.dart';
import 'package:rehlaa/features/home/data/repositories/mock_home_repository.dart';
import 'package:rehlaa/features/home/domain/entities/home_category.dart';
import 'package:rehlaa/features/home/domain/repositories/home_repository.dart';
import 'package:rehlaa/features/home/presentation/pages/home_page.dart';
import 'package:rehlaa/features/home/presentation/widgets/categories_widget.dart';
import 'package:rehlaa/generated/l10n/app_localizations.dart';

void main() {
  testWidgets('shows category loading feedback while Home data is pending', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          homeRepositoryProvider.overrideWithValue(_PendingHomeRepository()),
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

  testWidgets('renders repository categories and updates Home selection', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          homeRepositoryProvider.overrideWithValue(
            const _SuccessHomeRepository(),
          ),
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

    expect(find.text('Gaming'), findsOneWidget);

    await tester.tap(find.text('Gaming'));
    await tester.pump();

    final selectedCard = tester.widget<AnimatedContainer>(
      find.descendant(
        of: find.byKey(const ValueKey('gaming')),
        matching: find.byType(AnimatedContainer),
      ),
    );
    final decoration = selectedCard.decoration! as BoxDecoration;

    expect(decoration.color, AppColors.primary);
  });

  testWidgets('shows offline feedback when connectivity is unavailable', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          homeRepositoryProvider.overrideWithValue(
            const _SuccessHomeRepository(),
          ),
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
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          homeRepositoryProvider.overrideWithValue(
            const _FailureHomeRepository(),
          ),
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

class _PendingHomeRepository implements HomeRepository {
  final Completer<Result<List<HomeCategory>>> _completer = Completer();

  @override
  Future<Result<List<HomeCategory>>> getCategories() => _completer.future;
}

class _SuccessHomeRepository implements HomeRepository {
  const _SuccessHomeRepository();

  @override
  Future<Result<List<HomeCategory>>> getCategories() async =>
      const Success(_categories);
}

class _FailureHomeRepository implements HomeRepository {
  const _FailureHomeRepository();

  @override
  Future<Result<List<HomeCategory>>> getCategories() async => const Failure(
        NetworkFailure(message: 'catalog unavailable'),
      );
}
