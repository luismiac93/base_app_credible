import 'package:dartz/dartz.dart';

import '/core/domain/user.dart';
import '/core/infrastructure/dto/user_dto.dart';
import '/core/infrastructure/remote_service/core_service.dart';
import '/core/shared/constanst/constants.dart';
import '/example/domain/common_failure.dart';
import '/example/infrastructure/global_exceptions.dart';

/// Core base repository
class CoreRepository {
  /// Constructor
  CoreRepository(this._coreService);

  ///Core services
  final CoreService _coreService;

  /// Returns a failure or the successful user register
  Future<Either<CommonFailure, User>> register(User user) async {
    try {
      final userDTO = await _coreService.register(UserDTO.fromDomain(user));

      /// returns the registered user
      return right(userDTO.toDomain());
    } on NoInternetConnectionException catch (e) {
      /// returns failure if there was internet connection problem
      return left(CommonFailure.noConnection(message: e.message));
    } on RestApiException catch (e) {
      /// returns failure caused by server exception
      return left(
        CommonFailure.server(
          code: e.errorCode ?? serverErrorCode,
          message: e.errorMessage ?? serverErrorMessage,
        ),
      );
    } on ErrorInRequestException catch (e) {
      /// returns failure if there was error in request
      return left(CommonFailure.data(message: e.message));
    }
  }

  /// Returns a failure or successful user login
  Future<Either<CommonFailure, User>> login(User user) async {
    try {
      final userDTO = await _coreService.login(UserDTO.fromDomain(user));

      /// returns logged on user
      return right(userDTO.toDomain());
    } on NoInternetConnectionException catch (e) {
      /// returns failure if there was internet connection problem
      return left(CommonFailure.noConnection(message: e.message));
    } on DataNotFoundException catch (e) {
      /// returns failure if there was internet connection problem
      return left(CommonFailure.data(message: e.message));
    } on RestApiException catch (e) {
      /// returns failure caused by server exception
      return left(
        CommonFailure.server(
          code: e.errorCode ?? serverErrorCode,
          message: e.errorMessage ?? serverErrorMessage,
        ),
      );
    } on ErrorInRequestException catch (e) {
      /// returns failure if there was error in request
      return left(CommonFailure.data(message: e.message));
    }
  }

  /// Returns a failure or successful websities
  Future<Either<CommonFailure, List<String>>> getWebSites() async {
    try {
      final webSities = await _coreService.getWebSites();

      /// returns websities list
      return right(webSities);
    } on NoInternetConnectionException catch (e) {
      /// returns failure if there was internet connection problem
      return left(CommonFailure.noConnection(message: e.message));
    } on DataNotFoundException catch (e) {
      /// returns failure if there was internet connection problem
      return left(CommonFailure.data(message: e.message));
    } on RestApiException catch (e) {
      /// returns failure caused by server exception
      return left(
        CommonFailure.server(
          code: e.errorCode ?? serverErrorCode,
          message: e.errorMessage ?? serverErrorMessage,
        ),
      );
    } on ErrorInRequestException catch (e) {
      /// returns failure if there was error in request
      return left(CommonFailure.data(message: e.message));
    }
  }
}
