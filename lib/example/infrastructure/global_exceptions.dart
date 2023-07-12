/// Exceptions caused when calling Leal API
class RestApiException implements Exception {
  /// Constructor
  const RestApiException({this.errorCode, this.errorMessage});

  /// Error Status Code
  final int? errorCode;

  /// Error message
  final String? errorMessage;
}

/// Exception when there is not internet connection
class NoInternetConnectionException implements Exception {
  /// Constructor
  const NoInternetConnectionException(this.message);

  /// Error message
  final String message;
}

/// Exceptions caused when there is not data found
class DataNotFoundException implements Exception {
  /// Constructor
  const DataNotFoundException(this.message);

  /// Error message
  final String message;
}

/// Exceptions caused when calling sembast database
class SembastException implements Exception {
  /// Constructor
  const SembastException(this.message);

  /// Error message
  final String message;
}

/// Exceptions caused when firebase its wrong
class FirebaseException implements Exception {
  /// Constructor
  const FirebaseException(this.message);

  /// Error message
  final String message;
}

/// Exceptions caused when Geolocator its wrong
class GeolocatorException implements Exception {
  /// Constructor
  const GeolocatorException(this.message);

  /// Error message
  final String message;
}

/// Exceptions caused by user profile information incomplete
class ProfileIncompleteException implements Exception {
  /// Constructor
  const ProfileIncompleteException(this.message);

  /// Error message
  final String message;
}

/// Exceptions caused when there is not data found
class DataException implements Exception {
  /// Constructor
  const DataException(this.message);

  /// Error message
  final String message;
}

/// Exceptions caused by error in request
class ErrorInRequestException implements Exception {
  /// Constructor
  const ErrorInRequestException(this.message);

  /// Error message
  final String message;
}

/// Exceptions caused by only allowed numbers
class ErrorOnlyAllowedNumbersException implements Exception {
  /// Constructor
  const ErrorOnlyAllowedNumbersException(this.message);

  /// Error message
  final String message;
}

/// Exceptions caused by expired code
class ErrorExpiredCodeException implements Exception {
  /// Constructor
  const ErrorExpiredCodeException(this.message);

  /// Error message
  final String message;
}

/// Exceptions caused retry in seconds
class ErrorRetryInSecondsException implements Exception {
  /// Constructor
  const ErrorRetryInSecondsException(this.message);

  /// Error message
  final String message;
}
