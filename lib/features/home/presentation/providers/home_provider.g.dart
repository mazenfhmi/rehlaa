// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HomeFeedViewModel)
final homeFeedViewModelProvider = HomeFeedViewModelProvider._();

final class HomeFeedViewModelProvider
    extends $AsyncNotifierProvider<HomeFeedViewModel, HomeFeed> {
  HomeFeedViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: _doNotRetry,
        name: r'homeFeedViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeFeedViewModelHash();

  @$internal
  @override
  HomeFeedViewModel create() => HomeFeedViewModel();
}

String _$homeFeedViewModelHash() => r'6e3e16bc8af6e813ed0c0a3dffeafcba7eddadaf';

abstract class _$HomeFeedViewModel extends $AsyncNotifier<HomeFeed> {
  FutureOr<HomeFeed> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<HomeFeed>, HomeFeed>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<HomeFeed>, HomeFeed>,
              AsyncValue<HomeFeed>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
