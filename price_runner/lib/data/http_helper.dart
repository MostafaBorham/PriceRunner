import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:price_runner/data/product_model.dart';

class HttpHelper {
  static const _baseUrl =
      'https://1705745d-79fa-4da8-99da-416130387fee.mock.pstmn.io/';
  static const _getProductEndPoint = 'get_product';
  static Future<Product> getProduct() async {
    final response =
        await http.get(Uri.parse(_baseUrl + _getProductEndPoint), headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json;charset=UTF-8',
    });
    final productJson = json.decode(response.body);
    return Product.fromMap(productJson);
  }
}
