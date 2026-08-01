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
    extends $NotifierProvider<ProductDetailsViewModel, ProductSelection> {
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
  Override overrideWithValue(ProductSelection value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductSelection>(value),
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
    r'd0ac92a7de7f3ae02799ef026a755843aed2f5a2';

final class ProductDetailsViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          ProductDetailsViewModel,
          ProductSelection,
          ProductSelection,
          ProductSelection,
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

abstract class _$ProductDetailsViewModel extends $Notifier<ProductSelection> {
  late final _$args = ref.$arg as Product;
  Product get product => _$args;

  ProductSelection build(Product product);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ProductSelection, ProductSelection>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProductSelection, ProductSelection>,
              ProductSelection,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
