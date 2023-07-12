import 'dart:io';

import 'package:dio/dio.dart';

/// Dio Error Extension
extension DioErrorX on DioException {
  /// Check if there is internet connection
  bool get isNoConnectionError {
    return type == DioExceptionType.unknown && error is SocketException;
  }
}
