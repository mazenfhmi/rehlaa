// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_transfer_submission.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BankTransferSubmission {
  String get referenceId;
  String get bankId;
  String get operationNumber;
  String get receiptFilePath;
  BankTransferStatus get status;
  DateTime get submittedAt;

  /// Create a copy of BankTransferSubmission
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BankTransferSubmissionCopyWith<BankTransferSubmission> get copyWith =>
      _$BankTransferSubmissionCopyWithImpl<BankTransferSubmission>(
        this as BankTransferSubmission,
        _$identity,
      );

  /// Serializes this BankTransferSubmission to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BankTransferSubmission &&
            (identical(other.referenceId, referenceId) ||
                other.referenceId == referenceId) &&
            (identical(other.bankId, bankId) || other.bankId == bankId) &&
            (identical(other.operationNumber, operationNumber) ||
                other.operationNumber == operationNumber) &&
            (identical(other.receiptFilePath, receiptFilePath) ||
                other.receiptFilePath == receiptFilePath) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.submittedAt, submittedAt) ||
                other.submittedAt == submittedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    referenceId,
    bankId,
    operationNumber,
    receiptFilePath,
    status,
    submittedAt,
  );

  @override
  String toString() {
    return 'BankTransferSubmission(referenceId: $referenceId, bankId: $bankId, operationNumber: $operationNumber, receiptFilePath: $receiptFilePath, status: $status, submittedAt: $submittedAt)';
  }
}

/// @nodoc
abstract mixin class $BankTransferSubmissionCopyWith<$Res> {
  factory $BankTransferSubmissionCopyWith(
    BankTransferSubmission value,
    $Res Function(BankTransferSubmission) _then,
  ) = _$BankTransferSubmissionCopyWithImpl;
  @useResult
  $Res call({
    String referenceId,
    String bankId,
    String operationNumber,
    String receiptFilePath,
    BankTransferStatus status,
    DateTime submittedAt,
  });
}

/// @nodoc
class _$BankTransferSubmissionCopyWithImpl<$Res>
    implements $BankTransferSubmissionCopyWith<$Res> {
  _$BankTransferSubmissionCopyWithImpl(this._self, this._then);

  final BankTransferSubmission _self;
  final $Res Function(BankTransferSubmission) _then;

  /// Create a copy of BankTransferSubmission
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referenceId = null,
    Object? bankId = null,
    Object? operationNumber = null,
    Object? receiptFilePath = null,
    Object? status = null,
    Object? submittedAt = null,
  }) {
    return _then(
      _self.copyWith(
        referenceId: null == referenceId
            ? _self.referenceId
            : referenceId // ignore: cast_nullable_to_non_nullable
                  as String,
        bankId: null == bankId
            ? _self.bankId
            : bankId // ignore: cast_nullable_to_non_nullable
                  as String,
        operationNumber: null == operationNumber
            ? _self.operationNumber
            : operationNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        receiptFilePath: null == receiptFilePath
            ? _self.receiptFilePath
            : receiptFilePath // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as BankTransferStatus,
        submittedAt: null == submittedAt
            ? _self.submittedAt
            : submittedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [BankTransferSubmission].
extension BankTransferSubmissionPatterns on BankTransferSubmission {
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
    TResult Function(_BankTransferSubmission value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BankTransferSubmission() when $default != null:
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
    TResult Function(_BankTransferSubmission value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BankTransferSubmission():
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
    TResult? Function(_BankTransferSubmission value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BankTransferSubmission() when $default != null:
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
      String referenceId,
      String bankId,
      String operationNumber,
      String receiptFilePath,
      BankTransferStatus status,
      DateTime submittedAt,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BankTransferSubmission() when $default != null:
        return $default(
          _that.referenceId,
          _that.bankId,
          _that.operationNumber,
          _that.receiptFilePath,
          _that.status,
          _that.submittedAt,
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
      String referenceId,
      String bankId,
      String operationNumber,
      String receiptFilePath,
      BankTransferStatus status,
      DateTime submittedAt,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BankTransferSubmission():
        return $default(
          _that.referenceId,
          _that.bankId,
          _that.operationNumber,
          _that.receiptFilePath,
          _that.status,
          _that.submittedAt,
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
      String referenceId,
      String bankId,
      String operationNumber,
      String receiptFilePath,
      BankTransferStatus status,
      DateTime submittedAt,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BankTransferSubmission() when $default != null:
        return $default(
          _that.referenceId,
          _that.bankId,
          _that.operationNumber,
          _that.receiptFilePath,
          _that.status,
          _that.submittedAt,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BankTransferSubmission implements BankTransferSubmission {
  const _BankTransferSubmission({
    required this.referenceId,
    required this.bankId,
    required this.operationNumber,
    required this.receiptFilePath,
    required this.status,
    required this.submittedAt,
  });
  factory _BankTransferSubmission.fromJson(Map<String, dynamic> json) =>
      _$BankTransferSubmissionFromJson(json);

  @override
  final String referenceId;
  @override
  final String bankId;
  @override
  final String operationNumber;
  @override
  final String receiptFilePath;
  @override
  final BankTransferStatus status;
  @override
  final DateTime submittedAt;

  /// Create a copy of BankTransferSubmission
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BankTransferSubmissionCopyWith<_BankTransferSubmission> get copyWith =>
      __$BankTransferSubmissionCopyWithImpl<_BankTransferSubmission>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$BankTransferSubmissionToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BankTransferSubmission &&
            (identical(other.referenceId, referenceId) ||
                other.referenceId == referenceId) &&
            (identical(other.bankId, bankId) || other.bankId == bankId) &&
            (identical(other.operationNumber, operationNumber) ||
                other.operationNumber == operationNumber) &&
            (identical(other.receiptFilePath, receiptFilePath) ||
                other.receiptFilePath == receiptFilePath) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.submittedAt, submittedAt) ||
                other.submittedAt == submittedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    referenceId,
    bankId,
    operationNumber,
    receiptFilePath,
    status,
    submittedAt,
  );

  @override
  String toString() {
    return 'BankTransferSubmission(referenceId: $referenceId, bankId: $bankId, operationNumber: $operationNumber, receiptFilePath: $receiptFilePath, status: $status, submittedAt: $submittedAt)';
  }
}

/// @nodoc
abstract mixin class _$BankTransferSubmissionCopyWith<$Res>
    implements $BankTransferSubmissionCopyWith<$Res> {
  factory _$BankTransferSubmissionCopyWith(
    _BankTransferSubmission value,
    $Res Function(_BankTransferSubmission) _then,
  ) = __$BankTransferSubmissionCopyWithImpl;
  @override
  @useResult
  $Res call({
    String referenceId,
    String bankId,
    String operationNumber,
    String receiptFilePath,
    BankTransferStatus status,
    DateTime submittedAt,
  });
}

/// @nodoc
class __$BankTransferSubmissionCopyWithImpl<$Res>
    implements _$BankTransferSubmissionCopyWith<$Res> {
  __$BankTransferSubmissionCopyWithImpl(this._self, this._then);

  final _BankTransferSubmission _self;
  final $Res Function(_BankTransferSubmission) _then;

  /// Create a copy of BankTransferSubmission
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? referenceId = null,
    Object? bankId = null,
    Object? operationNumber = null,
    Object? receiptFilePath = null,
    Object? status = null,
    Object? submittedAt = null,
  }) {
    return _then(
      _BankTransferSubmission(
        referenceId: null == referenceId
            ? _self.referenceId
            : referenceId // ignore: cast_nullable_to_non_nullable
                  as String,
        bankId: null == bankId
            ? _self.bankId
            : bankId // ignore: cast_nullable_to_non_nullable
                  as String,
        operationNumber: null == operationNumber
            ? _self.operationNumber
            : operationNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        receiptFilePath: null == receiptFilePath
            ? _self.receiptFilePath
            : receiptFilePath // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as BankTransferStatus,
        submittedAt: null == submittedAt
            ? _self.submittedAt
            : submittedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}
