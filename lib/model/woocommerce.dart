import 'dart:convert';
import 'package:http/http.dart' as http;

class WooCommerceAPI {
  // String consumerKey='ck_831384961c2e6183a074f9f7c01da34f4ac44727';
  static const baseUrl = "https://azaiim.com/wp-json/wc/v3";
  static const consumerKey = 'ck_831384961c2e6183a074f9f7c01da34f4ac44727';
  static const consumerSecret = "cs_6483b8646033306de805cf15b14f0525bc6552c9";

  Future<dynamic> get(String endpoint) async {
    var url = Uri.parse("$baseUrl/$endpoint");
    var response = await http.get(url, headers: {
      "Authorization": "Basic " + base64Encode(utf8.encode("$consumerKey:$consumerSecret"))
    });
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load data from WooCommerce API");
    }
  }

  Future<dynamic> post(String endpoint, Map<String, dynamic> data) async {
    var url = Uri.parse("$baseUrl/$endpoint");
    var response = await http.post(url, headers: {
      "Authorization": "Basic " + base64Encode(utf8.encode("$consumerKey:$consumerSecret")),
      "Content-Type": "application/json"
    }, body: jsonEncode(data));
    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to add item to cart");
    }
  }
}
