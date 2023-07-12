import 'package:dartz/dartz.dart';

import '/example/domain/character.dart';
import '/example/domain/common_failure.dart';
import '/core/shared/constanst/constants.dart';
import '/example/infrastructure/global_exceptions.dart';
import '/example/infrastructure/remote_service/extensions.dart';
import '/example/infrastructure/remote_service/example_service.dart';

/// Base parameterization repository
class ExampleRepository {
  /// Constructor
  ExampleRepository(this._exampleService);

  ///Example services
  final ExampleService _exampleService;

  /// Returns a failure or the list of Character
  Future<Either<CommonFailure, List<Character>>> getCharacters() async {
    try {
      final charactersDTO = await _exampleService.getCharacters();

      /// returns list of Character
      return right(charactersDTO.characterListToDomain());
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
}
