import 'package:dio/dio.dart';

import '/core/shared/constanst/constants.dart';
import '/example/infrastructure/global_exceptions.dart';
import '/example/infrastructure/dio_extension.dart';
import '/core/shared/app_config.dart';
import '/example/infrastructure/dtos/character_dto.dart';

/// Method service called throughout the application
class ExampleService {
  /// Default Constructor
  ExampleService(this._dio, this._appConfig);

  final Dio _dio;
  final AppConfig _appConfig;

  /// Method of calling the list of character
  Future<List<CharacterDTO>> getCharacters() async {
    try {
      final requestUri = Uri.https(
        _appConfig.baseUrl,
        '/api/character',
      );

      final response = await _dio.getUri(requestUri);

      if (response.statusCode == 200) {
        //only enable for apis that handle internal response codes
        // if (response.data['code'] == 100) {
        final result = response.data['results'];

        final characterList = <CharacterDTO>[];

        for (final item in result) {
          characterList.add(CharacterDTO.fromJson(item));
        }

        /// return character list
        return characterList;
        //only enable for apis that handle internal response codes
        // } else if (response.data['code'] == 104) {
        //   /// the method does not return a message
        //   throw DataNotFoundException(
        //     'Error ${response.data['code']}, ${response.data['message']}',
        //   );
        // } else if (response.data['code'] == 105) {
        //   throw ErrorInRequestException(response.data['message'] as String);
        // } else {
        //   /// the method does not return a message
        //   throw const DataNotFoundException(dataNotFoundMessage);
        // }
      } else {
        /// Throws Exception when status code is not 200
        throw RestApiException(
          errorCode: response.statusCode,
          errorMessage: response.statusMessage,
        );
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        /// Throws exception caused by internet connection problem
        throw const NoInternetConnectionException(noInternetConnectionMessage);
      } else if (e.response != null) {
        /// Throws Exception when something went wrong in the call
        throw RestApiException(
          errorCode: e.response?.statusCode,
          errorMessage: e.response?.statusMessage,
        );
      } else {
        throw RestApiException(
          errorCode: e.response?.statusCode,
          errorMessage: dioErrorMessage,
        );
      }
    }
  }
}
