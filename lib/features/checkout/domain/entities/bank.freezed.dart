// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Bank {
  String get id;
  String get nameAr;
  String get nameEn;
  String get logoUrl;

  /// Create a copy of Bank
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BankCopyWith<Bank> get copyWith =>
      _$BankCopyWithImpl<Bank>(this as Bank, _$identity);

  /// Serializes this Bank to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Bank &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nameAr, nameAr) || other.nameAr == nameAr) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nameAr, nameEn, logoUrl);

  @override
  String toString() {
    return 'Bank(id: $id, nameAr: $nameAr, nameEn: $nameEn, logoUrl: $logoUrl)';
  }
}

/// @nodoc
abstract mixin class $BankCopyWith<$Res> {
  factory $BankCopyWith(Bank value, $Res Function(Bank) _then) =
      _$BankCopyWithImpl;
  @useResult
  $Res call({String id, String nameAr, String nameEn, String logoUrl});
}

/// @nodoc
class _$BankCopyWithImpl<$Res> implements $BankCopyWith<$Res> {
  _$BankCopyWithImpl(this._self, this._then);

  final Bank _self;
  final $Res Function(Bank) _then;

  /// Create a copy of Bank
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameAr = null,
    Object? nameEn = null,
    Object? logoUrl = null,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        nameAr: null == nameAr
            ? _self.nameAr
            : nameAr // ignore: cast_nullable_to_non_nullable
                  as String,
        nameEn: null == nameEn
            ? _self.nameEn
            : nameEn // ignore: cast_nullable_to_non_nullable
                  as String,
        logoUrl: null == logoUrl
            ? _self.logoUrl
            : logoUrl // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Bank].
extension BankPatterns on Bank {
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
    TResult Function(_Bank value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Bank() when $default != null:
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
  TResult map<TResult extends Object?>(TResult Function(_Bank value) $default) {
    final _that = this;
    switch (_that) {
      case _Bank():
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
    TResult? Function(_Bank value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Bank() when $default != null:
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
    TResult Function(String id, String nameAr, String nameEn, String logoUrl)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Bank() when $default != null:
        return $default(_that.id, _that.nameAr, _that.nameEn, _that.logoUrl);
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
    TResult Function(String id, String nameAr, String nameEn, String logoUrl)
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Bank():
        return $default(_that.id, _that.nameAr, _that.nameEn, _that.logoUrl);
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
    TResult? Function(String id, String nameAr, String nameEn, String logoUrl)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Bank() when $default != null:
        return $default(_that.id, _that.nameAr, _that.nameEn, _that.logoUrl);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Bank implements Bank {
  const _Bank({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.logoUrl,
  });
  factory _Bank.fromJson(Map<String, dynamic> json) => _$BankFromJson(json);

  @override
  final String id;
  @override
  final String nameAr;
  @override
  final String nameEn;
  @override
  final String logoUrl;

  /// Create a copy of Bank
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BankCopyWith<_Bank> get copyWith =>
      __$BankCopyWithImpl<_Bank>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BankToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Bank &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nameAr, nameAr) || other.nameAr == nameAr) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nameAr, nameEn, logoUrl);

  @override
  String toString() {
    return 'Bank(id: $id, nameAr: $nameAr, nameEn: $nameEn, logoUrl: $logoUrl)';
  }
}

/// @nodoc
abstract mixin class _$BankCopyWith<$Res> implements $BankCopyWith<$Res> {
  factory _$BankCopyWith(_Bank value, $Res Function(_Bank) _then) =
      __$BankCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String nameAr, String nameEn, String logoUrl});
}

/// @nodoc
class __$BankCopyWithImpl<$Res> implements _$BankCopyWith<$Res> {
  __$BankCopyWithImpl(this._self, this._then);

  final _Bank _self;
  final $Res Function(_Bank) _then;

  /// Create a copy of Bank
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? nameAr = null,
    Object? nameEn = null,
    Object? logoUrl = null,
  }) {
    return _then(
      _Bank(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        nameAr: null == nameAr
            ? _self.nameAr
            : nameAr // ignore: cast_nullable_to_non_nullable
                  as String,
        nameEn: null == nameEn
            ? _self.nameEn
            : nameEn // ignore: cast_nullable_to_non_nullable
                  as String,
        logoUrl: null == logoUrl
            ? _self.logoUrl
            : logoUrl // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}
