import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rehlaa/core/result/result.dart';
import 'package:rehlaa/features/catalog/data/mock/catalog_mock_data.dart';
import 'package:rehlaa/features/favorites/data/repositories/mock_favorites_repository.dart';
import 'package:rehlaa/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:rehlaa/features/favorites/presentation/view_models/favorites_view_model.dart';

class MockFavoritesRepository extends Mock implements FavoritesRepository {}

void main() {
  late MockFavoritesRepository mockRepo;
  late ProviderContainer container;

  setUp(() {
    mockRepo = MockFavoritesRepository();
    container = ProviderContainer(
      overrides: [
        favoritesRepositoryProvider.overrideWithValue(mockRepo),
      ],
    );
  });
  
  test('toggleFavorite performs optimistic update and rolls back on failure', () async {
    final product = CatalogMockData.homeFeed.featuredProducts.first;
    when(() => mockRepo.getFavorites()).thenAnswer((_) async => Success([product]));
    
    // Keep the provider alive
    container.listen(favoritesViewModelProvider, (_, __) {});
    
    await container.read(favoritesViewModelProvider.future);
    expect(container.read(favoritesViewModelProvider).value, [product]);

    when(() => mockRepo.toggleFavorite(product.id))
        .thenAnswer((_) async {
          await Future<void>.delayed(const Duration(milliseconds: 50));
          return const Failure(NetworkFailure(message: 'Failed'));
        });

    final future = container.read(favoritesViewModelProvider.notifier).toggleFavorite(product);
    
    expect(container.read(favoritesViewModelProvider).value, isEmpty);
    
    await future;
    
    expect(container.read(favoritesViewModelProvider).value, [product]);
  });
}
