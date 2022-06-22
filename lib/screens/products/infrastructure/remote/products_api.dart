import 'package:ecommerce/shared/http_client/http_client.dart';

class ProductsApi {
  final HttpClient _client;

  ProductsApi({HttpClient? client}) : _client = client ?? HttpClient();

  Future<List<Map<String, dynamic>>?> fetchProducts({
    required String category,
  }) async {
    final response = await _client.get<List<dynamic>>(
        path: 'https://fakestoreapi.com/products/category/$category');
    if (response == null) return null;
    return response
        .map((element) => Map<String, dynamic>.from(element))
        .toList();
  }
}
