import 'package:flutter_api_with_getx/models/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class APIService {
  static var client = http.Client();

  static Future<List<Product>?> fetchProducts() async {
    var listOfProducts = [];
    var response = await client.get(Uri.parse(
        "http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var product = productFromJson(jsonString);
      return product;
    } else {
      Get.snackbar('', 'Successfully created',
          snackPosition: SnackPosition.BOTTOM);
      return null;
    }
    //return listOfProducts;
  }
}
