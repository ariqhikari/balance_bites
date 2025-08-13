part of 'services.dart';

class ProductServices {
  static Future<ApiReturnValue<T>> fetchData<T>(
      {required String endpoint,
      Map<String, String>? queryParams,
      required T Function(dynamic) fromJson}) async {
    String? token = await getToken();
    if (token == null) {
      return ApiReturnValue(message: 'Not have token');
    }

    Uri url = Uri.parse('$baseURL/api/$endpoint')
        .replace(queryParameters: queryParams);

    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'token': token,
    });

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: data['body']['message']);
    }

    return ApiReturnValue(value: fromJson(data['body']['data']));
  }

  static Future<ApiReturnValue<List<Product>>> getListProduct({
    String? search,
    int page = 1,
  }) {
    return fetchData<List<Product>>(
      endpoint: 'products',
      queryParams: {
        'search': search?.isNotEmpty == true ? search! : '',
        'page': page.toString(),
      },
      fromJson: (data) =>
          (data as List).map((product) => Product.fromJson(product)).toList(),
    );
  }

  static Future<ApiReturnValue<Product>> getProductByUpc(String upc) {
    return fetchData<Product>(
      endpoint: 'product',
      queryParams: {'upc': upc},
      fromJson: (data) => Product.fromJson(data['product']),
    );
  }
}
