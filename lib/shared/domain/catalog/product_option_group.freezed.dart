// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_option_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductOptionValue {
  String get id;
  String get nameAr;
  String get nameEn;
  Money get priceDelta;

  /// Create a copy of ProductOptionValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductOptionValueCopyWith<ProductOptionValue> get copyWith =>
      _$ProductOptionValueCopyWithImpl<ProductOptionValue>(
        this as ProductOptionValue,
        _$identity,
      );

  /// Serializes this ProductOptionValue to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductOptionValue &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nameAr, nameAr) || other.nameAr == nameAr) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.priceDelta, priceDelta) ||
                other.priceDelta == priceDelta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nameAr, nameEn, priceDelta);

  @override
  String toString() {
    return 'ProductOptionValue(id: $id, nameAr: $nameAr, nameEn: $nameEn, priceDelta: $priceDelta)';
  }
}

/// @nodoc
abstract mixin class $ProductOptionValueCopyWith<$Res> {
  factory $ProductOptionValueCopyWith(
    ProductOptionValue value,
    $Res Function(ProductOptionValue) _then,
  ) = _$ProductOptionValueCopyWithImpl;
  @useResult
  $Res call({String id, String nameAr, String nameEn, Money priceDelta});
}

/// @nodoc
class _$ProductOptionValueCopyWithImpl<$Res>
    implements $ProductOptionValueCopyWith<$Res> {
  _$ProductOptionValueCopyWithImpl(this._self, this._then);

  final ProductOptionValue _self;
  final $Res Function(ProductOptionValue) _then;

  /// Create a copy of ProductOptionValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameAr = null,
    Object? nameEn = null,
    Object? priceDelta = null,
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
        priceDelta: null == priceDelta
            ? _self.priceDelta
            : priceDelta // ignore: cast_nullable_to_non_nullable
                  as Money,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [ProductOptionValue].
extension ProductOptionValuePatterns on ProductOptionValue {
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
    TResult Function(_ProductOptionValue value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductOptionValue() when $default != null:
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
    TResult Function(_ProductOptionValue value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductOptionValue():
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
    TResult? Function(_ProductOptionValue value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductOptionValue() when $default != null:
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
    TResult Function(String id, String nameAr, String nameEn, Money priceDelta)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductOptionValue() when $default != null:
        return $default(_that.id, _that.nameAr, _that.nameEn, _that.priceDelta);
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
    TResult Function(String id, String nameAr, String nameEn, Money priceDelta)
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductOptionValue():
        return $default(_that.id, _that.nameAr, _that.nameEn, _that.priceDelta);
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
      String nameAr,
      String nameEn,
      Money priceDelta,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductOptionValue() when $default != null:
        return $default(_that.id, _that.nameAr, _that.nameEn, _that.priceDelta);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProductOptionValue implements ProductOptionValue {
  const _ProductOptionValue({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.priceDelta,
  });
  factory _ProductOptionValue.fromJson(Map<String, dynamic> json) =>
      _$ProductOptionValueFromJson(json);

  @override
  final String id;
  @override
  final String nameAr;
  @override
  final String nameEn;
  @override
  final Money priceDelta;

  /// Create a copy of ProductOptionValue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductOptionValueCopyWith<_ProductOptionValue> get copyWith =>
      __$ProductOptionValueCopyWithImpl<_ProductOptionValue>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProductOptionValueToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductOptionValue &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nameAr, nameAr) || other.nameAr == nameAr) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.priceDelta, priceDelta) ||
                other.priceDelta == priceDelta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nameAr, nameEn, priceDelta);

  @override
  String toString() {
    return 'ProductOptionValue(id: $id, nameAr: $nameAr, nameEn: $nameEn, priceDelta: $priceDelta)';
  }
}

/// @nodoc
abstract mixin class _$ProductOptionValueCopyWith<$Res>
    implements $ProductOptionValueCopyWith<$Res> {
  factory _$ProductOptionValueCopyWith(
    _ProductOptionValue value,
    $Res Function(_ProductOptionValue) _then,
  ) = __$ProductOptionValueCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String nameAr, String nameEn, Money priceDelta});
}

/// @nodoc
class __$ProductOptionValueCopyWithImpl<$Res>
    implements _$ProductOptionValueCopyWith<$Res> {
  __$ProductOptionValueCopyWithImpl(this._self, this._then);

  final _ProductOptionValue _self;
  final $Res Function(_ProductOptionValue) _then;

  /// Create a copy of ProductOptionValue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? nameAr = null,
    Object? nameEn = null,
    Object? priceDelta = null,
  }) {
    return _then(
      _ProductOptionValue(
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
        priceDelta: null == priceDelta
            ? _self.priceDelta
            : priceDelta // ignore: cast_nullable_to_non_nullable
                  as Money,
      ),
    );
  }
}

/// @nodoc
mixin _$ProductOptionGroup {
  String get id;
  String get nameAr;
  String get nameEn;
  bool get isRequired;
  List<ProductOptionValue> get values;

  /// Create a copy of ProductOptionGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductOptionGroupCopyWith<ProductOptionGroup> get copyWith =>
      _$ProductOptionGroupCopyWithImpl<ProductOptionGroup>(
        this as ProductOptionGroup,
        _$identity,
      );

  /// Serializes this ProductOptionGroup to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductOptionGroup &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nameAr, nameAr) || other.nameAr == nameAr) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired) &&
            const DeepCollectionEquality().equals(other.values, values));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    nameAr,
    nameEn,
    isRequired,
    const DeepCollectionEquality().hash(values),
  );

  @override
  String toString() {
    return 'ProductOptionGroup(id: $id, nameAr: $nameAr, nameEn: $nameEn, isRequired: $isRequired, values: $values)';
  }
}

/// @nodoc
abstract mixin class $ProductOptionGroupCopyWith<$Res> {
  factory $ProductOptionGroupCopyWith(
    ProductOptionGroup value,
    $Res Function(ProductOptionGroup) _then,
  ) = _$ProductOptionGroupCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String nameAr,
    String nameEn,
    bool isRequired,
    List<ProductOptionValue> values,
  });
}

/// @nodoc
class _$ProductOptionGroupCopyWithImpl<$Res>
    implements $ProductOptionGroupCopyWith<$Res> {
  _$ProductOptionGroupCopyWithImpl(this._self, this._then);

  final ProductOptionGroup _self;
  final $Res Function(ProductOptionGroup) _then;

  /// Create a copy of ProductOptionGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameAr = null,
    Object? nameEn = null,
    Object? isRequired = null,
    Object? values = null,
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
        isRequired: null == isRequired
            ? _self.isRequired
            : isRequired // ignore: cast_nullable_to_non_nullable
                  as bool,
        values: null == values
            ? _self.values
            : values // ignore: cast_nullable_to_non_nullable
                  as List<ProductOptionValue>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [ProductOptionGroup].
extension ProductOptionGroupPatterns on ProductOptionGroup {
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
    TResult Function(_ProductOptionGroup value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductOptionGroup() when $default != null:
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
    TResult Function(_ProductOptionGroup value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductOptionGroup():
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
    TResult? Function(_ProductOptionGroup value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductOptionGroup() when $default != null:
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
      String nameAr,
      String nameEn,
      bool isRequired,
      List<ProductOptionValue> values,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductOptionGroup() when $default != null:
        return $default(
          _that.id,
          _that.nameAr,
          _that.nameEn,
          _that.isRequired,
          _that.values,
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
      String nameAr,
      String nameEn,
      bool isRequired,
      List<ProductOptionValue> values,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductOptionGroup():
        return $default(
          _that.id,
          _that.nameAr,
          _that.nameEn,
          _that.isRequired,
          _that.values,
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
      String nameAr,
      String nameEn,
      bool isRequired,
      List<ProductOptionValue> values,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductOptionGroup() when $default != null:
        return $default(
          _that.id,
          _that.nameAr,
          _that.nameEn,
          _that.isRequired,
          _that.values,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProductOptionGroup implements ProductOptionGroup {
  const _ProductOptionGroup({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.isRequired,
    required final List<ProductOptionValue> values,
  }) : _values = values;
  factory _ProductOptionGroup.fromJson(Map<String, dynamic> json) =>
      _$ProductOptionGroupFromJson(json);

  @override
  final String id;
  @override
  final String nameAr;
  @override
  final String nameEn;
  @override
  final bool isRequired;
  final List<ProductOptionValue> _values;
  @override
  List<ProductOptionValue> get values {
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_values);
  }

  /// Create a copy of ProductOptionGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductOptionGroupCopyWith<_ProductOptionGroup> get copyWith =>
      __$ProductOptionGroupCopyWithImpl<_ProductOptionGroup>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProductOptionGroupToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductOptionGroup &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nameAr, nameAr) || other.nameAr == nameAr) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired) &&
            const DeepCollectionEquality().equals(other._values, _values));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    nameAr,
    nameEn,
    isRequired,
    const DeepCollectionEquality().hash(_values),
  );

  @override
  String toString() {
    return 'ProductOptionGroup(id: $id, nameAr: $nameAr, nameEn: $nameEn, isRequired: $isRequired, values: $values)';
  }
}

/// @nodoc
abstract mixin class _$ProductOptionGroupCopyWith<$Res>
    implements $ProductOptionGroupCopyWith<$Res> {
  factory _$ProductOptionGroupCopyWith(
    _ProductOptionGroup value,
    $Res Function(_ProductOptionGroup) _then,
  ) = __$ProductOptionGroupCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String nameAr,
    String nameEn,
    bool isRequired,
    List<ProductOptionValue> values,
  });
}

/// @nodoc
class __$ProductOptionGroupCopyWithImpl<$Res>
    implements _$ProductOptionGroupCopyWith<$Res> {
  __$ProductOptionGroupCopyWithImpl(this._self, this._then);

  final _ProductOptionGroup _self;
  final $Res Function(_ProductOptionGroup) _then;

  /// Create a copy of ProductOptionGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? nameAr = null,
    Object? nameEn = null,
    Object? isRequired = null,
    Object? values = null,
  }) {
    return _then(
      _ProductOptionGroup(
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
        isRequired: null == isRequired
            ? _self.isRequired
            : isRequired // ignore: cast_nullable_to_non_nullable
                  as bool,
        values: null == values
            ? _self._values
            : values // ignore: cast_nullable_to_non_nullable
                  as List<ProductOptionValue>,
      ),
    );
  }
}
