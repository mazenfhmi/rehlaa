// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// ViewModel managing the state of the Home Page categories.

@ProviderFor(HomeCategoriesViewModel)
final homeCategoriesViewModelProvider = HomeCategoriesViewModelProvider._();

/// ViewModel managing the state of the Home Page categories.
final class HomeCategoriesViewModelProvider
    extends
        $AsyncNotifierProvider<HomeCategoriesViewModel, List<HomeCategory>> {
  /// ViewModel managing the state of the Home Page categories.
  HomeCategoriesViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: _doNotRetry,
        name: r'homeCategoriesViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeCategoriesViewModelHash();

  @$internal
  @override
  HomeCategoriesViewModel create() => HomeCategoriesViewModel();
}

String _$homeCategoriesViewModelHash() =>
    r'fe046d6ba4ec1983c191cfd326697fc85b0225b4';

/// ViewModel managing the state of the Home Page categories.

abstract class _$HomeCategoriesViewModel
    extends $AsyncNotifier<List<HomeCategory>> {
  FutureOr<List<HomeCategory>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<HomeCategory>>, List<HomeCategory>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<HomeCategory>>, List<HomeCategory>>,
              AsyncValue<List<HomeCategory>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
