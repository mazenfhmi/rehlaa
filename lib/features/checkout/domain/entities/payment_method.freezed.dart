// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_method.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentMethod {
  String get id;
  String get code; // e.g. 'BRAVO', 'CASHIL_PAY', 'BANK_TRANSFER'
  String get nameAr;
  String get nameEn;
  String get logoUrl;
  String get descriptionAr;
  String get descriptionEn;
  bool get isBankTransfer;

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentMethodCopyWith<PaymentMethod> get copyWith =>
      _$PaymentMethodCopyWithImpl<PaymentMethod>(
        this as PaymentMethod,
        _$identity,
      );

  /// Serializes this PaymentMethod to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentMethod &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.nameAr, nameAr) || other.nameAr == nameAr) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.descriptionAr, descriptionAr) ||
                other.descriptionAr == descriptionAr) &&
            (identical(other.descriptionEn, descriptionEn) ||
                other.descriptionEn == descriptionEn) &&
            (identical(other.isBankTransfer, isBankTransfer) ||
                other.isBankTransfer == isBankTransfer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    code,
    nameAr,
    nameEn,
    logoUrl,
    descriptionAr,
    descriptionEn,
    isBankTransfer,
  );

  @override
  String toString() {
    return 'PaymentMethod(id: $id, code: $code, nameAr: $nameAr, nameEn: $nameEn, logoUrl: $logoUrl, descriptionAr: $descriptionAr, descriptionEn: $descriptionEn, isBankTransfer: $isBankTransfer)';
  }
}

/// @nodoc
abstract mixin class $PaymentMethodCopyWith<$Res> {
  factory $PaymentMethodCopyWith(
    PaymentMethod value,
    $Res Function(PaymentMethod) _then,
  ) = _$PaymentMethodCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String code,
    String nameAr,
    String nameEn,
    String logoUrl,
    String descriptionAr,
    String descriptionEn,
    bool isBankTransfer,
  });
}

/// @nodoc
class _$PaymentMethodCopyWithImpl<$Res>
    implements $PaymentMethodCopyWith<$Res> {
  _$PaymentMethodCopyWithImpl(this._self, this._then);

  final PaymentMethod _self;
  final $Res Function(PaymentMethod) _then;

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? nameAr = null,
    Object? nameEn = null,
    Object? logoUrl = null,
    Object? descriptionAr = null,
    Object? descriptionEn = null,
    Object? isBankTransfer = null,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        code: null == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
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
        descriptionAr: null == descriptionAr
            ? _self.descriptionAr
            : descriptionAr // ignore: cast_nullable_to_non_nullable
                  as String,
        descriptionEn: null == descriptionEn
            ? _self.descriptionEn
            : descriptionEn // ignore: cast_nullable_to_non_nullable
                  as String,
        isBankTransfer: null == isBankTransfer
            ? _self.isBankTransfer
            : isBankTransfer // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [PaymentMethod].
extension PaymentMethodPatterns on PaymentMethod {
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
    TResult Function(_PaymentMethod value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaymentMethod() when $default != null:
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
    TResult Function(_PaymentMethod value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentMethod():
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
    TResult? Function(_PaymentMethod value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentMethod() when $default != null:
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
      String code,
      String nameAr,
      String nameEn,
      String logoUrl,
      String descriptionAr,
      String descriptionEn,
      bool isBankTransfer,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaymentMethod() when $default != null:
        return $default(
          _that.id,
          _that.code,
          _that.nameAr,
          _that.nameEn,
          _that.logoUrl,
          _that.descriptionAr,
          _that.descriptionEn,
          _that.isBankTransfer,
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
      String code,
      String nameAr,
      String nameEn,
      String logoUrl,
      String descriptionAr,
      String descriptionEn,
      bool isBankTransfer,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentMethod():
        return $default(
          _that.id,
          _that.code,
          _that.nameAr,
          _that.nameEn,
          _that.logoUrl,
          _that.descriptionAr,
          _that.descriptionEn,
          _that.isBankTransfer,
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
      String code,
      String nameAr,
      String nameEn,
      String logoUrl,
      String descriptionAr,
      String descriptionEn,
      bool isBankTransfer,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentMethod() when $default != null:
        return $default(
          _that.id,
          _that.code,
          _that.nameAr,
          _that.nameEn,
          _that.logoUrl,
          _that.descriptionAr,
          _that.descriptionEn,
          _that.isBankTransfer,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PaymentMethod implements PaymentMethod {
  const _PaymentMethod({
    required this.id,
    required this.code,
    required this.nameAr,
    required this.nameEn,
    required this.logoUrl,
    required this.descriptionAr,
    required this.descriptionEn,
    this.isBankTransfer = false,
  });
  factory _PaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodFromJson(json);

  @override
  final String id;
  @override
  final String code;
  // e.g. 'BRAVO', 'CASHIL_PAY', 'BANK_TRANSFER'
  @override
  final String nameAr;
  @override
  final String nameEn;
  @override
  final String logoUrl;
  @override
  final String descriptionAr;
  @override
  final String descriptionEn;
  @override
  @JsonKey()
  final bool isBankTransfer;

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaymentMethodCopyWith<_PaymentMethod> get copyWith =>
      __$PaymentMethodCopyWithImpl<_PaymentMethod>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PaymentMethodToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaymentMethod &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.nameAr, nameAr) || other.nameAr == nameAr) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.descriptionAr, descriptionAr) ||
                other.descriptionAr == descriptionAr) &&
            (identical(other.descriptionEn, descriptionEn) ||
                other.descriptionEn == descriptionEn) &&
            (identical(other.isBankTransfer, isBankTransfer) ||
                other.isBankTransfer == isBankTransfer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    code,
    nameAr,
    nameEn,
    logoUrl,
    descriptionAr,
    descriptionEn,
    isBankTransfer,
  );

  @override
  String toString() {
    return 'PaymentMethod(id: $id, code: $code, nameAr: $nameAr, nameEn: $nameEn, logoUrl: $logoUrl, descriptionAr: $descriptionAr, descriptionEn: $descriptionEn, isBankTransfer: $isBankTransfer)';
  }
}

/// @nodoc
abstract mixin class _$PaymentMethodCopyWith<$Res>
    implements $PaymentMethodCopyWith<$Res> {
  factory _$PaymentMethodCopyWith(
    _PaymentMethod value,
    $Res Function(_PaymentMethod) _then,
  ) = __$PaymentMethodCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String code,
    String nameAr,
    String nameEn,
    String logoUrl,
    String descriptionAr,
    String descriptionEn,
    bool isBankTransfer,
  });
}

/// @nodoc
class __$PaymentMethodCopyWithImpl<$Res>
    implements _$PaymentMethodCopyWith<$Res> {
  __$PaymentMethodCopyWithImpl(this._self, this._then);

  final _PaymentMethod _self;
  final $Res Function(_PaymentMethod) _then;

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? nameAr = null,
    Object? nameEn = null,
    Object? logoUrl = null,
    Object? descriptionAr = null,
    Object? descriptionEn = null,
    Object? isBankTransfer = null,
  }) {
    return _then(
      _PaymentMethod(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        code: null == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
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
        descriptionAr: null == descriptionAr
            ? _self.descriptionAr
            : descriptionAr // ignore: cast_nullable_to_non_nullable
                  as String,
        descriptionEn: null == descriptionEn
            ? _self.descriptionEn
            : descriptionEn // ignore: cast_nullable_to_non_nullable
                  as String,
        isBankTransfer: null == isBankTransfer
            ? _self.isBankTransfer
            : isBankTransfer // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}
