/// Core result type used throughout the application.
/// 
/// Every repository method and use case returns [Result<T>].
/// ViewModels translate failures into localized UI states.
sealed class Result<T> {
  const Result();

  /// Returns `true` if this is a [Success].
  bool get isSuccess => this is Success<T>;

  /// Returns `true` if this is a [Failure].
  bool get isFailure => this is Failure<T>;

  /// Returns the data if [Success], throws otherwise.
  T get dataOrThrow => switch (this) {
        Success(:final data) => data,
        Failure(:final failure) =>
          throw StateError('Result is a failure: $failure'),
      };

  /// Maps the data inside [Success] to a new type.
  Result<U> map<U>(U Function(T data) transform) => switch (this) {
        Success(:final data) => Success(transform(data)),
        Failure(:final failure) => Failure(failure),
      };

  /// Calls [onSuccess] if [Success], [onFailure] if [Failure].
  R fold<R>({
    required R Function(T data) onSuccess,
    required R Function(AppFailure failure) onFailure,
  }) =>
      switch (this) {
        Success(:final data) => onSuccess(data),
        Failure(:final failure) => onFailure(failure),
      };
}

/// Represents a successful result carrying data of type [T].
final class Success<T> extends Result<T> {
  const Success(this.data);

  final T data;

  @override
  String toString() => 'Success($data)';
}

/// Represents a failed result carrying an [AppFailure].
final class Failure<T> extends Result<T> {
  const Failure(this.failure);

  final AppFailure failure;

  @override
  String toString() => 'Failure($failure)';
}

// ---------------------------------------------------------------------------
// Failure hierarchy
// ---------------------------------------------------------------------------

/// Base class for all typed application failures.
///
/// Never expose raw exceptions to ViewModels or UI.
/// All failures carry a human-readable [message] for logging.
sealed class AppFailure {
  const AppFailure(this.message);

  final String message;

  @override
  String toString() => 'AppFailure: $message';
}

/// The device has no active network connection.
final class OfflineFailure extends AppFailure {
  const OfflineFailure({String message = 'No internet connection.'})
      : super(message);
}

/// A network request failed (DNS, timeout, server error, etc.).
final class NetworkFailure extends AppFailure {
  const NetworkFailure({
    required String message,
    this.statusCode,
  }) : super(message);

  final int? statusCode;
}

/// The user is not authenticated or the session has expired.
final class UnauthorizedFailure extends AppFailure {
  const UnauthorizedFailure({String message = 'Session expired. Please sign in again.'})
      : super(message);
}

/// One or more input fields are invalid.
final class ValidationFailure extends AppFailure {
  const ValidationFailure({
    String message = 'Validation failed.',
    this.fieldErrors = const {},
  }) : super(message);

  /// Map of field name → error message.
  final Map<String, String> fieldErrors;
}

/// The requested resource was not found.
final class NotFoundFailure extends AppFailure {
  const NotFoundFailure({String message = 'Resource not found.'})
      : super(message);
}

/// A resource conflict occurred (e.g., duplicate email).
final class ConflictFailure extends AppFailure {
  const ConflictFailure({required String message}) : super(message);
}

/// A payment operation failed.
final class PaymentFailure extends AppFailure {
  const PaymentFailure({required String message, this.code}) : super(message);

  final String? code;
}

/// A local storage operation failed.
final class StorageFailure extends AppFailure {
  const StorageFailure({required String message}) : super(message);
}

/// An unclassified or unexpected failure.
final class UnknownFailure extends AppFailure {
  const UnknownFailure({String message = 'An unexpected error occurred.'})
      : super(message);

  // Original exception for logging only — never shown to users.
  factory UnknownFailure.fromException(Object error) =>
      UnknownFailure(message: 'Unexpected error: ${error.runtimeType}');
}
