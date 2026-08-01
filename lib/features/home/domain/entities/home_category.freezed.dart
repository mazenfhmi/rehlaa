// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeCategory {
  String get id;
  String get titleAr;
  String get titleEn;
  String get svgIcon;
  bool get isSelected;

  /// Create a copy of HomeCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeCategoryCopyWith<HomeCategory> get copyWith =>
      _$HomeCategoryCopyWithImpl<HomeCategory>(
        this as HomeCategory,
        _$identity,
      );

  /// Serializes this HomeCategory to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeCategory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.titleAr, titleAr) || other.titleAr == titleAr) &&
            (identical(other.titleEn, titleEn) || other.titleEn == titleEn) &&
            (identical(other.svgIcon, svgIcon) || other.svgIcon == svgIcon) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, titleAr, titleEn, svgIcon, isSelected);

  @override
  String toString() {
    return 'HomeCategory(id: $id, titleAr: $titleAr, titleEn: $titleEn, svgIcon: $svgIcon, isSelected: $isSelected)';
  }
}

/// @nodoc
abstract mixin class $HomeCategoryCopyWith<$Res> {
  factory $HomeCategoryCopyWith(
    HomeCategory value,
    $Res Function(HomeCategory) _then,
  ) = _$HomeCategoryCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String titleAr,
    String titleEn,
    String svgIcon,
    bool isSelected,
  });
}

/// @nodoc
class _$HomeCategoryCopyWithImpl<$Res> implements $HomeCategoryCopyWith<$Res> {
  _$HomeCategoryCopyWithImpl(this._self, this._then);

  final HomeCategory _self;
  final $Res Function(HomeCategory) _then;

  /// Create a copy of HomeCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? titleAr = null,
    Object? titleEn = null,
    Object? svgIcon = null,
    Object? isSelected = null,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        titleAr: null == titleAr
            ? _self.titleAr
            : titleAr // ignore: cast_nullable_to_non_nullable
                  as String,
        titleEn: null == titleEn
            ? _self.titleEn
            : titleEn // ignore: cast_nullable_to_non_nullable
                  as String,
        svgIcon: null == svgIcon
            ? _self.svgIcon
            : svgIcon // ignore: cast_nullable_to_non_nullable
                  as String,
        isSelected: null == isSelected
            ? _self.isSelected
            : isSelected // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [HomeCategory].
extension HomeCategoryPatterns on HomeCategory {
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
    TResult Function(_HomeCategory value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeCategory() when $default != null:
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
    TResult Function(_HomeCategory value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeCategory():
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
    TResult? Function(_HomeCategory value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeCategory() when $default != null:
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
      String titleAr,
      String titleEn,
      String svgIcon,
      bool isSelected,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeCategory() when $default != null:
        return $default(
          _that.id,
          _that.titleAr,
          _that.titleEn,
          _that.svgIcon,
          _that.isSelected,
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
      String titleAr,
      String titleEn,
      String svgIcon,
      bool isSelected,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeCategory():
        return $default(
          _that.id,
          _that.titleAr,
          _that.titleEn,
          _that.svgIcon,
          _that.isSelected,
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
      String titleAr,
      String titleEn,
      String svgIcon,
      bool isSelected,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeCategory() when $default != null:
        return $default(
          _that.id,
          _that.titleAr,
          _that.titleEn,
          _that.svgIcon,
          _that.isSelected,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _HomeCategory implements HomeCategory {
  const _HomeCategory({
    required this.id,
    required this.titleAr,
    required this.titleEn,
    required this.svgIcon,
    this.isSelected = false,
  });
  factory _HomeCategory.fromJson(Map<String, dynamic> json) =>
      _$HomeCategoryFromJson(json);

  @override
  final String id;
  @override
  final String titleAr;
  @override
  final String titleEn;
  @override
  final String svgIcon;
  @override
  @JsonKey()
  final bool isSelected;

  /// Create a copy of HomeCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeCategoryCopyWith<_HomeCategory> get copyWith =>
      __$HomeCategoryCopyWithImpl<_HomeCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HomeCategoryToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeCategory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.titleAr, titleAr) || other.titleAr == titleAr) &&
            (identical(other.titleEn, titleEn) || other.titleEn == titleEn) &&
            (identical(other.svgIcon, svgIcon) || other.svgIcon == svgIcon) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, titleAr, titleEn, svgIcon, isSelected);

  @override
  String toString() {
    return 'HomeCategory(id: $id, titleAr: $titleAr, titleEn: $titleEn, svgIcon: $svgIcon, isSelected: $isSelected)';
  }
}

/// @nodoc
abstract mixin class _$HomeCategoryCopyWith<$Res>
    implements $HomeCategoryCopyWith<$Res> {
  factory _$HomeCategoryCopyWith(
    _HomeCategory value,
    $Res Function(_HomeCategory) _then,
  ) = __$HomeCategoryCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String titleAr,
    String titleEn,
    String svgIcon,
    bool isSelected,
  });
}

/// @nodoc
class __$HomeCategoryCopyWithImpl<$Res>
    implements _$HomeCategoryCopyWith<$Res> {
  __$HomeCategoryCopyWithImpl(this._self, this._then);

  final _HomeCategory _self;
  final $Res Function(_HomeCategory) _then;

  /// Create a copy of HomeCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? titleAr = null,
    Object? titleEn = null,
    Object? svgIcon = null,
    Object? isSelected = null,
  }) {
    return _then(
      _HomeCategory(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        titleAr: null == titleAr
            ? _self.titleAr
            : titleAr // ignore: cast_nullable_to_non_nullable
                  as String,
        titleEn: null == titleEn
            ? _self.titleEn
            : titleEn // ignore: cast_nullable_to_non_nullable
                  as String,
        svgIcon: null == svgIcon
            ? _self.svgIcon
            : svgIcon // ignore: cast_nullable_to_non_nullable
                  as String,
        isSelected: null == isSelected
            ? _self.isSelected
            : isSelected // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}
