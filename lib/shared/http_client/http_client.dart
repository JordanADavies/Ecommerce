import 'package:dio/dio.dart';
import 'package:ecommerce/shared/exceptions/api_exception.dart';

class HttpClient {
  final Dio _client;

  HttpClient({Dio? client}) : _client = client ?? Dio();

  Future<Map<String, dynamic>?> post({
    required String path,
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await _client.post<Map<String, dynamic>>(
        path,
        data: body,
      );
      if (response.statusCode != 200) {
        throw ApiException(code: response.statusCode);
      }
      return response.data;
    } catch (_) {
      throw ApiException();
    }
  }
}
