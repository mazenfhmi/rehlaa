import 'package:rehlaa/features/catalog/presentation/providers/catalog_provider.dart';
import 'package:rehlaa/features/home/domain/entities/home_feed.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

Duration? _doNotRetry(int retryCount, Object error) => null;

@Riverpod(retry: _doNotRetry)
class HomeFeedViewModel extends _$HomeFeedViewModel {
  @override
  Future<HomeFeed> build() async {
    final repository = ref.watch(catalogRepositoryProvider);
    final result = await repository.getHomeFeed();

    return result.fold(
      onSuccess: (data) => data,
      onFailure: (failure) => throw Exception(failure.message), 
    );
  }
}
