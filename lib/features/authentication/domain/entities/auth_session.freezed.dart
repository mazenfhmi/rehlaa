// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthSession {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() guest,
    required TResult Function(AuthUser user) unverified,
    required TResult Function(AuthUser user) authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? guest,
    TResult? Function(AuthUser user)? unverified,
    TResult? Function(AuthUser user)? authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? guest,
    TResult Function(AuthUser user)? unverified,
    TResult Function(AuthUser user)? authenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthSessionGuest value) guest,
    required TResult Function(_AuthSessionUnverified value) unverified,
    required TResult Function(_AuthSessionAuthenticated value) authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthSessionGuest value)? guest,
    TResult? Function(_AuthSessionUnverified value)? unverified,
    TResult? Function(_AuthSessionAuthenticated value)? authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthSessionGuest value)? guest,
    TResult Function(_AuthSessionUnverified value)? unverified,
    TResult Function(_AuthSessionAuthenticated value)? authenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthSessionCopyWith<$Res> {
  factory $AuthSessionCopyWith(
          AuthSession value, $Res Function(AuthSession) then) =
      _$AuthSessionCopyWithImpl<$Res, AuthSession>;
}

/// @nodoc
class _$AuthSessionCopyWithImpl<$Res, $Val extends AuthSession>
    implements $AuthSessionCopyWith<$Res> {
  _$AuthSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthSession
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AuthSessionGuestImplCopyWith<$Res> {
  factory _$$AuthSessionGuestImplCopyWith(_$AuthSessionGuestImpl value,
          $Res Function(_$AuthSessionGuestImpl) then) =
      __$$AuthSessionGuestImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthSessionGuestImplCopyWithImpl<$Res>
    extends _$AuthSessionCopyWithImpl<$Res, _$AuthSessionGuestImpl>
    implements _$$AuthSessionGuestImplCopyWith<$Res> {
  __$$AuthSessionGuestImplCopyWithImpl(_$AuthSessionGuestImpl _value,
      $Res Function(_$AuthSessionGuestImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthSession
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthSessionGuestImpl extends _AuthSessionGuest {
  const _$AuthSessionGuestImpl() : super._();

  @override
  String toString() {
    return 'AuthSession.guest()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthSessionGuestImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() guest,
    required TResult Function(AuthUser user) unverified,
    required TResult Function(AuthUser user) authenticated,
  }) {
    return guest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? guest,
    TResult? Function(AuthUser user)? unverified,
    TResult? Function(AuthUser user)? authenticated,
  }) {
    return guest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? guest,
    TResult Function(AuthUser user)? unverified,
    TResult Function(AuthUser user)? authenticated,
    required TResult orElse(),
  }) {
    if (guest != null) {
      return guest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthSessionGuest value) guest,
    required TResult Function(_AuthSessionUnverified value) unverified,
    required TResult Function(_AuthSessionAuthenticated value) authenticated,
  }) {
    return guest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthSessionGuest value)? guest,
    TResult? Function(_AuthSessionUnverified value)? unverified,
    TResult? Function(_AuthSessionAuthenticated value)? authenticated,
  }) {
    return guest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthSessionGuest value)? guest,
    TResult Function(_AuthSessionUnverified value)? unverified,
    TResult Function(_AuthSessionAuthenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (guest != null) {
      return guest(this);
    }
    return orElse();
  }
}

abstract class _AuthSessionGuest extends AuthSession {
  const factory _AuthSessionGuest() = _$AuthSessionGuestImpl;
  const _AuthSessionGuest._() : super._();
}

/// @nodoc
abstract class _$$AuthSessionUnverifiedImplCopyWith<$Res> {
  factory _$$AuthSessionUnverifiedImplCopyWith(
          _$AuthSessionUnverifiedImpl value,
          $Res Function(_$AuthSessionUnverifiedImpl) then) =
      __$$AuthSessionUnverifiedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthUser user});

  $AuthUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthSessionUnverifiedImplCopyWithImpl<$Res>
    extends _$AuthSessionCopyWithImpl<$Res, _$AuthSessionUnverifiedImpl>
    implements _$$AuthSessionUnverifiedImplCopyWith<$Res> {
  __$$AuthSessionUnverifiedImplCopyWithImpl(_$AuthSessionUnverifiedImpl _value,
      $Res Function(_$AuthSessionUnverifiedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$AuthSessionUnverifiedImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AuthUser,
    ));
  }

  /// Create a copy of AuthSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthUserCopyWith<$Res> get user {
    return $AuthUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$AuthSessionUnverifiedImpl extends _AuthSessionUnverified {
  const _$AuthSessionUnverifiedImpl({required this.user}) : super._();

  @override
  final AuthUser user;

  @override
  String toString() {
    return 'AuthSession.unverified(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSessionUnverifiedImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of AuthSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthSessionUnverifiedImplCopyWith<_$AuthSessionUnverifiedImpl>
      get copyWith => __$$AuthSessionUnverifiedImplCopyWithImpl<
          _$AuthSessionUnverifiedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() guest,
    required TResult Function(AuthUser user) unverified,
    required TResult Function(AuthUser user) authenticated,
  }) {
    return unverified(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? guest,
    TResult? Function(AuthUser user)? unverified,
    TResult? Function(AuthUser user)? authenticated,
  }) {
    return unverified?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? guest,
    TResult Function(AuthUser user)? unverified,
    TResult Function(AuthUser user)? authenticated,
    required TResult orElse(),
  }) {
    if (unverified != null) {
      return unverified(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthSessionGuest value) guest,
    required TResult Function(_AuthSessionUnverified value) unverified,
    required TResult Function(_AuthSessionAuthenticated value) authenticated,
  }) {
    return unverified(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthSessionGuest value)? guest,
    TResult? Function(_AuthSessionUnverified value)? unverified,
    TResult? Function(_AuthSessionAuthenticated value)? authenticated,
  }) {
    return unverified?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthSessionGuest value)? guest,
    TResult Function(_AuthSessionUnverified value)? unverified,
    TResult Function(_AuthSessionAuthenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (unverified != null) {
      return unverified(this);
    }
    return orElse();
  }
}

abstract class _AuthSessionUnverified extends AuthSession {
  const factory _AuthSessionUnverified({required final AuthUser user}) =
      _$AuthSessionUnverifiedImpl;
  const _AuthSessionUnverified._() : super._();

  AuthUser get user;

  /// Create a copy of AuthSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthSessionUnverifiedImplCopyWith<_$AuthSessionUnverifiedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthSessionAuthenticatedImplCopyWith<$Res> {
  factory _$$AuthSessionAuthenticatedImplCopyWith(
          _$AuthSessionAuthenticatedImpl value,
          $Res Function(_$AuthSessionAuthenticatedImpl) then) =
      __$$AuthSessionAuthenticatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthUser user});

  $AuthUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthSessionAuthenticatedImplCopyWithImpl<$Res>
    extends _$AuthSessionCopyWithImpl<$Res, _$AuthSessionAuthenticatedImpl>
    implements _$$AuthSessionAuthenticatedImplCopyWith<$Res> {
  __$$AuthSessionAuthenticatedImplCopyWithImpl(
      _$AuthSessionAuthenticatedImpl _value,
      $Res Function(_$AuthSessionAuthenticatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$AuthSessionAuthenticatedImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AuthUser,
    ));
  }

  /// Create a copy of AuthSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthUserCopyWith<$Res> get user {
    return $AuthUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$AuthSessionAuthenticatedImpl extends _AuthSessionAuthenticated {
  const _$AuthSessionAuthenticatedImpl({required this.user}) : super._();

  @override
  final AuthUser user;

  @override
  String toString() {
    return 'AuthSession.authenticated(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSessionAuthenticatedImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of AuthSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthSessionAuthenticatedImplCopyWith<_$AuthSessionAuthenticatedImpl>
      get copyWith => __$$AuthSessionAuthenticatedImplCopyWithImpl<
          _$AuthSessionAuthenticatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() guest,
    required TResult Function(AuthUser user) unverified,
    required TResult Function(AuthUser user) authenticated,
  }) {
    return authenticated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? guest,
    TResult? Function(AuthUser user)? unverified,
    TResult? Function(AuthUser user)? authenticated,
  }) {
    return authenticated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? guest,
    TResult Function(AuthUser user)? unverified,
    TResult Function(AuthUser user)? authenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthSessionGuest value) guest,
    required TResult Function(_AuthSessionUnverified value) unverified,
    required TResult Function(_AuthSessionAuthenticated value) authenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthSessionGuest value)? guest,
    TResult? Function(_AuthSessionUnverified value)? unverified,
    TResult? Function(_AuthSessionAuthenticated value)? authenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthSessionGuest value)? guest,
    TResult Function(_AuthSessionUnverified value)? unverified,
    TResult Function(_AuthSessionAuthenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _AuthSessionAuthenticated extends AuthSession {
  const factory _AuthSessionAuthenticated({required final AuthUser user}) =
      _$AuthSessionAuthenticatedImpl;
  const _AuthSessionAuthenticated._() : super._();

  AuthUser get user;

  /// Create a copy of AuthSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthSessionAuthenticatedImplCopyWith<_$AuthSessionAuthenticatedImpl>
      get copyWith => throw _privateConstructorUsedError;
}
