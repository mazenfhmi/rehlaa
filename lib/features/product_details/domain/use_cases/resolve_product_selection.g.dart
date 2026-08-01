// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resolve_product_selection.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(resolveProductSelection)
final resolveProductSelectionProvider = ResolveProductSelectionProvider._();

final class ResolveProductSelectionProvider
    extends
        $FunctionalProvider<
          ResolveProductSelection,
          ResolveProductSelection,
          ResolveProductSelection
        >
    with $Provider<ResolveProductSelection> {
  ResolveProductSelectionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'resolveProductSelectionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$resolveProductSelectionHash();

  @$internal
  @override
  $ProviderElement<ResolveProductSelection> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ResolveProductSelection create(Ref ref) {
    return resolveProductSelection(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ResolveProductSelection value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ResolveProductSelection>(value),
    );
  }
}

String _$resolveProductSelectionHash() =>
    r'4c935aed40cbf6b099dd45a2ad25d89a36b3991a';
