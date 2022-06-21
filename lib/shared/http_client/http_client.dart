import 'package:dio/dio.dart';
import 'package:ecommerce/shared/exceptions/api_exception.dart';

class HttpClient {
  final Dio _client;

  HttpClient({Dio? client}) : _client = client ?? Dio();

  Future<T?> get<T>({required String path}) async {
    try {
      final response = await _client.get<T>(path);
      if (response.statusCode != 200) {
        throw ApiException(code: response.statusCode);
      }
      return response.data;
    } catch (e) {
      throw ApiException();
    }
  }

  Future<T?> post<T>({
    required String path,
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await _client.post<T>(
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
