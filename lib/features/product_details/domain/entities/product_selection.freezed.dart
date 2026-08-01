// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_selection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductSelection {
  Set<String> get optionValueIds;
  String get optionSignature;
  Money get resolvedPrice;
  bool get isComplete;
  int get selectedRequiredCount;

  /// Create a copy of ProductSelection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductSelectionCopyWith<ProductSelection> get copyWith =>
      _$ProductSelectionCopyWithImpl<ProductSelection>(
        this as ProductSelection,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductSelection &&
            const DeepCollectionEquality().equals(
              other.optionValueIds,
              optionValueIds,
            ) &&
            (identical(other.optionSignature, optionSignature) ||
                other.optionSignature == optionSignature) &&
            (identical(other.resolvedPrice, resolvedPrice) ||
                other.resolvedPrice == resolvedPrice) &&
            (identical(other.isComplete, isComplete) ||
                other.isComplete == isComplete) &&
            (identical(other.selectedRequiredCount, selectedRequiredCount) ||
                other.selectedRequiredCount == selectedRequiredCount));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(optionValueIds),
    optionSignature,
    resolvedPrice,
    isComplete,
    selectedRequiredCount,
  );

  @override
  String toString() {
    return 'ProductSelection(optionValueIds: $optionValueIds, optionSignature: $optionSignature, resolvedPrice: $resolvedPrice, isComplete: $isComplete, selectedRequiredCount: $selectedRequiredCount)';
  }
}

/// @nodoc
abstract mixin class $ProductSelectionCopyWith<$Res> {
  factory $ProductSelectionCopyWith(
    ProductSelection value,
    $Res Function(ProductSelection) _then,
  ) = _$ProductSelectionCopyWithImpl;
  @useResult
  $Res call({
    Set<String> optionValueIds,
    String optionSignature,
    Money resolvedPrice,
    bool isComplete,
    int selectedRequiredCount,
  });
}

/// @nodoc
class _$ProductSelectionCopyWithImpl<$Res>
    implements $ProductSelectionCopyWith<$Res> {
  _$ProductSelectionCopyWithImpl(this._self, this._then);

  final ProductSelection _self;
  final $Res Function(ProductSelection) _then;

  /// Create a copy of ProductSelection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? optionValueIds = null,
    Object? optionSignature = null,
    Object? resolvedPrice = null,
    Object? isComplete = null,
    Object? selectedRequiredCount = null,
  }) {
    return _then(
      _self.copyWith(
        optionValueIds: null == optionValueIds
            ? _self.optionValueIds
            : optionValueIds // ignore: cast_nullable_to_non_nullable
                  as Set<String>,
        optionSignature: null == optionSignature
            ? _self.optionSignature
            : optionSignature // ignore: cast_nullable_to_non_nullable
                  as String,
        resolvedPrice: null == resolvedPrice
            ? _self.resolvedPrice
            : resolvedPrice // ignore: cast_nullable_to_non_nullable
                  as Money,
        isComplete: null == isComplete
            ? _self.isComplete
            : isComplete // ignore: cast_nullable_to_non_nullable
                  as bool,
        selectedRequiredCount: null == selectedRequiredCount
            ? _self.selectedRequiredCount
            : selectedRequiredCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [ProductSelection].
extension ProductSelectionPatterns on ProductSelection {
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
    TResult Function(_ProductSelection value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductSelection() when $default != null:
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
    TResult Function(_ProductSelection value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductSelection():
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
    TResult? Function(_ProductSelection value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductSelection() when $default != null:
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
      Set<String> optionValueIds,
      String optionSignature,
      Money resolvedPrice,
      bool isComplete,
      int selectedRequiredCount,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductSelection() when $default != null:
        return $default(
          _that.optionValueIds,
          _that.optionSignature,
          _that.resolvedPrice,
          _that.isComplete,
          _that.selectedRequiredCount,
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
      Set<String> optionValueIds,
      String optionSignature,
      Money resolvedPrice,
      bool isComplete,
      int selectedRequiredCount,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductSelection():
        return $default(
          _that.optionValueIds,
          _that.optionSignature,
          _that.resolvedPrice,
          _that.isComplete,
          _that.selectedRequiredCount,
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
      Set<String> optionValueIds,
      String optionSignature,
      Money resolvedPrice,
      bool isComplete,
      int selectedRequiredCount,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductSelection() when $default != null:
        return $default(
          _that.optionValueIds,
          _that.optionSignature,
          _that.resolvedPrice,
          _that.isComplete,
          _that.selectedRequiredCount,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ProductSelection implements ProductSelection {
  const _ProductSelection({
    required final Set<String> optionValueIds,
    required this.optionSignature,
    required this.resolvedPrice,
    required this.isComplete,
    required this.selectedRequiredCount,
  }) : _optionValueIds = optionValueIds;

  final Set<String> _optionValueIds;
  @override
  Set<String> get optionValueIds {
    if (_optionValueIds is EqualUnmodifiableSetView) return _optionValueIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_optionValueIds);
  }

  @override
  final String optionSignature;
  @override
  final Money resolvedPrice;
  @override
  final bool isComplete;
  @override
  final int selectedRequiredCount;

  /// Create a copy of ProductSelection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductSelectionCopyWith<_ProductSelection> get copyWith =>
      __$ProductSelectionCopyWithImpl<_ProductSelection>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductSelection &&
            const DeepCollectionEquality().equals(
              other._optionValueIds,
              _optionValueIds,
            ) &&
            (identical(other.optionSignature, optionSignature) ||
                other.optionSignature == optionSignature) &&
            (identical(other.resolvedPrice, resolvedPrice) ||
                other.resolvedPrice == resolvedPrice) &&
            (identical(other.isComplete, isComplete) ||
                other.isComplete == isComplete) &&
            (identical(other.selectedRequiredCount, selectedRequiredCount) ||
                other.selectedRequiredCount == selectedRequiredCount));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_optionValueIds),
    optionSignature,
    resolvedPrice,
    isComplete,
    selectedRequiredCount,
  );

  @override
  String toString() {
    return 'ProductSelection(optionValueIds: $optionValueIds, optionSignature: $optionSignature, resolvedPrice: $resolvedPrice, isComplete: $isComplete, selectedRequiredCount: $selectedRequiredCount)';
  }
}

/// @nodoc
abstract mixin class _$ProductSelectionCopyWith<$Res>
    implements $ProductSelectionCopyWith<$Res> {
  factory _$ProductSelectionCopyWith(
    _ProductSelection value,
    $Res Function(_ProductSelection) _then,
  ) = __$ProductSelectionCopyWithImpl;
  @override
  @useResult
  $Res call({
    Set<String> optionValueIds,
    String optionSignature,
    Money resolvedPrice,
    bool isComplete,
    int selectedRequiredCount,
  });
}

/// @nodoc
class __$ProductSelectionCopyWithImpl<$Res>
    implements _$ProductSelectionCopyWith<$Res> {
  __$ProductSelectionCopyWithImpl(this._self, this._then);

  final _ProductSelection _self;
  final $Res Function(_ProductSelection) _then;

  /// Create a copy of ProductSelection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? optionValueIds = null,
    Object? optionSignature = null,
    Object? resolvedPrice = null,
    Object? isComplete = null,
    Object? selectedRequiredCount = null,
  }) {
    return _then(
      _ProductSelection(
        optionValueIds: null == optionValueIds
            ? _self._optionValueIds
            : optionValueIds // ignore: cast_nullable_to_non_nullable
                  as Set<String>,
        optionSignature: null == optionSignature
            ? _self.optionSignature
            : optionSignature // ignore: cast_nullable_to_non_nullable
                  as String,
        resolvedPrice: null == resolvedPrice
            ? _self.resolvedPrice
            : resolvedPrice // ignore: cast_nullable_to_non_nullable
                  as Money,
        isComplete: null == isComplete
            ? _self.isComplete
            : isComplete // ignore: cast_nullable_to_non_nullable
                  as bool,
        selectedRequiredCount: null == selectedRequiredCount
            ? _self.selectedRequiredCount
            : selectedRequiredCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}
