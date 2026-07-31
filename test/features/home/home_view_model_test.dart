import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rehlaa/features/home/data/repositories/mock_home_repository.dart';
import 'package:rehlaa/features/home/presentation/view_models/home_view_model.dart';

void main() {
  group('HomeCategoriesViewModel', () {
    test('loads categories from mock repository', () async {
      final container = ProviderContainer(
        overrides: [
          homeRepositoryProvider.overrideWithValue(const MockHomeRepository()),
        ],
      );
      addTearDown(container.dispose);

      final categories =
          await container.read(homeCategoriesViewModelProvider.future);

      expect(categories, isNotEmpty);
      expect(categories.first.id, equals('1'));
      expect(categories.first.isSelected, isTrue);
    });

    test('selectCategory updates selection state', () async {
      final container = ProviderContainer(
        overrides: [
          homeRepositoryProvider.overrideWithValue(const MockHomeRepository()),
        ],
      );
      addTearDown(container.dispose);

      // Listen to provider to ensure it stays active
      container.listen(homeCategoriesViewModelProvider, (_, __) {});

      await container.read(homeCategoriesViewModelProvider.future);

      container
          .read(homeCategoriesViewModelProvider.notifier)
          .selectCategory('2');

      final categories =
          container.read(homeCategoriesViewModelProvider).valueOrNull;

      expect(categories, isNotNull);
      expect(categories!.firstWhere((c) => c.id == '1').isSelected, isFalse);
      expect(categories.firstWhere((c) => c.id == '2').isSelected, isTrue);
    });
  });
}
