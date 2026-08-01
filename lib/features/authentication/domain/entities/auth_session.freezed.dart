// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthSession {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthSession);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthSession()';
  }
}

/// @nodoc
class $AuthSessionCopyWith<$Res> {
  $AuthSessionCopyWith(AuthSession _, $Res Function(AuthSession) __);
}

/// Adds pattern-matching-related methods to [AuthSession].
extension AuthSessionPatterns on AuthSession {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthSessionGuest value)? guest,
    TResult Function(_AuthSessionUnverified value)? unverified,
    TResult Function(_AuthSessionAuthenticated value)? authenticated,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthSessionGuest() when guest != null:
        return guest(_that);
      case _AuthSessionUnverified() when unverified != null:
        return unverified(_that);
      case _AuthSessionAuthenticated() when authenticated != null:
        return authenticated(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthSessionGuest value) guest,
    required TResult Function(_AuthSessionUnverified value) unverified,
    required TResult Function(_AuthSessionAuthenticated value) authenticated,
  }) {
    final _that = this;
    switch (_that) {
      case _AuthSessionGuest():
        return guest(_that);
      case _AuthSessionUnverified():
        return unverified(_that);
      case _AuthSessionAuthenticated():
        return authenticated(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthSessionGuest value)? guest,
    TResult? Function(_AuthSessionUnverified value)? unverified,
    TResult? Function(_AuthSessionAuthenticated value)? authenticated,
  }) {
    final _that = this;
    switch (_that) {
      case _AuthSessionGuest() when guest != null:
        return guest(_that);
      case _AuthSessionUnverified() when unverified != null:
        return unverified(_that);
      case _AuthSessionAuthenticated() when authenticated != null:
        return authenticated(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? guest,
    TResult Function(AuthUser user)? unverified,
    TResult Function(AuthUser user)? authenticated,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthSessionGuest() when guest != null:
        return guest();
      case _AuthSessionUnverified() when unverified != null:
        return unverified(_that.user);
      case _AuthSessionAuthenticated() when authenticated != null:
        return authenticated(_that.user);
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
  TResult when<TResult extends Object?>({
    required TResult Function() guest,
    required TResult Function(AuthUser user) unverified,
    required TResult Function(AuthUser user) authenticated,
  }) {
    final _that = this;
    switch (_that) {
      case _AuthSessionGuest():
        return guest();
      case _AuthSessionUnverified():
        return unverified(_that.user);
      case _AuthSessionAuthenticated():
        return authenticated(_that.user);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? guest,
    TResult? Function(AuthUser user)? unverified,
    TResult? Function(AuthUser user)? authenticated,
  }) {
    final _that = this;
    switch (_that) {
      case _AuthSessionGuest() when guest != null:
        return guest();
      case _AuthSessionUnverified() when unverified != null:
        return unverified(_that.user);
      case _AuthSessionAuthenticated() when authenticated != null:
        return authenticated(_that.user);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AuthSessionGuest extends AuthSession {
  const _AuthSessionGuest() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _AuthSessionGuest);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthSession.guest()';
  }
}

/// @nodoc

class _AuthSessionUnverified extends AuthSession {
  const _AuthSessionUnverified({required this.user}) : super._();

  final AuthUser user;

  /// Create a copy of AuthSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthSessionUnverifiedCopyWith<_AuthSessionUnverified> get copyWith =>
      __$AuthSessionUnverifiedCopyWithImpl<_AuthSessionUnverified>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthSessionUnverified &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @override
  String toString() {
    return 'AuthSession.unverified(user: $user)';
  }
}

/// @nodoc
abstract mixin class _$AuthSessionUnverifiedCopyWith<$Res>
    implements $AuthSessionCopyWith<$Res> {
  factory _$AuthSessionUnverifiedCopyWith(
    _AuthSessionUnverified value,
    $Res Function(_AuthSessionUnverified) _then,
  ) = __$AuthSessionUnverifiedCopyWithImpl;
  @useResult
  $Res call({AuthUser user});

  $AuthUserCopyWith<$Res> get user;
}

/// @nodoc
class __$AuthSessionUnverifiedCopyWithImpl<$Res>
    implements _$AuthSessionUnverifiedCopyWith<$Res> {
  __$AuthSessionUnverifiedCopyWithImpl(this._self, this._then);

  final _AuthSessionUnverified _self;
  final $Res Function(_AuthSessionUnverified) _then;

  /// Create a copy of AuthSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? user = null}) {
    return _then(
      _AuthSessionUnverified(
        user: null == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as AuthUser,
      ),
    );
  }

  /// Create a copy of AuthSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthUserCopyWith<$Res> get user {
    return $AuthUserCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// @nodoc

class _AuthSessionAuthenticated extends AuthSession {
  const _AuthSessionAuthenticated({required this.user}) : super._();

  final AuthUser user;

  /// Create a copy of AuthSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthSessionAuthenticatedCopyWith<_AuthSessionAuthenticated> get copyWith =>
      __$AuthSessionAuthenticatedCopyWithImpl<_AuthSessionAuthenticated>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthSessionAuthenticated &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @override
  String toString() {
    return 'AuthSession.authenticated(user: $user)';
  }
}

/// @nodoc
abstract mixin class _$AuthSessionAuthenticatedCopyWith<$Res>
    implements $AuthSessionCopyWith<$Res> {
  factory _$AuthSessionAuthenticatedCopyWith(
    _AuthSessionAuthenticated value,
    $Res Function(_AuthSessionAuthenticated) _then,
  ) = __$AuthSessionAuthenticatedCopyWithImpl;
  @useResult
  $Res call({AuthUser user});

  $AuthUserCopyWith<$Res> get user;
}

/// @nodoc
class __$AuthSessionAuthenticatedCopyWithImpl<$Res>
    implements _$AuthSessionAuthenticatedCopyWith<$Res> {
  __$AuthSessionAuthenticatedCopyWithImpl(this._self, this._then);

  final _AuthSessionAuthenticated _self;
  final $Res Function(_AuthSessionAuthenticated) _then;

  /// Create a copy of AuthSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? user = null}) {
    return _then(
      _AuthSessionAuthenticated(
        user: null == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as AuthUser,
      ),
    );
  }

  /// Create a copy of AuthSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthUserCopyWith<$Res> get user {
    return $AuthUserCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}
