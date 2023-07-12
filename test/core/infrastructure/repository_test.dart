import 'dart:convert';
import 'dart:io';

import 'package:base_app/core/infrastructure/remote_service/core_service.dart';
import 'package:base_app/core/shared/app_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'repository_test.mocks.dart';

String fixture(String name) => File('test/fixtures/$name').readAsStringSync();

@GenerateMocks([Dio])
void main() {
  late MockDio _dio;
  late AppConfig _appConfig;
  late CoreService coreService;

  /// Configured the mock services
  setUp(() {
    _dio = MockDio();
    _appConfig = AppConfig('dev', 'url-here');
    coreService = CoreService(_dio, _appConfig);
  });

  /// Request to fake endpoint with status successful
  void httpGetHeader({String? jsonFile, int? code = 200}) {
    when(_dio.getUri(any, options: anyNamed('options'))).thenAnswer(
      (_) async => Response(
        statusCode: code,
        requestOptions: RequestOptions(path: ''),
        data: jsonFile != null ? json.decode(fixture(jsonFile)) : null,
      ),
    );
  }

  /// Future implment with http request get
  void httpGetWithException(Exception exception) {
    when(_dio.getUri(any, options: anyNamed('options')))
        .thenAnswer((_) async => throw exception);
  }

  ///Test repository method getWebSites
  group('getWebSites', () {
    test('should return list of strings when there are websites', () async {
      httpGetHeader(jsonFile: 'websites_success.json');

      expect(
        await coreService.getWebSites(),
        isA<List<String>>(),
      );
    });
  });
}
