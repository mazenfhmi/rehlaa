// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BankAccount {
  String get id;
  String get bankId;
  String get beneficiaryNameAr;
  String get beneficiaryNameEn;
  String get accountNumber;
  String get instructionsAr;
  String get instructionsEn;

  /// Create a copy of BankAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BankAccountCopyWith<BankAccount> get copyWith =>
      _$BankAccountCopyWithImpl<BankAccount>(this as BankAccount, _$identity);

  /// Serializes this BankAccount to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BankAccount &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bankId, bankId) || other.bankId == bankId) &&
            (identical(other.beneficiaryNameAr, beneficiaryNameAr) ||
                other.beneficiaryNameAr == beneficiaryNameAr) &&
            (identical(other.beneficiaryNameEn, beneficiaryNameEn) ||
                other.beneficiaryNameEn == beneficiaryNameEn) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.instructionsAr, instructionsAr) ||
                other.instructionsAr == instructionsAr) &&
            (identical(other.instructionsEn, instructionsEn) ||
                other.instructionsEn == instructionsEn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    bankId,
    beneficiaryNameAr,
    beneficiaryNameEn,
    accountNumber,
    instructionsAr,
    instructionsEn,
  );

  @override
  String toString() {
    return 'BankAccount(id: $id, bankId: $bankId, beneficiaryNameAr: $beneficiaryNameAr, beneficiaryNameEn: $beneficiaryNameEn, accountNumber: $accountNumber, instructionsAr: $instructionsAr, instructionsEn: $instructionsEn)';
  }
}

/// @nodoc
abstract mixin class $BankAccountCopyWith<$Res> {
  factory $BankAccountCopyWith(
    BankAccount value,
    $Res Function(BankAccount) _then,
  ) = _$BankAccountCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String bankId,
    String beneficiaryNameAr,
    String beneficiaryNameEn,
    String accountNumber,
    String instructionsAr,
    String instructionsEn,
  });
}

/// @nodoc
class _$BankAccountCopyWithImpl<$Res> implements $BankAccountCopyWith<$Res> {
  _$BankAccountCopyWithImpl(this._self, this._then);

  final BankAccount _self;
  final $Res Function(BankAccount) _then;

  /// Create a copy of BankAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bankId = null,
    Object? beneficiaryNameAr = null,
    Object? beneficiaryNameEn = null,
    Object? accountNumber = null,
    Object? instructionsAr = null,
    Object? instructionsEn = null,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        bankId: null == bankId
            ? _self.bankId
            : bankId // ignore: cast_nullable_to_non_nullable
                  as String,
        beneficiaryNameAr: null == beneficiaryNameAr
            ? _self.beneficiaryNameAr
            : beneficiaryNameAr // ignore: cast_nullable_to_non_nullable
                  as String,
        beneficiaryNameEn: null == beneficiaryNameEn
            ? _self.beneficiaryNameEn
            : beneficiaryNameEn // ignore: cast_nullable_to_non_nullable
                  as String,
        accountNumber: null == accountNumber
            ? _self.accountNumber
            : accountNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        instructionsAr: null == instructionsAr
            ? _self.instructionsAr
            : instructionsAr // ignore: cast_nullable_to_non_nullable
                  as String,
        instructionsEn: null == instructionsEn
            ? _self.instructionsEn
            : instructionsEn // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [BankAccount].
extension BankAccountPatterns on BankAccount {
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
    TResult Function(_BankAccount value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BankAccount() when $default != null:
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
    TResult Function(_BankAccount value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BankAccount():
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
    TResult? Function(_BankAccount value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BankAccount() when $default != null:
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
      String id,
      String bankId,
      String beneficiaryNameAr,
      String beneficiaryNameEn,
      String accountNumber,
      String instructionsAr,
      String instructionsEn,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BankAccount() when $default != null:
        return $default(
          _that.id,
          _that.bankId,
          _that.beneficiaryNameAr,
          _that.beneficiaryNameEn,
          _that.accountNumber,
          _that.instructionsAr,
          _that.instructionsEn,
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
      String id,
      String bankId,
      String beneficiaryNameAr,
      String beneficiaryNameEn,
      String accountNumber,
      String instructionsAr,
      String instructionsEn,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BankAccount():
        return $default(
          _that.id,
          _that.bankId,
          _that.beneficiaryNameAr,
          _that.beneficiaryNameEn,
          _that.accountNumber,
          _that.instructionsAr,
          _that.instructionsEn,
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
      String id,
      String bankId,
      String beneficiaryNameAr,
      String beneficiaryNameEn,
      String accountNumber,
      String instructionsAr,
      String instructionsEn,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BankAccount() when $default != null:
        return $default(
          _that.id,
          _that.bankId,
          _that.beneficiaryNameAr,
          _that.beneficiaryNameEn,
          _that.accountNumber,
          _that.instructionsAr,
          _that.instructionsEn,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BankAccount implements BankAccount {
  const _BankAccount({
    required this.id,
    required this.bankId,
    required this.beneficiaryNameAr,
    required this.beneficiaryNameEn,
    required this.accountNumber,
    required this.instructionsAr,
    required this.instructionsEn,
  });
  factory _BankAccount.fromJson(Map<String, dynamic> json) =>
      _$BankAccountFromJson(json);

  @override
  final String id;
  @override
  final String bankId;
  @override
  final String beneficiaryNameAr;
  @override
  final String beneficiaryNameEn;
  @override
  final String accountNumber;
  @override
  final String instructionsAr;
  @override
  final String instructionsEn;

  /// Create a copy of BankAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BankAccountCopyWith<_BankAccount> get copyWith =>
      __$BankAccountCopyWithImpl<_BankAccount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BankAccountToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BankAccount &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bankId, bankId) || other.bankId == bankId) &&
            (identical(other.beneficiaryNameAr, beneficiaryNameAr) ||
                other.beneficiaryNameAr == beneficiaryNameAr) &&
            (identical(other.beneficiaryNameEn, beneficiaryNameEn) ||
                other.beneficiaryNameEn == beneficiaryNameEn) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.instructionsAr, instructionsAr) ||
                other.instructionsAr == instructionsAr) &&
            (identical(other.instructionsEn, instructionsEn) ||
                other.instructionsEn == instructionsEn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    bankId,
    beneficiaryNameAr,
    beneficiaryNameEn,
    accountNumber,
    instructionsAr,
    instructionsEn,
  );

  @override
  String toString() {
    return 'BankAccount(id: $id, bankId: $bankId, beneficiaryNameAr: $beneficiaryNameAr, beneficiaryNameEn: $beneficiaryNameEn, accountNumber: $accountNumber, instructionsAr: $instructionsAr, instructionsEn: $instructionsEn)';
  }
}

/// @nodoc
abstract mixin class _$BankAccountCopyWith<$Res>
    implements $BankAccountCopyWith<$Res> {
  factory _$BankAccountCopyWith(
    _BankAccount value,
    $Res Function(_BankAccount) _then,
  ) = __$BankAccountCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String bankId,
    String beneficiaryNameAr,
    String beneficiaryNameEn,
    String accountNumber,
    String instructionsAr,
    String instructionsEn,
  });
}

/// @nodoc
class __$BankAccountCopyWithImpl<$Res> implements _$BankAccountCopyWith<$Res> {
  __$BankAccountCopyWithImpl(this._self, this._then);

  final _BankAccount _self;
  final $Res Function(_BankAccount) _then;

  /// Create a copy of BankAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? bankId = null,
    Object? beneficiaryNameAr = null,
    Object? beneficiaryNameEn = null,
    Object? accountNumber = null,
    Object? instructionsAr = null,
    Object? instructionsEn = null,
  }) {
    return _then(
      _BankAccount(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        bankId: null == bankId
            ? _self.bankId
            : bankId // ignore: cast_nullable_to_non_nullable
                  as String,
        beneficiaryNameAr: null == beneficiaryNameAr
            ? _self.beneficiaryNameAr
            : beneficiaryNameAr // ignore: cast_nullable_to_non_nullable
                  as String,
        beneficiaryNameEn: null == beneficiaryNameEn
            ? _self.beneficiaryNameEn
            : beneficiaryNameEn // ignore: cast_nullable_to_non_nullable
                  as String,
        accountNumber: null == accountNumber
            ? _self.accountNumber
            : accountNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        instructionsAr: null == instructionsAr
            ? _self.instructionsAr
            : instructionsAr // ignore: cast_nullable_to_non_nullable
                  as String,
        instructionsEn: null == instructionsEn
            ? _self.instructionsEn
            : instructionsEn // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}
