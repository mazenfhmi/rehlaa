// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProductDetailsViewModel)
final productDetailsViewModelProvider = ProductDetailsViewModelFamily._();

final class ProductDetailsViewModelProvider
    extends $NotifierProvider<ProductDetailsViewModel, ProductDetailsState> {
  ProductDetailsViewModelProvider._({
    required ProductDetailsViewModelFamily super.from,
    required Product super.argument,
  }) : super(
         retry: null,
         name: r'productDetailsViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$productDetailsViewModelHash();

  @override
  String toString() {
    return r'productDetailsViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ProductDetailsViewModel create() => ProductDetailsViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductDetailsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductDetailsState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ProductDetailsViewModelProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$productDetailsViewModelHash() =>
    r'e3c1875dbc1510819ab8254d3f2d76c75786e7a2';

final class ProductDetailsViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          ProductDetailsViewModel,
          ProductDetailsState,
          ProductDetailsState,
          ProductDetailsState,
          Product
        > {
  ProductDetailsViewModelFamily._()
    : super(
        retry: null,
        name: r'productDetailsViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProductDetailsViewModelProvider call(Product product) =>
      ProductDetailsViewModelProvider._(argument: product, from: this);

  @override
  String toString() => r'productDetailsViewModelProvider';
}

abstract class _$ProductDetailsViewModel
    extends $Notifier<ProductDetailsState> {
  late final _$args = ref.$arg as Product;
  Product get product => _$args;

  ProductDetailsState build(Product product);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ProductDetailsState, ProductDetailsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProductDetailsState, ProductDetailsState>,
              ProductDetailsState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
