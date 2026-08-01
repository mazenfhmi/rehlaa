// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CartViewModel)
final cartViewModelProvider = CartViewModelProvider._();

final class CartViewModelProvider
    extends $NotifierProvider<CartViewModel, Cart> {
  CartViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartViewModelHash();

  @$internal
  @override
  CartViewModel create() => CartViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Cart value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Cart>(value),
    );
  }
}

String _$cartViewModelHash() => r'12574e57f3e74c66ffe142209718732c7d4ae122';

abstract class _$CartViewModel extends $Notifier<Cart> {
  Cart build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Cart, Cart>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Cart, Cart>,
              Cart,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
