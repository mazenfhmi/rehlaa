// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HomeViewModel)
final homeViewModelProvider = HomeViewModelProvider._();

final class HomeViewModelProvider
    extends $AsyncNotifierProvider<HomeViewModel, HomeViewState> {
  HomeViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: _doNotRetry,
        name: r'homeViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeViewModelHash();

  @$internal
  @override
  HomeViewModel create() => HomeViewModel();
}

String _$homeViewModelHash() => r'82283cdae70e3e9ad97adbcc40d9627a59d77e20';

abstract class _$HomeViewModel extends $AsyncNotifier<HomeViewState> {
  FutureOr<HomeViewState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<HomeViewState>, HomeViewState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<HomeViewState>, HomeViewState>,
              AsyncValue<HomeViewState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
