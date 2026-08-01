import 'package:rehlaa/core/network/connectivity_service.dart';
import 'package:rehlaa/core/storage/storage_service.dart';
import 'package:rehlaa/features/catalog/data/data_sources/catalog_local_data_source.dart';
import 'package:rehlaa/features/catalog/data/repositories/mock_catalog_repository.dart';
import 'package:rehlaa/features/catalog/domain/repositories/catalog_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'catalog_provider.g.dart';

@riverpod
CatalogLocalDataSource catalogLocalDataSource(Ref ref) {
  final prefs = ref.watch(preferenceStorageServiceProvider);
  return CatalogLocalDataSourceImpl(prefs);
}

@riverpod
CatalogRepository catalogRepository(Ref ref) {
  final connectivity = ref.watch(connectivityServiceProvider);
  final localDataSource = ref.watch(catalogLocalDataSourceProvider);

  return MockCatalogRepository(
    connectivity: connectivity,
    localDataSource: localDataSource,
  );
}
