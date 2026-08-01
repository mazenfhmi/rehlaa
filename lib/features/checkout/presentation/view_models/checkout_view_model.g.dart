// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CheckoutViewModel)
final checkoutViewModelProvider = CheckoutViewModelFamily._();

final class CheckoutViewModelProvider
    extends $NotifierProvider<CheckoutViewModel, CheckoutState> {
  CheckoutViewModelProvider._({
    required CheckoutViewModelFamily super.from,
    required Money super.argument,
  }) : super(
         retry: null,
         name: r'checkoutViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$checkoutViewModelHash();

  @override
  String toString() {
    return r'checkoutViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CheckoutViewModel create() => CheckoutViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CheckoutState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CheckoutState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CheckoutViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$checkoutViewModelHash() => r'60b9ebd2347949798acb0dbd0fc2e8ed4f2190ee';

final class CheckoutViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          CheckoutViewModel,
          CheckoutState,
          CheckoutState,
          CheckoutState,
          Money
        > {
  CheckoutViewModelFamily._()
    : super(
        retry: null,
        name: r'checkoutViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CheckoutViewModelProvider call(Money subtotal) =>
      CheckoutViewModelProvider._(argument: subtotal, from: this);

  @override
  String toString() => r'checkoutViewModelProvider';
}

abstract class _$CheckoutViewModel extends $Notifier<CheckoutState> {
  late final _$args = ref.$arg as Money;
  Money get subtotal => _$args;

  CheckoutState build(Money subtotal);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<CheckoutState, CheckoutState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CheckoutState, CheckoutState>,
              CheckoutState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
