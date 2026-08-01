// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Product {
  String get id;
  String get categoryId;
  String get nameAr;
  String get nameEn;
  String get descriptionAr;
  String get descriptionEn;
  String get imageUrl;
  List<String> get galleryUrls;
  Money get basePrice;
  Money? get compareAtPrice;
  double get rating;
  int get reviewCount;
  StockStatus get stockStatus;
  bool get isFeatured;
  List<ProductOptionGroup> get optionGroups;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductCopyWith<Product> get copyWith =>
      _$ProductCopyWithImpl<Product>(this as Product, _$identity);

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Product &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.nameAr, nameAr) || other.nameAr == nameAr) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.descriptionAr, descriptionAr) ||
                other.descriptionAr == descriptionAr) &&
            (identical(other.descriptionEn, descriptionEn) ||
                other.descriptionEn == descriptionEn) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(
              other.galleryUrls,
              galleryUrls,
            ) &&
            (identical(other.basePrice, basePrice) ||
                other.basePrice == basePrice) &&
            (identical(other.compareAtPrice, compareAtPrice) ||
                other.compareAtPrice == compareAtPrice) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.stockStatus, stockStatus) ||
                other.stockStatus == stockStatus) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured) &&
            const DeepCollectionEquality().equals(
              other.optionGroups,
              optionGroups,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    categoryId,
    nameAr,
    nameEn,
    descriptionAr,
    descriptionEn,
    imageUrl,
    const DeepCollectionEquality().hash(galleryUrls),
    basePrice,
    compareAtPrice,
    rating,
    reviewCount,
    stockStatus,
    isFeatured,
    const DeepCollectionEquality().hash(optionGroups),
  );

  @override
  String toString() {
    return 'Product(id: $id, categoryId: $categoryId, nameAr: $nameAr, nameEn: $nameEn, descriptionAr: $descriptionAr, descriptionEn: $descriptionEn, imageUrl: $imageUrl, galleryUrls: $galleryUrls, basePrice: $basePrice, compareAtPrice: $compareAtPrice, rating: $rating, reviewCount: $reviewCount, stockStatus: $stockStatus, isFeatured: $isFeatured, optionGroups: $optionGroups)';
  }
}

/// @nodoc
abstract mixin class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) _then) =
      _$ProductCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String categoryId,
    String nameAr,
    String nameEn,
    String descriptionAr,
    String descriptionEn,
    String imageUrl,
    List<String> galleryUrls,
    Money basePrice,
    Money? compareAtPrice,
    double rating,
    int reviewCount,
    StockStatus stockStatus,
    bool isFeatured,
    List<ProductOptionGroup> optionGroups,
  });
}

/// @nodoc
class _$ProductCopyWithImpl<$Res> implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._self, this._then);

  final Product _self;
  final $Res Function(Product) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryId = null,
    Object? nameAr = null,
    Object? nameEn = null,
    Object? descriptionAr = null,
    Object? descriptionEn = null,
    Object? imageUrl = null,
    Object? galleryUrls = null,
    Object? basePrice = null,
    Object? compareAtPrice = freezed,
    Object? rating = null,
    Object? reviewCount = null,
    Object? stockStatus = null,
    Object? isFeatured = null,
    Object? optionGroups = null,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryId: null == categoryId
            ? _self.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String,
        nameAr: null == nameAr
            ? _self.nameAr
            : nameAr // ignore: cast_nullable_to_non_nullable
                  as String,
        nameEn: null == nameEn
            ? _self.nameEn
            : nameEn // ignore: cast_nullable_to_non_nullable
                  as String,
        descriptionAr: null == descriptionAr
            ? _self.descriptionAr
            : descriptionAr // ignore: cast_nullable_to_non_nullable
                  as String,
        descriptionEn: null == descriptionEn
            ? _self.descriptionEn
            : descriptionEn // ignore: cast_nullable_to_non_nullable
                  as String,
        imageUrl: null == imageUrl
            ? _self.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        galleryUrls: null == galleryUrls
            ? _self.galleryUrls
            : galleryUrls // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        basePrice: null == basePrice
            ? _self.basePrice
            : basePrice // ignore: cast_nullable_to_non_nullable
                  as Money,
        compareAtPrice: freezed == compareAtPrice
            ? _self.compareAtPrice
            : compareAtPrice // ignore: cast_nullable_to_non_nullable
                  as Money?,
        rating: null == rating
            ? _self.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as double,
        reviewCount: null == reviewCount
            ? _self.reviewCount
            : reviewCount // ignore: cast_nullable_to_non_nullable
                  as int,
        stockStatus: null == stockStatus
            ? _self.stockStatus
            : stockStatus // ignore: cast_nullable_to_non_nullable
                  as StockStatus,
        isFeatured: null == isFeatured
            ? _self.isFeatured
            : isFeatured // ignore: cast_nullable_to_non_nullable
                  as bool,
        optionGroups: null == optionGroups
            ? _self.optionGroups
            : optionGroups // ignore: cast_nullable_to_non_nullable
                  as List<ProductOptionGroup>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Product].
extension ProductPatterns on Product {
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
    TResult Function(_Product value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Product() when $default != null:
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
    TResult Function(_Product value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Product():
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
    TResult? Function(_Product value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Product() when $default != null:
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
      String categoryId,
      String nameAr,
      String nameEn,
      String descriptionAr,
      String descriptionEn,
      String imageUrl,
      List<String> galleryUrls,
      Money basePrice,
      Money? compareAtPrice,
      double rating,
      int reviewCount,
      StockStatus stockStatus,
      bool isFeatured,
      List<ProductOptionGroup> optionGroups,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Product() when $default != null:
        return $default(
          _that.id,
          _that.categoryId,
          _that.nameAr,
          _that.nameEn,
          _that.descriptionAr,
          _that.descriptionEn,
          _that.imageUrl,
          _that.galleryUrls,
          _that.basePrice,
          _that.compareAtPrice,
          _that.rating,
          _that.reviewCount,
          _that.stockStatus,
          _that.isFeatured,
          _that.optionGroups,
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
      String categoryId,
      String nameAr,
      String nameEn,
      String descriptionAr,
      String descriptionEn,
      String imageUrl,
      List<String> galleryUrls,
      Money basePrice,
      Money? compareAtPrice,
      double rating,
      int reviewCount,
      StockStatus stockStatus,
      bool isFeatured,
      List<ProductOptionGroup> optionGroups,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Product():
        return $default(
          _that.id,
          _that.categoryId,
          _that.nameAr,
          _that.nameEn,
          _that.descriptionAr,
          _that.descriptionEn,
          _that.imageUrl,
          _that.galleryUrls,
          _that.basePrice,
          _that.compareAtPrice,
          _that.rating,
          _that.reviewCount,
          _that.stockStatus,
          _that.isFeatured,
          _that.optionGroups,
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
      String categoryId,
      String nameAr,
      String nameEn,
      String descriptionAr,
      String descriptionEn,
      String imageUrl,
      List<String> galleryUrls,
      Money basePrice,
      Money? compareAtPrice,
      double rating,
      int reviewCount,
      StockStatus stockStatus,
      bool isFeatured,
      List<ProductOptionGroup> optionGroups,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Product() when $default != null:
        return $default(
          _that.id,
          _that.categoryId,
          _that.nameAr,
          _that.nameEn,
          _that.descriptionAr,
          _that.descriptionEn,
          _that.imageUrl,
          _that.galleryUrls,
          _that.basePrice,
          _that.compareAtPrice,
          _that.rating,
          _that.reviewCount,
          _that.stockStatus,
          _that.isFeatured,
          _that.optionGroups,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Product implements Product {
  const _Product({
    required this.id,
    required this.categoryId,
    required this.nameAr,
    required this.nameEn,
    required this.descriptionAr,
    required this.descriptionEn,
    required this.imageUrl,
    required final List<String> galleryUrls,
    required this.basePrice,
    this.compareAtPrice,
    required this.rating,
    required this.reviewCount,
    required this.stockStatus,
    required this.isFeatured,
    required final List<ProductOptionGroup> optionGroups,
  }) : _galleryUrls = galleryUrls,
       _optionGroups = optionGroups;
  factory _Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  @override
  final String id;
  @override
  final String categoryId;
  @override
  final String nameAr;
  @override
  final String nameEn;
  @override
  final String descriptionAr;
  @override
  final String descriptionEn;
  @override
  final String imageUrl;
  final List<String> _galleryUrls;
  @override
  List<String> get galleryUrls {
    if (_galleryUrls is EqualUnmodifiableListView) return _galleryUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_galleryUrls);
  }

  @override
  final Money basePrice;
  @override
  final Money? compareAtPrice;
  @override
  final double rating;
  @override
  final int reviewCount;
  @override
  final StockStatus stockStatus;
  @override
  final bool isFeatured;
  final List<ProductOptionGroup> _optionGroups;
  @override
  List<ProductOptionGroup> get optionGroups {
    if (_optionGroups is EqualUnmodifiableListView) return _optionGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_optionGroups);
  }

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductCopyWith<_Product> get copyWith =>
      __$ProductCopyWithImpl<_Product>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProductToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Product &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.nameAr, nameAr) || other.nameAr == nameAr) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.descriptionAr, descriptionAr) ||
                other.descriptionAr == descriptionAr) &&
            (identical(other.descriptionEn, descriptionEn) ||
                other.descriptionEn == descriptionEn) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(
              other._galleryUrls,
              _galleryUrls,
            ) &&
            (identical(other.basePrice, basePrice) ||
                other.basePrice == basePrice) &&
            (identical(other.compareAtPrice, compareAtPrice) ||
                other.compareAtPrice == compareAtPrice) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.stockStatus, stockStatus) ||
                other.stockStatus == stockStatus) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured) &&
            const DeepCollectionEquality().equals(
              other._optionGroups,
              _optionGroups,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    categoryId,
    nameAr,
    nameEn,
    descriptionAr,
    descriptionEn,
    imageUrl,
    const DeepCollectionEquality().hash(_galleryUrls),
    basePrice,
    compareAtPrice,
    rating,
    reviewCount,
    stockStatus,
    isFeatured,
    const DeepCollectionEquality().hash(_optionGroups),
  );

  @override
  String toString() {
    return 'Product(id: $id, categoryId: $categoryId, nameAr: $nameAr, nameEn: $nameEn, descriptionAr: $descriptionAr, descriptionEn: $descriptionEn, imageUrl: $imageUrl, galleryUrls: $galleryUrls, basePrice: $basePrice, compareAtPrice: $compareAtPrice, rating: $rating, reviewCount: $reviewCount, stockStatus: $stockStatus, isFeatured: $isFeatured, optionGroups: $optionGroups)';
  }
}

/// @nodoc
abstract mixin class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) _then) =
      __$ProductCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String categoryId,
    String nameAr,
    String nameEn,
    String descriptionAr,
    String descriptionEn,
    String imageUrl,
    List<String> galleryUrls,
    Money basePrice,
    Money? compareAtPrice,
    double rating,
    int reviewCount,
    StockStatus stockStatus,
    bool isFeatured,
    List<ProductOptionGroup> optionGroups,
  });
}

/// @nodoc
class __$ProductCopyWithImpl<$Res> implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(this._self, this._then);

  final _Product _self;
  final $Res Function(_Product) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? categoryId = null,
    Object? nameAr = null,
    Object? nameEn = null,
    Object? descriptionAr = null,
    Object? descriptionEn = null,
    Object? imageUrl = null,
    Object? galleryUrls = null,
    Object? basePrice = null,
    Object? compareAtPrice = freezed,
    Object? rating = null,
    Object? reviewCount = null,
    Object? stockStatus = null,
    Object? isFeatured = null,
    Object? optionGroups = null,
  }) {
    return _then(
      _Product(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryId: null == categoryId
            ? _self.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String,
        nameAr: null == nameAr
            ? _self.nameAr
            : nameAr // ignore: cast_nullable_to_non_nullable
                  as String,
        nameEn: null == nameEn
            ? _self.nameEn
            : nameEn // ignore: cast_nullable_to_non_nullable
                  as String,
        descriptionAr: null == descriptionAr
            ? _self.descriptionAr
            : descriptionAr // ignore: cast_nullable_to_non_nullable
                  as String,
        descriptionEn: null == descriptionEn
            ? _self.descriptionEn
            : descriptionEn // ignore: cast_nullable_to_non_nullable
                  as String,
        imageUrl: null == imageUrl
            ? _self.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        galleryUrls: null == galleryUrls
            ? _self._galleryUrls
            : galleryUrls // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        basePrice: null == basePrice
            ? _self.basePrice
            : basePrice // ignore: cast_nullable_to_non_nullable
                  as Money,
        compareAtPrice: freezed == compareAtPrice
            ? _self.compareAtPrice
            : compareAtPrice // ignore: cast_nullable_to_non_nullable
                  as Money?,
        rating: null == rating
            ? _self.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as double,
        reviewCount: null == reviewCount
            ? _self.reviewCount
            : reviewCount // ignore: cast_nullable_to_non_nullable
                  as int,
        stockStatus: null == stockStatus
            ? _self.stockStatus
            : stockStatus // ignore: cast_nullable_to_non_nullable
                  as StockStatus,
        isFeatured: null == isFeatured
            ? _self.isFeatured
            : isFeatured // ignore: cast_nullable_to_non_nullable
                  as bool,
        optionGroups: null == optionGroups
            ? _self._optionGroups
            : optionGroups // ignore: cast_nullable_to_non_nullable
                  as List<ProductOptionGroup>,
      ),
    );
  }
}
