import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rehlaa/core/result/result.dart';
import 'package:rehlaa/core/network/connectivity_service.dart';
import 'package:rehlaa/features/catalog/data/data_sources/catalog_local_data_source.dart';
import 'package:rehlaa/features/catalog/data/mock/catalog_mock_data.dart';
import 'package:rehlaa/features/catalog/data/repositories/mock_catalog_repository.dart';
import 'package:rehlaa/features/home/domain/entities/home_feed.dart';
import 'package:rehlaa/shared/domain/money/money.dart';

class MockConnectivityService extends Mock implements ConnectivityService {}
class MockCatalogLocalDataSource extends Mock implements CatalogLocalDataSource {}

void main() {
  late MockCatalogRepository repository;
  late MockConnectivityService mockConnectivity;
  late MockCatalogLocalDataSource mockLocalDataSource;

  setUpAll(() {
    registerFallbackValue(CatalogMockData.homeFeed);
  });

  setUp(() {
    mockConnectivity = MockConnectivityService();
    mockLocalDataSource = MockCatalogLocalDataSource();
    repository = MockCatalogRepository(
      connectivity: mockConnectivity,
      localDataSource: mockLocalDataSource,
      delay: Duration.zero,
    );
  });

  group('MockCatalogRepository', () {
    test('getHomeFeed returns deterministic feed and caches it when online', () async {
      when(() => mockConnectivity.isConnected).thenAnswer((_) async => true);
      when(() => mockLocalDataSource.cacheHomeFeed(any())).thenAnswer((_) async {});

      final result = await repository.getHomeFeed();

      expect(result.isSuccess, isTrue);
      final feed = result.dataOrThrow;
      
      expect(feed.banners.length, 1);
      expect(feed.categories.length, 2);
      
      final googleOne = feed.featuredProducts.firstWhere((p) => p.id == 'prod_google_one');
      expect(googleOne.nameEn, 'Google One + Gemini Pro');
      expect(googleOne.basePrice, const Money.sdg(13500000));
      expect(googleOne.compareAtPrice, const Money.sdg(39900000));

      verify(() => mockLocalDataSource.cacheHomeFeed(any())).called(1);
    });

    test('getHomeFeed returns cached feed when offline and marks it stale', () async {
      when(() => mockConnectivity.isConnected).thenAnswer((_) async => false);
      
      final cachedFeed = CatalogMockData.homeFeed.copyWith(isStale: true);
      when(() => mockLocalDataSource.getCachedHomeFeed()).thenAnswer((_) async => cachedFeed);

      final result = await repository.getHomeFeed();

      expect(result.isSuccess, isTrue);
      final feed = result.dataOrThrow;
      expect(feed.isStale, isTrue);
    });

    test('getHomeFeed returns OfflineFailure when offline and no cache exists', () async {
      when(() => mockConnectivity.isConnected).thenAnswer((_) async => false);
      when(() => mockLocalDataSource.getCachedHomeFeed()).thenAnswer((_) async => null);

      final result = await repository.getHomeFeed();

      expect(result.isFailure, isTrue);
      result.fold(
        onSuccess: (_) => fail('Expected failure'),
        onFailure: (failure) {
          expect(failure, isA<OfflineFailure>());
        },
      );
    });
  });
}
