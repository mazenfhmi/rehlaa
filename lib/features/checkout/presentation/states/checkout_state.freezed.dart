// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckoutState {
  bool get isLoading;
  bool get isSubmitting;
  bool get isOffline;
  CheckoutQuote? get quote;
  List<PaymentMethod> get paymentMethods;
  PaymentMethod? get selectedPaymentMethod;
  List<Bank> get banks;
  Bank? get selectedBank;
  BankAccount? get bankAccount;
  String get operationNumber;
  PickedFile? get receiptFile;
  String get couponCode;
  String get referralCode;
  bool get useWallet;
  String? get couponError;
  String? get referralError;
  String? get submissionError;
  bool get isSuccess;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CheckoutStateCopyWith<CheckoutState> get copyWith =>
      _$CheckoutStateCopyWithImpl<CheckoutState>(
        this as CheckoutState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CheckoutState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.isOffline, isOffline) ||
                other.isOffline == isOffline) &&
            (identical(other.quote, quote) || other.quote == quote) &&
            const DeepCollectionEquality().equals(
              other.paymentMethods,
              paymentMethods,
            ) &&
            (identical(other.selectedPaymentMethod, selectedPaymentMethod) ||
                other.selectedPaymentMethod == selectedPaymentMethod) &&
            const DeepCollectionEquality().equals(other.banks, banks) &&
            (identical(other.selectedBank, selectedBank) ||
                other.selectedBank == selectedBank) &&
            (identical(other.bankAccount, bankAccount) ||
                other.bankAccount == bankAccount) &&
            (identical(other.operationNumber, operationNumber) ||
                other.operationNumber == operationNumber) &&
            (identical(other.receiptFile, receiptFile) ||
                other.receiptFile == receiptFile) &&
            (identical(other.couponCode, couponCode) ||
                other.couponCode == couponCode) &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode) &&
            (identical(other.useWallet, useWallet) ||
                other.useWallet == useWallet) &&
            (identical(other.couponError, couponError) ||
                other.couponError == couponError) &&
            (identical(other.referralError, referralError) ||
                other.referralError == referralError) &&
            (identical(other.submissionError, submissionError) ||
                other.submissionError == submissionError) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    isSubmitting,
    isOffline,
    quote,
    const DeepCollectionEquality().hash(paymentMethods),
    selectedPaymentMethod,
    const DeepCollectionEquality().hash(banks),
    selectedBank,
    bankAccount,
    operationNumber,
    receiptFile,
    couponCode,
    referralCode,
    useWallet,
    couponError,
    referralError,
    submissionError,
    isSuccess,
  );

  @override
  String toString() {
    return 'CheckoutState(isLoading: $isLoading, isSubmitting: $isSubmitting, isOffline: $isOffline, quote: $quote, paymentMethods: $paymentMethods, selectedPaymentMethod: $selectedPaymentMethod, banks: $banks, selectedBank: $selectedBank, bankAccount: $bankAccount, operationNumber: $operationNumber, receiptFile: $receiptFile, couponCode: $couponCode, referralCode: $referralCode, useWallet: $useWallet, couponError: $couponError, referralError: $referralError, submissionError: $submissionError, isSuccess: $isSuccess)';
  }
}

/// @nodoc
abstract mixin class $CheckoutStateCopyWith<$Res> {
  factory $CheckoutStateCopyWith(
    CheckoutState value,
    $Res Function(CheckoutState) _then,
  ) = _$CheckoutStateCopyWithImpl;
  @useResult
  $Res call({
    bool isLoading,
    bool isSubmitting,
    bool isOffline,
    CheckoutQuote? quote,
    List<PaymentMethod> paymentMethods,
    PaymentMethod? selectedPaymentMethod,
    List<Bank> banks,
    Bank? selectedBank,
    BankAccount? bankAccount,
    String operationNumber,
    PickedFile? receiptFile,
    String couponCode,
    String referralCode,
    bool useWallet,
    String? couponError,
    String? referralError,
    String? submissionError,
    bool isSuccess,
  });

  $CheckoutQuoteCopyWith<$Res>? get quote;
  $PaymentMethodCopyWith<$Res>? get selectedPaymentMethod;
  $BankCopyWith<$Res>? get selectedBank;
  $BankAccountCopyWith<$Res>? get bankAccount;
  $PickedFileCopyWith<$Res>? get receiptFile;
}

/// @nodoc
class _$CheckoutStateCopyWithImpl<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  _$CheckoutStateCopyWithImpl(this._self, this._then);

  final CheckoutState _self;
  final $Res Function(CheckoutState) _then;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSubmitting = null,
    Object? isOffline = null,
    Object? quote = freezed,
    Object? paymentMethods = null,
    Object? selectedPaymentMethod = freezed,
    Object? banks = null,
    Object? selectedBank = freezed,
    Object? bankAccount = freezed,
    Object? operationNumber = null,
    Object? receiptFile = freezed,
    Object? couponCode = null,
    Object? referralCode = null,
    Object? useWallet = null,
    Object? couponError = freezed,
    Object? referralError = freezed,
    Object? submissionError = freezed,
    Object? isSuccess = null,
  }) {
    return _then(
      _self.copyWith(
        isLoading: null == isLoading
            ? _self.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        isSubmitting: null == isSubmitting
            ? _self.isSubmitting
            : isSubmitting // ignore: cast_nullable_to_non_nullable
                  as bool,
        isOffline: null == isOffline
            ? _self.isOffline
            : isOffline // ignore: cast_nullable_to_non_nullable
                  as bool,
        quote: freezed == quote
            ? _self.quote
            : quote // ignore: cast_nullable_to_non_nullable
                  as CheckoutQuote?,
        paymentMethods: null == paymentMethods
            ? _self.paymentMethods
            : paymentMethods // ignore: cast_nullable_to_non_nullable
                  as List<PaymentMethod>,
        selectedPaymentMethod: freezed == selectedPaymentMethod
            ? _self.selectedPaymentMethod
            : selectedPaymentMethod // ignore: cast_nullable_to_non_nullable
                  as PaymentMethod?,
        banks: null == banks
            ? _self.banks
            : banks // ignore: cast_nullable_to_non_nullable
                  as List<Bank>,
        selectedBank: freezed == selectedBank
            ? _self.selectedBank
            : selectedBank // ignore: cast_nullable_to_non_nullable
                  as Bank?,
        bankAccount: freezed == bankAccount
            ? _self.bankAccount
            : bankAccount // ignore: cast_nullable_to_non_nullable
                  as BankAccount?,
        operationNumber: null == operationNumber
            ? _self.operationNumber
            : operationNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        receiptFile: freezed == receiptFile
            ? _self.receiptFile
            : receiptFile // ignore: cast_nullable_to_non_nullable
                  as PickedFile?,
        couponCode: null == couponCode
            ? _self.couponCode
            : couponCode // ignore: cast_nullable_to_non_nullable
                  as String,
        referralCode: null == referralCode
            ? _self.referralCode
            : referralCode // ignore: cast_nullable_to_non_nullable
                  as String,
        useWallet: null == useWallet
            ? _self.useWallet
            : useWallet // ignore: cast_nullable_to_non_nullable
                  as bool,
        couponError: freezed == couponError
            ? _self.couponError
            : couponError // ignore: cast_nullable_to_non_nullable
                  as String?,
        referralError: freezed == referralError
            ? _self.referralError
            : referralError // ignore: cast_nullable_to_non_nullable
                  as String?,
        submissionError: freezed == submissionError
            ? _self.submissionError
            : submissionError // ignore: cast_nullable_to_non_nullable
                  as String?,
        isSuccess: null == isSuccess
            ? _self.isSuccess
            : isSuccess // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CheckoutQuoteCopyWith<$Res>? get quote {
    if (_self.quote == null) {
      return null;
    }

    return $CheckoutQuoteCopyWith<$Res>(_self.quote!, (value) {
      return _then(_self.copyWith(quote: value));
    });
  }

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentMethodCopyWith<$Res>? get selectedPaymentMethod {
    if (_self.selectedPaymentMethod == null) {
      return null;
    }

    return $PaymentMethodCopyWith<$Res>(_self.selectedPaymentMethod!, (value) {
      return _then(_self.copyWith(selectedPaymentMethod: value));
    });
  }

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BankCopyWith<$Res>? get selectedBank {
    if (_self.selectedBank == null) {
      return null;
    }

    return $BankCopyWith<$Res>(_self.selectedBank!, (value) {
      return _then(_self.copyWith(selectedBank: value));
    });
  }

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BankAccountCopyWith<$Res>? get bankAccount {
    if (_self.bankAccount == null) {
      return null;
    }

    return $BankAccountCopyWith<$Res>(_self.bankAccount!, (value) {
      return _then(_self.copyWith(bankAccount: value));
    });
  }

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PickedFileCopyWith<$Res>? get receiptFile {
    if (_self.receiptFile == null) {
      return null;
    }

    return $PickedFileCopyWith<$Res>(_self.receiptFile!, (value) {
      return _then(_self.copyWith(receiptFile: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CheckoutState].
extension CheckoutStatePatterns on CheckoutState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CheckoutState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CheckoutState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CheckoutState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckoutState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CheckoutState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckoutState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      bool isLoading,
      bool isSubmitting,
      bool isOffline,
      CheckoutQuote? quote,
      List<PaymentMethod> paymentMethods,
      PaymentMethod? selectedPaymentMethod,
      List<Bank> banks,
      Bank? selectedBank,
      BankAccount? bankAccount,
      String operationNumber,
      PickedFile? receiptFile,
      String couponCode,
      String referralCode,
      bool useWallet,
      String? couponError,
      String? referralError,
      String? submissionError,
      bool isSuccess,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CheckoutState() when $default != null:
        return $default(
          _that.isLoading,
          _that.isSubmitting,
          _that.isOffline,
          _that.quote,
          _that.paymentMethods,
          _that.selectedPaymentMethod,
          _that.banks,
          _that.selectedBank,
          _that.bankAccount,
          _that.operationNumber,
          _that.receiptFile,
          _that.couponCode,
          _that.referralCode,
          _that.useWallet,
          _that.couponError,
          _that.referralError,
          _that.submissionError,
          _that.isSuccess,
        );
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      bool isLoading,
      bool isSubmitting,
      bool isOffline,
      CheckoutQuote? quote,
      List<PaymentMethod> paymentMethods,
      PaymentMethod? selectedPaymentMethod,
      List<Bank> banks,
      Bank? selectedBank,
      BankAccount? bankAccount,
      String operationNumber,
      PickedFile? receiptFile,
      String couponCode,
      String referralCode,
      bool useWallet,
      String? couponError,
      String? referralError,
      String? submissionError,
      bool isSuccess,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckoutState():
        return $default(
          _that.isLoading,
          _that.isSubmitting,
          _that.isOffline,
          _that.quote,
          _that.paymentMethods,
          _that.selectedPaymentMethod,
          _that.banks,
          _that.selectedBank,
          _that.bankAccount,
          _that.operationNumber,
          _that.receiptFile,
          _that.couponCode,
          _that.referralCode,
          _that.useWallet,
          _that.couponError,
          _that.referralError,
          _that.submissionError,
          _that.isSuccess,
        );
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      bool isLoading,
      bool isSubmitting,
      bool isOffline,
      CheckoutQuote? quote,
      List<PaymentMethod> paymentMethods,
      PaymentMethod? selectedPaymentMethod,
      List<Bank> banks,
      Bank? selectedBank,
      BankAccount? bankAccount,
      String operationNumber,
      PickedFile? receiptFile,
      String couponCode,
      String referralCode,
      bool useWallet,
      String? couponError,
      String? referralError,
      String? submissionError,
      bool isSuccess,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckoutState() when $default != null:
        return $default(
          _that.isLoading,
          _that.isSubmitting,
          _that.isOffline,
          _that.quote,
          _that.paymentMethods,
          _that.selectedPaymentMethod,
          _that.banks,
          _that.selectedBank,
          _that.bankAccount,
          _that.operationNumber,
          _that.receiptFile,
          _that.couponCode,
          _that.referralCode,
          _that.useWallet,
          _that.couponError,
          _that.referralError,
          _that.submissionError,
          _that.isSuccess,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CheckoutState extends CheckoutState {
  const _CheckoutState({
    this.isLoading = false,
    this.isSubmitting = false,
    this.isOffline = false,
    this.quote,
    final List<PaymentMethod> paymentMethods = const [],
    this.selectedPaymentMethod,
    final List<Bank> banks = const [],
    this.selectedBank,
    this.bankAccount,
    this.operationNumber = '',
    this.receiptFile,
    this.couponCode = '',
    this.referralCode = '',
    this.useWallet = false,
    this.couponError,
    this.referralError,
    this.submissionError,
    this.isSuccess = false,
  }) : _paymentMethods = paymentMethods,
       _banks = banks,
       super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSubmitting;
  @override
  @JsonKey()
  final bool isOffline;
  @override
  final CheckoutQuote? quote;
  final List<PaymentMethod> _paymentMethods;
  @override
  @JsonKey()
  List<PaymentMethod> get paymentMethods {
    if (_paymentMethods is EqualUnmodifiableListView) return _paymentMethods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentMethods);
  }

  @override
  final PaymentMethod? selectedPaymentMethod;
  final List<Bank> _banks;
  @override
  @JsonKey()
  List<Bank> get banks {
    if (_banks is EqualUnmodifiableListView) return _banks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_banks);
  }

  @override
  final Bank? selectedBank;
  @override
  final BankAccount? bankAccount;
  @override
  @JsonKey()
  final String operationNumber;
  @override
  final PickedFile? receiptFile;
  @override
  @JsonKey()
  final String couponCode;
  @override
  @JsonKey()
  final String referralCode;
  @override
  @JsonKey()
  final bool useWallet;
  @override
  final String? couponError;
  @override
  final String? referralError;
  @override
  final String? submissionError;
  @override
  @JsonKey()
  final bool isSuccess;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CheckoutStateCopyWith<_CheckoutState> get copyWith =>
      __$CheckoutStateCopyWithImpl<_CheckoutState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CheckoutState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.isOffline, isOffline) ||
                other.isOffline == isOffline) &&
            (identical(other.quote, quote) || other.quote == quote) &&
            const DeepCollectionEquality().equals(
              other._paymentMethods,
              _paymentMethods,
            ) &&
            (identical(other.selectedPaymentMethod, selectedPaymentMethod) ||
                other.selectedPaymentMethod == selectedPaymentMethod) &&
            const DeepCollectionEquality().equals(other._banks, _banks) &&
            (identical(other.selectedBank, selectedBank) ||
                other.selectedBank == selectedBank) &&
            (identical(other.bankAccount, bankAccount) ||
                other.bankAccount == bankAccount) &&
            (identical(other.operationNumber, operationNumber) ||
                other.operationNumber == operationNumber) &&
            (identical(other.receiptFile, receiptFile) ||
                other.receiptFile == receiptFile) &&
            (identical(other.couponCode, couponCode) ||
                other.couponCode == couponCode) &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode) &&
            (identical(other.useWallet, useWallet) ||
                other.useWallet == useWallet) &&
            (identical(other.couponError, couponError) ||
                other.couponError == couponError) &&
            (identical(other.referralError, referralError) ||
                other.referralError == referralError) &&
            (identical(other.submissionError, submissionError) ||
                other.submissionError == submissionError) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    isSubmitting,
    isOffline,
    quote,
    const DeepCollectionEquality().hash(_paymentMethods),
    selectedPaymentMethod,
    const DeepCollectionEquality().hash(_banks),
    selectedBank,
    bankAccount,
    operationNumber,
    receiptFile,
    couponCode,
    referralCode,
    useWallet,
    couponError,
    referralError,
    submissionError,
    isSuccess,
  );

  @override
  String toString() {
    return 'CheckoutState(isLoading: $isLoading, isSubmitting: $isSubmitting, isOffline: $isOffline, quote: $quote, paymentMethods: $paymentMethods, selectedPaymentMethod: $selectedPaymentMethod, banks: $banks, selectedBank: $selectedBank, bankAccount: $bankAccount, operationNumber: $operationNumber, receiptFile: $receiptFile, couponCode: $couponCode, referralCode: $referralCode, useWallet: $useWallet, couponError: $couponError, referralError: $referralError, submissionError: $submissionError, isSuccess: $isSuccess)';
  }
}

/// @nodoc
abstract mixin class _$CheckoutStateCopyWith<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  factory _$CheckoutStateCopyWith(
    _CheckoutState value,
    $Res Function(_CheckoutState) _then,
  ) = __$CheckoutStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    bool isLoading,
    bool isSubmitting,
    bool isOffline,
    CheckoutQuote? quote,
    List<PaymentMethod> paymentMethods,
    PaymentMethod? selectedPaymentMethod,
    List<Bank> banks,
    Bank? selectedBank,
    BankAccount? bankAccount,
    String operationNumber,
    PickedFile? receiptFile,
    String couponCode,
    String referralCode,
    bool useWallet,
    String? couponError,
    String? referralError,
    String? submissionError,
    bool isSuccess,
  });

  @override
  $CheckoutQuoteCopyWith<$Res>? get quote;
  @override
  $PaymentMethodCopyWith<$Res>? get selectedPaymentMethod;
  @override
  $BankCopyWith<$Res>? get selectedBank;
  @override
  $BankAccountCopyWith<$Res>? get bankAccount;
  @override
  $PickedFileCopyWith<$Res>? get receiptFile;
}

/// @nodoc
class __$CheckoutStateCopyWithImpl<$Res>
    implements _$CheckoutStateCopyWith<$Res> {
  __$CheckoutStateCopyWithImpl(this._self, this._then);

  final _CheckoutState _self;
  final $Res Function(_CheckoutState) _then;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? isSubmitting = null,
    Object? isOffline = null,
    Object? quote = freezed,
    Object? paymentMethods = null,
    Object? selectedPaymentMethod = freezed,
    Object? banks = null,
    Object? selectedBank = freezed,
    Object? bankAccount = freezed,
    Object? operationNumber = null,
    Object? receiptFile = freezed,
    Object? couponCode = null,
    Object? referralCode = null,
    Object? useWallet = null,
    Object? couponError = freezed,
    Object? referralError = freezed,
    Object? submissionError = freezed,
    Object? isSuccess = null,
  }) {
    return _then(
      _CheckoutState(
        isLoading: null == isLoading
            ? _self.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        isSubmitting: null == isSubmitting
            ? _self.isSubmitting
            : isSubmitting // ignore: cast_nullable_to_non_nullable
                  as bool,
        isOffline: null == isOffline
            ? _self.isOffline
            : isOffline // ignore: cast_nullable_to_non_nullable
                  as bool,
        quote: freezed == quote
            ? _self.quote
            : quote // ignore: cast_nullable_to_non_nullable
                  as CheckoutQuote?,
        paymentMethods: null == paymentMethods
            ? _self._paymentMethods
            : paymentMethods // ignore: cast_nullable_to_non_nullable
                  as List<PaymentMethod>,
        selectedPaymentMethod: freezed == selectedPaymentMethod
            ? _self.selectedPaymentMethod
            : selectedPaymentMethod // ignore: cast_nullable_to_non_nullable
                  as PaymentMethod?,
        banks: null == banks
            ? _self._banks
            : banks // ignore: cast_nullable_to_non_nullable
                  as List<Bank>,
        selectedBank: freezed == selectedBank
            ? _self.selectedBank
            : selectedBank // ignore: cast_nullable_to_non_nullable
                  as Bank?,
        bankAccount: freezed == bankAccount
            ? _self.bankAccount
            : bankAccount // ignore: cast_nullable_to_non_nullable
                  as BankAccount?,
        operationNumber: null == operationNumber
            ? _self.operationNumber
            : operationNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        receiptFile: freezed == receiptFile
            ? _self.receiptFile
            : receiptFile // ignore: cast_nullable_to_non_nullable
                  as PickedFile?,
        couponCode: null == couponCode
            ? _self.couponCode
            : couponCode // ignore: cast_nullable_to_non_nullable
                  as String,
        referralCode: null == referralCode
            ? _self.referralCode
            : referralCode // ignore: cast_nullable_to_non_nullable
                  as String,
        useWallet: null == useWallet
            ? _self.useWallet
            : useWallet // ignore: cast_nullable_to_non_nullable
                  as bool,
        couponError: freezed == couponError
            ? _self.couponError
            : couponError // ignore: cast_nullable_to_non_nullable
                  as String?,
        referralError: freezed == referralError
            ? _self.referralError
            : referralError // ignore: cast_nullable_to_non_nullable
                  as String?,
        submissionError: freezed == submissionError
            ? _self.submissionError
            : submissionError // ignore: cast_nullable_to_non_nullable
                  as String?,
        isSuccess: null == isSuccess
            ? _self.isSuccess
            : isSuccess // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CheckoutQuoteCopyWith<$Res>? get quote {
    if (_self.quote == null) {
      return null;
    }

    return $CheckoutQuoteCopyWith<$Res>(_self.quote!, (value) {
      return _then(_self.copyWith(quote: value));
    });
  }

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentMethodCopyWith<$Res>? get selectedPaymentMethod {
    if (_self.selectedPaymentMethod == null) {
      return null;
    }

    return $PaymentMethodCopyWith<$Res>(_self.selectedPaymentMethod!, (value) {
      return _then(_self.copyWith(selectedPaymentMethod: value));
    });
  }

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BankCopyWith<$Res>? get selectedBank {
    if (_self.selectedBank == null) {
      return null;
    }

    return $BankCopyWith<$Res>(_self.selectedBank!, (value) {
      return _then(_self.copyWith(selectedBank: value));
    });
  }

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BankAccountCopyWith<$Res>? get bankAccount {
    if (_self.bankAccount == null) {
      return null;
    }

    return $BankAccountCopyWith<$Res>(_self.bankAccount!, (value) {
      return _then(_self.copyWith(bankAccount: value));
    });
  }

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PickedFileCopyWith<$Res>? get receiptFile {
    if (_self.receiptFile == null) {
      return null;
    }

    return $PickedFileCopyWith<$Res>(_self.receiptFile!, (value) {
      return _then(_self.copyWith(receiptFile: value));
    });
  }
}
