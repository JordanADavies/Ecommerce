import 'package:ecommerce/shared/http_client/http_client.dart';

class CategoriesApi {
  final HttpClient _client;

  CategoriesApi({HttpClient? client}) : _client = client ?? HttpClient();

  Future<List<String>?> fetchCategories() async {
    final response = await _client.get<List<dynamic>>(
        path: 'https://fakestoreapi.com/products/categories');
    if (response == null) return null;
    return List<String>.from(response);
  }
}
