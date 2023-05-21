import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:azaiim/model/category_model.dart';
import 'package:azaiim/model/category_product.dart';
import 'package:azaiim/model/product_model.dart';
import 'package:azaiim/model/sales_product.dart';

class CategoryServices {
  static Future<List<CategoryModel>> getCategory() async {
    var response =
        await http.get(Uri.parse('https://azaiim.com/wp-json/wc/v3/products/categories?consumer_key=ck_831384961c2e6183a074f9f7c01da34f4ac44727&consumer_secret=cs_6483b8646033306de805cf15b14f0525bc6552c9'));
    if (response.statusCode == 200) {
      var jsonCode = response.body;
      return categoryModelFromJson(jsonCode);
    } else {
      return throw Exception('failed');
    }
  }

  static Future<List<ProductModel>> getProduct({id}) async {
    var response =
        await http.get(Uri.parse('https://azaiim.com/wp-json/wc/v3/products?consumer_key=ck_831384961c2e6183a074f9f7c01da34f4ac44727&consumer_secret=cs_6483b8646033306de805cf15b14f0525bc6552c9'));
    if (response.statusCode == 200) {
      var jsonCode = response.body;
      return productModelFromJson(jsonCode);
    } else {
      return throw Exception('failed');
    }
  }
 
  static Future<List<ProductModel>> getProductCategory({id}) async {
    var response =
        await http.get(Uri.parse('https://azaiim.com//wp-json/wc/v2/products/?category=$id&consumer_key=ck_831384961c2e6183a074f9f7c01da34f4ac44727&consumer_secret=cs_6483b8646033306de805cf15b14f0525bc6552c9'));
    if (response.statusCode == 200) {
      var jsonCode = response.body;
      return productModelFromJson(jsonCode);
    } else {
      return throw Exception('failed');
    }
  }
 
  static Future<List<ProductModel>> getProductSale() async {
    var response =
        await http.get(Uri.parse('https://azaiim.com/wp-json/wc/v2/products?consumer_key=ck_831384961c2e6183a074f9f7c01da34f4ac44727&consumer_secret=cs_6483b8646033306de805cf15b14f0525bc6552c9&per_page=100&page=1&on_sale=true'));
    if (response.statusCode == 200) {
      var jsonCode = response.body;
      return productModelFromJson(jsonCode);
    } else {
      return throw Exception('failed');
    }
  }

  // static Future<CategoryProductModel> getProductCategotry(id) async {
  //   var response =
  //       await http.get(Uri.parse('https://azaiim.com/wc-api/v1/products?filter[category]=${id}&consumer_key=ck_831384961c2e6183a074f9f7c01da34f4ac44727&consumer_secret=cs_6483b8646033306de805cf15b14f0525bc6552c9'));
  //   if (response.statusCode == 200) {
  //     var jsonCode = response.body;
  //     return categoryProductModelFromJson(jsonCode);
  //   } else {
  //     return throw Exception('failed');
  //   }
  // }

 static Future<void> addToCart(int productId, int quantity) async {
  final url = Uri.parse('https://azaiim.com/wp-json/wc/v3/cart/add');
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: {
      'product_id': '$productId',
      'quantity': '$quantity',
    },
  );

  if (response.statusCode == 200) {
    // تم إضافة العنصر بنجاح
  } else {
    // حدث خطأ أثناء إضافة العنصر إلى سلة التسوق
  }
}
}
