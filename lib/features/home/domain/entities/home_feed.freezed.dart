// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_feed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PromoBanner {
  String get id;
  String get imageUrl;
  String get linkTarget;

  /// Create a copy of PromoBanner
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PromoBannerCopyWith<PromoBanner> get copyWith =>
      _$PromoBannerCopyWithImpl<PromoBanner>(this as PromoBanner, _$identity);

  /// Serializes this PromoBanner to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PromoBanner &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.linkTarget, linkTarget) ||
                other.linkTarget == linkTarget));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, imageUrl, linkTarget);

  @override
  String toString() {
    return 'PromoBanner(id: $id, imageUrl: $imageUrl, linkTarget: $linkTarget)';
  }
}

/// @nodoc
abstract mixin class $PromoBannerCopyWith<$Res> {
  factory $PromoBannerCopyWith(
    PromoBanner value,
    $Res Function(PromoBanner) _then,
  ) = _$PromoBannerCopyWithImpl;
  @useResult
  $Res call({String id, String imageUrl, String linkTarget});
}

/// @nodoc
class _$PromoBannerCopyWithImpl<$Res> implements $PromoBannerCopyWith<$Res> {
  _$PromoBannerCopyWithImpl(this._self, this._then);

  final PromoBanner _self;
  final $Res Function(PromoBanner) _then;

  /// Create a copy of PromoBanner
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
    Object? linkTarget = null,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        imageUrl: null == imageUrl
            ? _self.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        linkTarget: null == linkTarget
            ? _self.linkTarget
            : linkTarget // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [PromoBanner].
extension PromoBannerPatterns on PromoBanner {
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
    TResult Function(_PromoBanner value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PromoBanner() when $default != null:
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
    TResult Function(_PromoBanner value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromoBanner():
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
    TResult? Function(_PromoBanner value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromoBanner() when $default != null:
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
    TResult Function(String id, String imageUrl, String linkTarget)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PromoBanner() when $default != null:
        return $default(_that.id, _that.imageUrl, _that.linkTarget);
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
    TResult Function(String id, String imageUrl, String linkTarget) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromoBanner():
        return $default(_that.id, _that.imageUrl, _that.linkTarget);
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
    TResult? Function(String id, String imageUrl, String linkTarget)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromoBanner() when $default != null:
        return $default(_that.id, _that.imageUrl, _that.linkTarget);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PromoBanner implements PromoBanner {
  const _PromoBanner({
    required this.id,
    required this.imageUrl,
    required this.linkTarget,
  });
  factory _PromoBanner.fromJson(Map<String, dynamic> json) =>
      _$PromoBannerFromJson(json);

  @override
  final String id;
  @override
  final String imageUrl;
  @override
  final String linkTarget;

  /// Create a copy of PromoBanner
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PromoBannerCopyWith<_PromoBanner> get copyWith =>
      __$PromoBannerCopyWithImpl<_PromoBanner>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PromoBannerToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PromoBanner &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.linkTarget, linkTarget) ||
                other.linkTarget == linkTarget));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, imageUrl, linkTarget);

  @override
  String toString() {
    return 'PromoBanner(id: $id, imageUrl: $imageUrl, linkTarget: $linkTarget)';
  }
}

/// @nodoc
abstract mixin class _$PromoBannerCopyWith<$Res>
    implements $PromoBannerCopyWith<$Res> {
  factory _$PromoBannerCopyWith(
    _PromoBanner value,
    $Res Function(_PromoBanner) _then,
  ) = __$PromoBannerCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String imageUrl, String linkTarget});
}

/// @nodoc
class __$PromoBannerCopyWithImpl<$Res> implements _$PromoBannerCopyWith<$Res> {
  __$PromoBannerCopyWithImpl(this._self, this._then);

  final _PromoBanner _self;
  final $Res Function(_PromoBanner) _then;

  /// Create a copy of PromoBanner
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
    Object? linkTarget = null,
  }) {
    return _then(
      _PromoBanner(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        imageUrl: null == imageUrl
            ? _self.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        linkTarget: null == linkTarget
            ? _self.linkTarget
            : linkTarget // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
mixin _$HomeFeed {
  List<PromoBanner> get banners;
  List<Category> get categories;
  List<Product> get featuredProducts;
  List<Product> get exclusiveOffers;
  bool get isStale;

  /// Create a copy of HomeFeed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeFeedCopyWith<HomeFeed> get copyWith =>
      _$HomeFeedCopyWithImpl<HomeFeed>(this as HomeFeed, _$identity);

  /// Serializes this HomeFeed to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeFeed &&
            const DeepCollectionEquality().equals(other.banners, banners) &&
            const DeepCollectionEquality().equals(
              other.categories,
              categories,
            ) &&
            const DeepCollectionEquality().equals(
              other.featuredProducts,
              featuredProducts,
            ) &&
            const DeepCollectionEquality().equals(
              other.exclusiveOffers,
              exclusiveOffers,
            ) &&
            (identical(other.isStale, isStale) || other.isStale == isStale));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(banners),
    const DeepCollectionEquality().hash(categories),
    const DeepCollectionEquality().hash(featuredProducts),
    const DeepCollectionEquality().hash(exclusiveOffers),
    isStale,
  );

  @override
  String toString() {
    return 'HomeFeed(banners: $banners, categories: $categories, featuredProducts: $featuredProducts, exclusiveOffers: $exclusiveOffers, isStale: $isStale)';
  }
}

/// @nodoc
abstract mixin class $HomeFeedCopyWith<$Res> {
  factory $HomeFeedCopyWith(HomeFeed value, $Res Function(HomeFeed) _then) =
      _$HomeFeedCopyWithImpl;
  @useResult
  $Res call({
    List<PromoBanner> banners,
    List<Category> categories,
    List<Product> featuredProducts,
    List<Product> exclusiveOffers,
    bool isStale,
  });
}

/// @nodoc
class _$HomeFeedCopyWithImpl<$Res> implements $HomeFeedCopyWith<$Res> {
  _$HomeFeedCopyWithImpl(this._self, this._then);

  final HomeFeed _self;
  final $Res Function(HomeFeed) _then;

  /// Create a copy of HomeFeed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? banners = null,
    Object? categories = null,
    Object? featuredProducts = null,
    Object? exclusiveOffers = null,
    Object? isStale = null,
  }) {
    return _then(
      _self.copyWith(
        banners: null == banners
            ? _self.banners
            : banners // ignore: cast_nullable_to_non_nullable
                  as List<PromoBanner>,
        categories: null == categories
            ? _self.categories
            : categories // ignore: cast_nullable_to_non_nullable
                  as List<Category>,
        featuredProducts: null == featuredProducts
            ? _self.featuredProducts
            : featuredProducts // ignore: cast_nullable_to_non_nullable
                  as List<Product>,
        exclusiveOffers: null == exclusiveOffers
            ? _self.exclusiveOffers
            : exclusiveOffers // ignore: cast_nullable_to_non_nullable
                  as List<Product>,
        isStale: null == isStale
            ? _self.isStale
            : isStale // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [HomeFeed].
extension HomeFeedPatterns on HomeFeed {
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
    TResult Function(_HomeFeed value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeFeed() when $default != null:
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
    TResult Function(_HomeFeed value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeFeed():
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
    TResult? Function(_HomeFeed value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeFeed() when $default != null:
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
      List<PromoBanner> banners,
      List<Category> categories,
      List<Product> featuredProducts,
      List<Product> exclusiveOffers,
      bool isStale,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeFeed() when $default != null:
        return $default(
          _that.banners,
          _that.categories,
          _that.featuredProducts,
          _that.exclusiveOffers,
          _that.isStale,
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
      List<PromoBanner> banners,
      List<Category> categories,
      List<Product> featuredProducts,
      List<Product> exclusiveOffers,
      bool isStale,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeFeed():
        return $default(
          _that.banners,
          _that.categories,
          _that.featuredProducts,
          _that.exclusiveOffers,
          _that.isStale,
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
      List<PromoBanner> banners,
      List<Category> categories,
      List<Product> featuredProducts,
      List<Product> exclusiveOffers,
      bool isStale,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeFeed() when $default != null:
        return $default(
          _that.banners,
          _that.categories,
          _that.featuredProducts,
          _that.exclusiveOffers,
          _that.isStale,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _HomeFeed implements HomeFeed {
  const _HomeFeed({
    required final List<PromoBanner> banners,
    required final List<Category> categories,
    required final List<Product> featuredProducts,
    required final List<Product> exclusiveOffers,
    this.isStale = false,
  }) : _banners = banners,
       _categories = categories,
       _featuredProducts = featuredProducts,
       _exclusiveOffers = exclusiveOffers;
  factory _HomeFeed.fromJson(Map<String, dynamic> json) =>
      _$HomeFeedFromJson(json);

  final List<PromoBanner> _banners;
  @override
  List<PromoBanner> get banners {
    if (_banners is EqualUnmodifiableListView) return _banners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_banners);
  }

  final List<Category> _categories;
  @override
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<Product> _featuredProducts;
  @override
  List<Product> get featuredProducts {
    if (_featuredProducts is EqualUnmodifiableListView)
      return _featuredProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_featuredProducts);
  }

  final List<Product> _exclusiveOffers;
  @override
  List<Product> get exclusiveOffers {
    if (_exclusiveOffers is EqualUnmodifiableListView) return _exclusiveOffers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exclusiveOffers);
  }

  @override
  @JsonKey()
  final bool isStale;

  /// Create a copy of HomeFeed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeFeedCopyWith<_HomeFeed> get copyWith =>
      __$HomeFeedCopyWithImpl<_HomeFeed>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HomeFeedToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeFeed &&
            const DeepCollectionEquality().equals(other._banners, _banners) &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ) &&
            const DeepCollectionEquality().equals(
              other._featuredProducts,
              _featuredProducts,
            ) &&
            const DeepCollectionEquality().equals(
              other._exclusiveOffers,
              _exclusiveOffers,
            ) &&
            (identical(other.isStale, isStale) || other.isStale == isStale));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_banners),
    const DeepCollectionEquality().hash(_categories),
    const DeepCollectionEquality().hash(_featuredProducts),
    const DeepCollectionEquality().hash(_exclusiveOffers),
    isStale,
  );

  @override
  String toString() {
    return 'HomeFeed(banners: $banners, categories: $categories, featuredProducts: $featuredProducts, exclusiveOffers: $exclusiveOffers, isStale: $isStale)';
  }
}

/// @nodoc
abstract mixin class _$HomeFeedCopyWith<$Res>
    implements $HomeFeedCopyWith<$Res> {
  factory _$HomeFeedCopyWith(_HomeFeed value, $Res Function(_HomeFeed) _then) =
      __$HomeFeedCopyWithImpl;
  @override
  @useResult
  $Res call({
    List<PromoBanner> banners,
    List<Category> categories,
    List<Product> featuredProducts,
    List<Product> exclusiveOffers,
    bool isStale,
  });
}

/// @nodoc
class __$HomeFeedCopyWithImpl<$Res> implements _$HomeFeedCopyWith<$Res> {
  __$HomeFeedCopyWithImpl(this._self, this._then);

  final _HomeFeed _self;
  final $Res Function(_HomeFeed) _then;

  /// Create a copy of HomeFeed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? banners = null,
    Object? categories = null,
    Object? featuredProducts = null,
    Object? exclusiveOffers = null,
    Object? isStale = null,
  }) {
    return _then(
      _HomeFeed(
        banners: null == banners
            ? _self._banners
            : banners // ignore: cast_nullable_to_non_nullable
                  as List<PromoBanner>,
        categories: null == categories
            ? _self._categories
            : categories // ignore: cast_nullable_to_non_nullable
                  as List<Category>,
        featuredProducts: null == featuredProducts
            ? _self._featuredProducts
            : featuredProducts // ignore: cast_nullable_to_non_nullable
                  as List<Product>,
        exclusiveOffers: null == exclusiveOffers
            ? _self._exclusiveOffers
            : exclusiveOffers // ignore: cast_nullable_to_non_nullable
                  as List<Product>,
        isStale: null == isStale
            ? _self.isStale
            : isStale // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}
