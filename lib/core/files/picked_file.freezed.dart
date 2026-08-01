// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'picked_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PickedFile {
  String get path;
  String get name;
  String get mimeType;
  int get sizeBytes;

  /// Create a copy of PickedFile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PickedFileCopyWith<PickedFile> get copyWith =>
      _$PickedFileCopyWithImpl<PickedFile>(this as PickedFile, _$identity);

  /// Serializes this PickedFile to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PickedFile &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.sizeBytes, sizeBytes) ||
                other.sizeBytes == sizeBytes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, path, name, mimeType, sizeBytes);

  @override
  String toString() {
    return 'PickedFile(path: $path, name: $name, mimeType: $mimeType, sizeBytes: $sizeBytes)';
  }
}

/// @nodoc
abstract mixin class $PickedFileCopyWith<$Res> {
  factory $PickedFileCopyWith(
    PickedFile value,
    $Res Function(PickedFile) _then,
  ) = _$PickedFileCopyWithImpl;
  @useResult
  $Res call({String path, String name, String mimeType, int sizeBytes});
}

/// @nodoc
class _$PickedFileCopyWithImpl<$Res> implements $PickedFileCopyWith<$Res> {
  _$PickedFileCopyWithImpl(this._self, this._then);

  final PickedFile _self;
  final $Res Function(PickedFile) _then;

  /// Create a copy of PickedFile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? name = null,
    Object? mimeType = null,
    Object? sizeBytes = null,
  }) {
    return _then(
      _self.copyWith(
        path: null == path
            ? _self.path
            : path // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        mimeType: null == mimeType
            ? _self.mimeType
            : mimeType // ignore: cast_nullable_to_non_nullable
                  as String,
        sizeBytes: null == sizeBytes
            ? _self.sizeBytes
            : sizeBytes // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [PickedFile].
extension PickedFilePatterns on PickedFile {
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
    TResult Function(_PickedFile value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PickedFile() when $default != null:
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
    TResult Function(_PickedFile value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PickedFile():
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
    TResult? Function(_PickedFile value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PickedFile() when $default != null:
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
    TResult Function(String path, String name, String mimeType, int sizeBytes)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PickedFile() when $default != null:
        return $default(
          _that.path,
          _that.name,
          _that.mimeType,
          _that.sizeBytes,
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
    TResult Function(String path, String name, String mimeType, int sizeBytes)
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PickedFile():
        return $default(
          _that.path,
          _that.name,
          _that.mimeType,
          _that.sizeBytes,
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
    TResult? Function(String path, String name, String mimeType, int sizeBytes)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PickedFile() when $default != null:
        return $default(
          _that.path,
          _that.name,
          _that.mimeType,
          _that.sizeBytes,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PickedFile implements PickedFile {
  const _PickedFile({
    required this.path,
    required this.name,
    required this.mimeType,
    required this.sizeBytes,
  });
  factory _PickedFile.fromJson(Map<String, dynamic> json) =>
      _$PickedFileFromJson(json);

  @override
  final String path;
  @override
  final String name;
  @override
  final String mimeType;
  @override
  final int sizeBytes;

  /// Create a copy of PickedFile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PickedFileCopyWith<_PickedFile> get copyWith =>
      __$PickedFileCopyWithImpl<_PickedFile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PickedFileToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PickedFile &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.sizeBytes, sizeBytes) ||
                other.sizeBytes == sizeBytes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, path, name, mimeType, sizeBytes);

  @override
  String toString() {
    return 'PickedFile(path: $path, name: $name, mimeType: $mimeType, sizeBytes: $sizeBytes)';
  }
}

/// @nodoc
abstract mixin class _$PickedFileCopyWith<$Res>
    implements $PickedFileCopyWith<$Res> {
  factory _$PickedFileCopyWith(
    _PickedFile value,
    $Res Function(_PickedFile) _then,
  ) = __$PickedFileCopyWithImpl;
  @override
  @useResult
  $Res call({String path, String name, String mimeType, int sizeBytes});
}

/// @nodoc
class __$PickedFileCopyWithImpl<$Res> implements _$PickedFileCopyWith<$Res> {
  __$PickedFileCopyWithImpl(this._self, this._then);

  final _PickedFile _self;
  final $Res Function(_PickedFile) _then;

  /// Create a copy of PickedFile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? path = null,
    Object? name = null,
    Object? mimeType = null,
    Object? sizeBytes = null,
  }) {
    return _then(
      _PickedFile(
        path: null == path
            ? _self.path
            : path // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        mimeType: null == mimeType
            ? _self.mimeType
            : mimeType // ignore: cast_nullable_to_non_nullable
                  as String,
        sizeBytes: null == sizeBytes
            ? _self.sizeBytes
            : sizeBytes // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}
