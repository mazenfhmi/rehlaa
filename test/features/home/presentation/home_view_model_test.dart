import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rehlaa/core/result/result.dart';
import 'package:rehlaa/features/catalog/data/mock/catalog_mock_data.dart';
import 'package:rehlaa/features/catalog/domain/repositories/catalog_repository.dart';
import 'package:rehlaa/features/catalog/presentation/providers/catalog_provider.dart';
import 'package:rehlaa/features/home/presentation/providers/home_provider.dart';

class _MockCatalogRepository extends Mock implements CatalogRepository {}

void main() {
  late _MockCatalogRepository repository;
  late ProviderContainer container;

  setUp(() {
    repository = _MockCatalogRepository();
    when(
      () => repository.getHomeFeed(),
    ).thenAnswer((_) async => Success(CatalogMockData.homeFeed));
    container = ProviderContainer(
      overrides: [catalogRepositoryProvider.overrideWithValue(repository)],
    );
    addTearDown(container.dispose);
  });

  test('selectCategory filters featured products by category', () async {
    await container.read(homeViewModelProvider.future);

    container.read(homeViewModelProvider.notifier).selectCategory('cat_games');

    final state = container.read(homeViewModelProvider).requireValue;
    expect(state.selectedCategoryId, 'cat_games');
    expect(state.visibleFeaturedProducts, isEmpty);
  });

  test('refresh reloads the catalog feed', () async {
    await container.read(homeViewModelProvider.future);

    await container.read(homeViewModelProvider.notifier).refresh();

    verify(() => repository.getHomeFeed()).called(2);
    expect(container.read(homeViewModelProvider).hasValue, isTrue);
  });
}
