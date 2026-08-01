// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckoutItem {
  String get id;
  String get productId;
  String get name;
  int get quantity;
  Money get unitPrice;
  Money get totalPrice;
  Map<String, String> get selectedOptions;
  String? get imageUrl;

  /// Create a copy of CheckoutItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CheckoutItemCopyWith<CheckoutItem> get copyWith =>
      _$CheckoutItemCopyWithImpl<CheckoutItem>(
        this as CheckoutItem,
        _$identity,
      );

  /// Serializes this CheckoutItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CheckoutItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            const DeepCollectionEquality().equals(
              other.selectedOptions,
              selectedOptions,
            ) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    productId,
    name,
    quantity,
    unitPrice,
    totalPrice,
    const DeepCollectionEquality().hash(selectedOptions),
    imageUrl,
  );

  @override
  String toString() {
    return 'CheckoutItem(id: $id, productId: $productId, name: $name, quantity: $quantity, unitPrice: $unitPrice, totalPrice: $totalPrice, selectedOptions: $selectedOptions, imageUrl: $imageUrl)';
  }
}

/// @nodoc
abstract mixin class $CheckoutItemCopyWith<$Res> {
  factory $CheckoutItemCopyWith(
    CheckoutItem value,
    $Res Function(CheckoutItem) _then,
  ) = _$CheckoutItemCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String productId,
    String name,
    int quantity,
    Money unitPrice,
    Money totalPrice,
    Map<String, String> selectedOptions,
    String? imageUrl,
  });
}

/// @nodoc
class _$CheckoutItemCopyWithImpl<$Res> implements $CheckoutItemCopyWith<$Res> {
  _$CheckoutItemCopyWithImpl(this._self, this._then);

  final CheckoutItem _self;
  final $Res Function(CheckoutItem) _then;

  /// Create a copy of CheckoutItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? name = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? totalPrice = null,
    Object? selectedOptions = null,
    Object? imageUrl = freezed,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        productId: null == productId
            ? _self.productId
            : productId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        quantity: null == quantity
            ? _self.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as int,
        unitPrice: null == unitPrice
            ? _self.unitPrice
            : unitPrice // ignore: cast_nullable_to_non_nullable
                  as Money,
        totalPrice: null == totalPrice
            ? _self.totalPrice
            : totalPrice // ignore: cast_nullable_to_non_nullable
                  as Money,
        selectedOptions: null == selectedOptions
            ? _self.selectedOptions
            : selectedOptions // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
        imageUrl: freezed == imageUrl
            ? _self.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [CheckoutItem].
extension CheckoutItemPatterns on CheckoutItem {
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
    TResult Function(_CheckoutItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CheckoutItem() when $default != null:
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
    TResult Function(_CheckoutItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckoutItem():
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
    TResult? Function(_CheckoutItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckoutItem() when $default != null:
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
      String productId,
      String name,
      int quantity,
      Money unitPrice,
      Money totalPrice,
      Map<String, String> selectedOptions,
      String? imageUrl,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CheckoutItem() when $default != null:
        return $default(
          _that.id,
          _that.productId,
          _that.name,
          _that.quantity,
          _that.unitPrice,
          _that.totalPrice,
          _that.selectedOptions,
          _that.imageUrl,
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
      String productId,
      String name,
      int quantity,
      Money unitPrice,
      Money totalPrice,
      Map<String, String> selectedOptions,
      String? imageUrl,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckoutItem():
        return $default(
          _that.id,
          _that.productId,
          _that.name,
          _that.quantity,
          _that.unitPrice,
          _that.totalPrice,
          _that.selectedOptions,
          _that.imageUrl,
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
      String productId,
      String name,
      int quantity,
      Money unitPrice,
      Money totalPrice,
      Map<String, String> selectedOptions,
      String? imageUrl,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckoutItem() when $default != null:
        return $default(
          _that.id,
          _that.productId,
          _that.name,
          _that.quantity,
          _that.unitPrice,
          _that.totalPrice,
          _that.selectedOptions,
          _that.imageUrl,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CheckoutItem implements CheckoutItem {
  const _CheckoutItem({
    required this.id,
    required this.productId,
    required this.name,
    required this.quantity,
    required this.unitPrice,
    required this.totalPrice,
    required final Map<String, String> selectedOptions,
    this.imageUrl,
  }) : _selectedOptions = selectedOptions;
  factory _CheckoutItem.fromJson(Map<String, dynamic> json) =>
      _$CheckoutItemFromJson(json);

  @override
  final String id;
  @override
  final String productId;
  @override
  final String name;
  @override
  final int quantity;
  @override
  final Money unitPrice;
  @override
  final Money totalPrice;
  final Map<String, String> _selectedOptions;
  @override
  Map<String, String> get selectedOptions {
    if (_selectedOptions is EqualUnmodifiableMapView) return _selectedOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_selectedOptions);
  }

  @override
  final String? imageUrl;

  /// Create a copy of CheckoutItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CheckoutItemCopyWith<_CheckoutItem> get copyWith =>
      __$CheckoutItemCopyWithImpl<_CheckoutItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CheckoutItemToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CheckoutItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            const DeepCollectionEquality().equals(
              other._selectedOptions,
              _selectedOptions,
            ) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    productId,
    name,
    quantity,
    unitPrice,
    totalPrice,
    const DeepCollectionEquality().hash(_selectedOptions),
    imageUrl,
  );

  @override
  String toString() {
    return 'CheckoutItem(id: $id, productId: $productId, name: $name, quantity: $quantity, unitPrice: $unitPrice, totalPrice: $totalPrice, selectedOptions: $selectedOptions, imageUrl: $imageUrl)';
  }
}

/// @nodoc
abstract mixin class _$CheckoutItemCopyWith<$Res>
    implements $CheckoutItemCopyWith<$Res> {
  factory _$CheckoutItemCopyWith(
    _CheckoutItem value,
    $Res Function(_CheckoutItem) _then,
  ) = __$CheckoutItemCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String productId,
    String name,
    int quantity,
    Money unitPrice,
    Money totalPrice,
    Map<String, String> selectedOptions,
    String? imageUrl,
  });
}

/// @nodoc
class __$CheckoutItemCopyWithImpl<$Res>
    implements _$CheckoutItemCopyWith<$Res> {
  __$CheckoutItemCopyWithImpl(this._self, this._then);

  final _CheckoutItem _self;
  final $Res Function(_CheckoutItem) _then;

  /// Create a copy of CheckoutItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? name = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? totalPrice = null,
    Object? selectedOptions = null,
    Object? imageUrl = freezed,
  }) {
    return _then(
      _CheckoutItem(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        productId: null == productId
            ? _self.productId
            : productId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        quantity: null == quantity
            ? _self.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as int,
        unitPrice: null == unitPrice
            ? _self.unitPrice
            : unitPrice // ignore: cast_nullable_to_non_nullable
                  as Money,
        totalPrice: null == totalPrice
            ? _self.totalPrice
            : totalPrice // ignore: cast_nullable_to_non_nullable
                  as Money,
        selectedOptions: null == selectedOptions
            ? _self._selectedOptions
            : selectedOptions // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
        imageUrl: freezed == imageUrl
            ? _self.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}
