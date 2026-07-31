// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HomeCategory _$HomeCategoryFromJson(Map<String, dynamic> json) {
  return _HomeCategory.fromJson(json);
}

/// @nodoc
mixin _$HomeCategory {
  String get id => throw _privateConstructorUsedError;
  String get titleAr => throw _privateConstructorUsedError;
  String get titleEn => throw _privateConstructorUsedError;
  String get svgIcon => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;

  /// Serializes this HomeCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HomeCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeCategoryCopyWith<HomeCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeCategoryCopyWith<$Res> {
  factory $HomeCategoryCopyWith(
          HomeCategory value, $Res Function(HomeCategory) then) =
      _$HomeCategoryCopyWithImpl<$Res, HomeCategory>;
  @useResult
  $Res call(
      {String id,
      String titleAr,
      String titleEn,
      String svgIcon,
      bool isSelected});
}

/// @nodoc
class _$HomeCategoryCopyWithImpl<$Res, $Val extends HomeCategory>
    implements $HomeCategoryCopyWith<$Res> {
  _$HomeCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      titleAr: null == titleAr
          ? _value.titleAr
          : titleAr // ignore: cast_nullable_to_non_nullable
              as String,
      titleEn: null == titleEn
          ? _value.titleEn
          : titleEn // ignore: cast_nullable_to_non_nullable
              as String,
      svgIcon: null == svgIcon
          ? _value.svgIcon
          : svgIcon // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeCategoryImplCopyWith<$Res>
    implements $HomeCategoryCopyWith<$Res> {
  factory _$$HomeCategoryImplCopyWith(
          _$HomeCategoryImpl value, $Res Function(_$HomeCategoryImpl) then) =
      __$$HomeCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String titleAr,
      String titleEn,
      String svgIcon,
      bool isSelected});
}

/// @nodoc
class __$$HomeCategoryImplCopyWithImpl<$Res>
    extends _$HomeCategoryCopyWithImpl<$Res, _$HomeCategoryImpl>
    implements _$$HomeCategoryImplCopyWith<$Res> {
  __$$HomeCategoryImplCopyWithImpl(
      _$HomeCategoryImpl _value, $Res Function(_$HomeCategoryImpl) _then)
      : super(_value, _then);

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
    return _then(_$HomeCategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      titleAr: null == titleAr
          ? _value.titleAr
          : titleAr // ignore: cast_nullable_to_non_nullable
              as String,
      titleEn: null == titleEn
          ? _value.titleEn
          : titleEn // ignore: cast_nullable_to_non_nullable
              as String,
      svgIcon: null == svgIcon
          ? _value.svgIcon
          : svgIcon // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeCategoryImpl implements _HomeCategory {
  const _$HomeCategoryImpl(
      {required this.id,
      required this.titleAr,
      required this.titleEn,
      required this.svgIcon,
      this.isSelected = false});

  factory _$HomeCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeCategoryImplFromJson(json);

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

  @override
  String toString() {
    return 'HomeCategory(id: $id, titleAr: $titleAr, titleEn: $titleEn, svgIcon: $svgIcon, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeCategoryImpl &&
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

  /// Create a copy of HomeCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeCategoryImplCopyWith<_$HomeCategoryImpl> get copyWith =>
      __$$HomeCategoryImplCopyWithImpl<_$HomeCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeCategoryImplToJson(
      this,
    );
  }
}

abstract class _HomeCategory implements HomeCategory {
  const factory _HomeCategory(
      {required final String id,
      required final String titleAr,
      required final String titleEn,
      required final String svgIcon,
      final bool isSelected}) = _$HomeCategoryImpl;

  factory _HomeCategory.fromJson(Map<String, dynamic> json) =
      _$HomeCategoryImpl.fromJson;

  @override
  String get id;
  @override
  String get titleAr;
  @override
  String get titleEn;
  @override
  String get svgIcon;
  @override
  bool get isSelected;

  /// Create a copy of HomeCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeCategoryImplCopyWith<_$HomeCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
