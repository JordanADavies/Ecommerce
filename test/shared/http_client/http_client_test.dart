import 'package:dio/dio.dart';
import 'package:ecommerce/shared/exceptions/api_exception.dart';
import 'package:ecommerce/shared/http_client/http_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'http_client_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  group('Http Client - Post', () {
    test('returns response body on success', () async {
      final mockDio = MockDio();
      final httpClient = HttpClient(client: mockDio);

      when(mockDio.post(any, data: anyNamed('data'))).thenAnswer(
        (_) async => Response<Map<String, dynamic>>(
          statusCode: 200,
          data: {'key': 'value'},
          requestOptions: RequestOptions(path: 'test'),
        ),
      );

      final response = await httpClient.post(path: 'test');

      expect(response, {'key': 'value'});
    });

    test('returns api exception if client throws exception', () async {
      final mockDio = MockDio();
      final httpClient = HttpClient(client: mockDio);

      when(mockDio.post(any, data: anyNamed('data')))
          .thenThrow(Exception('Failed!'));

      final request = httpClient.post(path: 'test');

      expect(request, throwsA(isA<ApiException>()));
    });

    test('returns api exception if client returns status code 500', () async {
      final mockDio = MockDio();
      final httpClient = HttpClient(client: mockDio);

      when(mockDio.post(any, data: anyNamed('data'))).thenAnswer(
        (_) async => Response<Map<String, dynamic>>(
          statusCode: 500,
          data: {},
          requestOptions: RequestOptions(path: 'test'),
        ),
      );

      final request = httpClient.post(path: 'test');

      expect(request, throwsA(isA<ApiException>()));
    });
  });
}
