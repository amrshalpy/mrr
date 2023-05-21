import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:azaiim/cubit/Home_state.dart';
import 'package:azaiim/model/add_carts.dart';
import 'package:azaiim/model/category_model.dart';
import 'package:azaiim/model/category_product.dart';
import 'package:azaiim/model/cerate_order.dart';
import 'package:azaiim/model/clear_carts.dart';
import 'package:azaiim/model/get_cart.dart';
import 'package:azaiim/model/get_carts.dart';
import 'package:azaiim/model/product_model.dart';
import 'package:azaiim/model/update_cart.dart';
import 'package:azaiim/moduel/cart/cart.dart';
import 'package:azaiim/moduel/category/category.dart';
import 'package:azaiim/moduel/feeds/feeds.dart';
import 'package:azaiim/moduel/search/search.dart';
import 'package:azaiim/moduel/web_view/web_view%20copy.dart';
import 'package:azaiim/moduel/web_view/web_view.dart';
import 'package:azaiim/share/dio_helper.dart';
import 'package:azaiim/share/dio_helper2.dart';
import 'package:woocommerce_api/woocommerce_api.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialState());
  static HomeCubit get(context) => BlocProvider.of(context);

  int index = 0;
  void changeIndex(pIndex) {
    pIndex = index;
    emit(ChangeIndexs());
  }

  String? phone;
  void getPhoneIndex(phoneIndex) {
    phone = phoneIndex;
    emit(ChangePhoneIndexs());
  }

  List<String> phones = [
    "92200099",
    "90038444",
    "60304031",
    "90038555",
  ];

  List<Widget> screens = [
    Feeds(),
    Categoryies(),
    Search(),
    Carts(),
  ];

  List<CategoryModel> categories = [];
  void getCategory() {
    emit(GetCategoryLoading());
    CategoryServices.getCategory().then((value) {
      categories.addAll(value);
      emit(GetCategorySucssess());
    }).catchError((er) {
      emit(GetCategoryError());

      print(er.toString());
    });
  }

  List<ProductModel> productSearch = [];

  void searchProducts(String? searchName) {
    emit(GetProductsLoading());
    searchName = searchName!.toLowerCase();

    productsCategory = products.where((search) {
      var searchTitle = search.name.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();

      return searchTitle.contains(searchName!) ||
          searchPrice.toString().contains(searchName);
    }).toList();
    print(productsCategory[0].name);
    emit(GetProductsSucssess());
  }

  List<ProductModel> productsCategory = [];

  List<ProductModel>? proCategory = [];
  void getProductsCategory(id) {
    emit(GetProductsLoading());
    proCategory = [];
    CategoryServices.getProductCategory(id: id).then((value) {
      proCategory!.addAll(value);
      emit(GetProductsSucssess());
    }).catchError((er) {
      emit(GetProductsError());

      print(er.toString());
    });
  }

  List<ProductModel> products = [];
  void getProducts({int? id}) {
    emit(GetProductsLoading());
    CategoryServices.getProduct(id: id).then((value) {
      products.addAll(value);
      emit(GetProductsSucssess());
    }).catchError((er) {
      emit(GetProductsError());

      print(er.toString());
    });
  }

  List<ProductModel> productsSales = [];
  void getProductSales() {
    emit(GetProductsLoading());
    productsSales = [];
    CategoryServices.getProductSale().then((value) {
      productsSales.addAll(value);
      print(value.length);
      emit(GetProductsSucssess());
    }).catchError((er) {
      emit(GetProductsError());

      print(er.toString());
    });
  }

  void removeCARt(id) {
    getCART!.data!.removeWhere((element) => element.productId == id);
    emit(GetProductsError());
  }

  int? productIdss;
  ADDTOCart? addToCart;
  void AddTOCartss({
    dynamic productId,
    int? quantity,
  }) {
    emit(CreateNewOrderLoading());

    DioHelper.postData(
        path: 'https://azaiim.com/wp-json/wc/v3/addtocart',
        data: {
          // "user_id": 8,
          "products": [
            {"product_id": productId, "quantity": quantity, "variation_id": 0},
          ]
        }).then((value) {
      addToCart = ADDTOCart.fromJson(value.data);

      emit(CreateNewOrderSucssess());
    }).catchError((er) {
      print(er.toString());
    });
  }

  int? quantityIndex;
  void changeQauntity(index) {
    quantityIndex = index;
    print(quantityIndex);
    emit(ChangeIndexs());
  }

  double totalCartPrice = 0;
  GETCart? getCART;
  void gETCArts() {
    emit(GetCartsLoading());
    DioHelper.getData(path: 'https://azaiim.com/wp-json/wc/v3/cart', query: {})
        .then((value) {
      getCART = GETCart.fromJson(value.data);
      for (var item in getCART!.data!) {
        totalCartPrice += item.lineTotal!;
      }
      print(getCART!.data!.length);
      emit(GetCartsSucssess());
    }).catchError((er) {
      print(er.toString());
      emit(GetCartsError());
    });
  }

  // void increaseCarts(DataCarts item) {
  //   AddTOCartss(quantity: item.qty! + 1.t);
  //   gETCArts();
  //   emit(InCrease());
  // }

  void decreaseCarts(DataCarts item) {
    // if (item.qty! > 1) {
    item.qty = item.qty! - 1;
    // }
    gETCArts();
    emit(Decreas());
  }

  Future<String> login({String? username, String? password}) async {
    final response = await http.post(
      Uri.parse('https://azaiim.com/wp-json/jwt-auth/v1/token'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': 'amr88@gmail.com',
        'password': '12345678',
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data['token']);
      return data['token'];
    } else {
      throw Exception('Failed to do login.');
    }
  }

  GetCarts? getCarts;

//================================================
// =================================================
//=====================================================
// ==================================================
// ================================================
//==================== carts========================
  CreatOrder? creatOrder;
  void createOrder() {
    emit(CreateNewOrderLoading());
    DioHelper.postData(
        path:
            'https://azaiim.com/wp-json/wc/v3/orders?status=pending&consumer_key=$consumerKey&consumer_secret=$consumerSecret',
        data: {
          {
            "line_items": [
              {"product_id": 5508, "quantity": 2}
            ]
          }
        }).then((value) {
      creatOrder = CreatOrder.fromJson(value.data);
      emit(CreateNewOrderSucssess());
    }).catchError((er) {
      print(er.toString());
    });
  }

  Future<CreatOrder> createOrderWOO({dynamic request}) async {
    late CreatOrder orders;

    final url = Uri.parse(
      'https://azaiim.com/wp-json/wc/v3/orders?consumer_key=$consumerKey&consumer_secret=$consumerSecret',
    );
    final client = http.Client();
    var response = await client.post(url,
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          // 'Authorization': 'Bearer $token',
        },
        body: jsonEncode(request));
    print(url);
    print(request);

    print(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('update orders success');

      var responseData = json.decode(response.body);

      if (responseData != null) {
        print('get orders success');

        orders = CreatOrder.fromJson(json.decode(response.body));
        print(orders);
        return orders;
      } else {
        print('orders data null');
        return throw Exception('orders Data Null');
      }
    } else if (response.statusCode == 400) {
      var error = CreatOrder.fromJson(jsonDecode(response.body));

      throw Exception(error);
    } else {
      print('orders cart field');

      var error = CreatOrder.fromJson(jsonDecode(response.body));
      throw Exception(error);
    }
    // final order = OrderModel.fromJson(json.decode(response.body));
    // return order;
  }

  // late AddToCart cartData;
  // Future<AddToCart> addToCartWoo(
  //     {String? productId, String? quantity, String? cartKey}) async {
  //   // print(cartKey);
  //   final client = http.Client();
  //   final uri = Uri.parse(
  //       'https://azaiim.com/wp-json/cocart/v2/cart/add-item?cart_key=$cartKey');

  //   var response = await client.post(uri, headers: {
  //     // 'Authorization': 'Bearer $token',
  //   }, body: {
  //     "id": '5508',
  //     "quantity": '1'
  //   });

  //   if (response.statusCode >= 200 && response.statusCode < 300) {
  //     print('add to cart success');

  //     var responseData = json.decode(response.body);

  //     if (responseData != null) {
  //       print('get cart success');
  //       print(responseData['item_count']);
  //       cartData = AddToCart.fromJson(responseData);

  //       return cartData;
  //     } else {
  //       print('cart data null');
  //       return throw Exception('Cart Data Null');
  //     }
  //   } else {
  //     print('add to cart field');
  //     throw Exception('Add to Cart Field');
  //   }
  // }

  Future<void> completeCheckout({List<dynamic>? products}) async {
    final url =
        'https://azaiim.com/wp-json/wc/v3/orders?consumer_key=ck_831384961c2e6183a074f9f7c01da34f4ac44727&consumer_secret=cs_6483b8646033306de805cf15b14f0525bc6552c9';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'line_items': products!
            .map((product) => {
                  'product_id': '5503',
                  'quantity': '1',
                })
            .toList(),
        'payment_method': 'bacs',
        'payment_method_title': 'Direct Bank Transfer',
        'status': 'processing',
      }),
    );

    if (response.statusCode == 201) {
      print('Order created successfully!');
      emit(CreateNewOrderSucssess());
    } else {
      print('Failed to create order.');
    }
  }

  // GetCarts? getCartData;
  // Future<GetCarts> getCart({String? cartKey}) async {
  //   print(cartKey);
  //   final client = http.Client();
  //   final uri = Uri.parse(
  //       'https://azaiim.com/wp-json/cocart/v2/cart?cart_key=$cartKey');

  //   var response = await client.get(uri, headers: {
  //     'Content-Type': 'application/json',
  //     // 'Authorization': 'Bearer $token',
  //   });

  //   if (response.statusCode >= 200 && response.statusCode < 300) {
  //     var responseData = json.decode(response.body);

  //     if (responseData != null) {
  //       print('get cart success');

  //       getCartData = GetCarts.fromJson(responseData);
  //       print(getCartData!.cartHash);
  //       return getCartData!;
  //     } else {
  //       print('cart data null');
  //       return throw Exception('Cart Data Null');
  //     }
  //   } else {
  //     print('get cart field');
  //     throw Exception('Get Cart Field');
  //   }
  // }

//////////////////////////////////////////
////////////////////////
////////////////////////////////
///////////////////////////////
  ///=========  end carts =======================>

  String? order;
  Future<void> createOrders() async {
    // final customerData = {
    //   'first_name': 'John',
    //   'last_name': 'Doe',
    //   'email': 'john.doe@example.com',
    //   'phone': '555-555-5555',
    //   'address_1': '123 Main St',
    //   'address_2': 'Apt 1',
    //   'city': 'Anytown',
    //   'state': 'NY',
    //   'postcode': '12345',
    //   'country': 'US',
    // };

    final productData = [
      {
        'product_id': 5506, // Replace with your product ID
        'quantity': 1,
      },
      {
        'product_id': 5508, // Replace with your product ID
        'quantity': 1,
      },
      {
        'product_id': 5507, // Replace with your product ID
        'quantity': 1,
      },
    ];

    final orderData = {
      // 'customer_id': 0,
      // 'payment_method': 'bacs',
      // 'payment_method_title': 'Bank Transfer',
      // 'set_paid': true,
      // 'billing': customerData,
      // 'shipping': customerData,
      'line_items': productData,
    };

    final headers = {
      'Authorization':
          'Basic ' + base64Encode(utf8.encode('$consumerKey:$consumerSecret')),
      'Content-Type': 'application/json',
    };

    final response = await http.post(
        Uri.parse('https://azaiim.com/wp-json/wc/v3/orders?status=pending'),
        headers: headers,
        body: jsonEncode(orderData));

    if (response.statusCode == 201) {
      final responseBody = jsonDecode(response.body);
      emit(CreateNewOrderSucssess());
      order = responseBody['payment_url'];
      print(order);
    } else {
      print('Failed to create order. Error: ${response.reasonPhrase}');
    }
  }

  final api = new WooCommerceAPI(
    url: "https://azaiim.com",
    consumerKey: consumerKey,
    consumerSecret: consumerSecret,
  );
  addToMyCart(String productId, int quantity) async {
    final response = await api.postAsync(
      "cart/add",
      {
        "product_id": "5508",
        "quantity": 1,
      },
    );
    print(response);
    return response;
  }

  void getCartss() {
    emit(GetCartsLoading());
    DioHelper.getData(
      path:
          'https://azaiim.com/wp-json/cocart/v2/cart?consumer_key=ck_831384961c2e6183a074f9f7c01da34f4ac44727&consumer_secret=cs_6483b8646033306de805cf15b14f0525bc6552c9',
    ).then((value) {
      // print(value.data);
      getCarts = GetCarts.fromJson(value.data);

      emit(GetCartsSucssess());
    }).catchError((er) {
      print(er.toString());
      emit(GetCartsError());
    });
  }

  Future<void> register(
      {String? email,
      String? password,
      String? firstName,
      String? lastName}) async {
    final data = {
      'email': 'amr3@gmail.com',
      'password': "password",
      'first_name': "firstName",
      'last_name': "lastName",
    };
    api.postAsync('register', data).then((value) {
      print(value);
      emit(RegisterSucssess());
    }).catchError((er) {
      print(er.toString());
      emit(RegisterError());
    });
  }

  // Future<void> login({String? email, String? password}) async {
  //   final loginData = {
  //     'email': 'amr@gmail.com',
  //     'password': '12345678',
  //   };

  //   final response =
  //       await api.postAsync('wp-json/jwt-auth/v1/token', loginData);

  //   if (response.hashCode == 200) {
  //     // Login successful
  //     final token = response.data['token'];
  //     // Store the token for future API requests
  //     print(token);
  //   } else {
  //     // Login failed
  //     final error = response['message'];
  //     print(error);
  //     // Show error message to user
  //   }
  // }

  UpdateCarts? updateCarts;
  void updateCart({
    String? id,
    String? quantity,
  }) {
    emit(UpdateCartsLoading());
    DioHelper.postData(
        path:
            'https://azaiim.com//wp-json/cocart/v2/cart/item/$id?consumer_key=ck_831384961c2e6183a074f9f7c01da34f4ac44727&consumer_secret=cs_6483b8646033306de805cf15b14f0525bc6552c9',
        data: {'quantity': quantity}).then((value) {
      updateCarts = UpdateCarts.fromJson(value.data);
      getCartss();
      emit(UpdateCartsSucssess());
    }).catchError((er) {
      emit(UpdateCartsError());
      print(er.toString());
    });
  }

  ClearCarts? clearCarts;
  void clearCart({
    String? id,
    String? quantity,
  }) {
    emit(ClearAllCartsLoading());
    DioHelper.postData(
        path:
            'https://azaiim.com/wp-json/cocart/v2/cart/clear?consumer_key=ck_831384961c2e6183a074f9f7c01da34f4ac44727&consumer_secret=cs_6483b8646033306de805cf15b14f0525bc6552c9',
        data: {}).then((value) {
      clearCarts = ClearCarts.fromJson(value.data);
      getCartss();
      emit(ClearAllCartsSucssess());
    }).catchError((er) {
      emit(ClearAllCartsError());
      print(er.toString());
    });
  }

  void clearItem({String? id}) {
    emit(ClearCartsLoading());
    DioHelper.deleteData(
            path:
                'https://azaiim.com/wp-json/cocart/v2/cart/item/$id?consumer_key=ck_831384961c2e6183a074f9f7c01da34f4ac44727&consumer_secret=cs_6483b8646033306de805cf15b14f0525bc6552c9')
        .then((value) {
      clearCarts = ClearCarts.fromJson(value.data);
      getCartss();
      emit(ClearCartsSucssess());
    }).catchError((er) {
      emit(ClearCartsError());
    });
  }

///////////////////////////////////
//////////////////////////////////////
//////////////////////////////////////
  ///===============================
  ///=================================
  ///=============================
  double prices = 0;
  double totalPrices = 0;
  // void increese(ProductModel product) {

  //   quantity++;
  //   // prices = double.parse(product.price) * quantity;
  //   totalPrices += prices;
  //   emit(InCrease());
  // }

  // void decreese(ProductModel product) {
  //   if (quantity > 1) {
  //     quantity--;
  //     prices = double.parse(product.price) * quantity;
  //     totalPrices += prices;
  //   }
  //   emit(InCrease());
  // }

  var cartMap = {};
  List<int> productIds = [];
  int? productId;
  void addCarts(ProductModel productModel) {
    emit(AddCartssLoading());
    productId = productModel.id;
    if (cartMap.containsKey(productModel)) {
      cartMap[productModel] += 1;
      print(productId);
      emit(AddCartssSucsses());
    } else {
      cartMap[productModel] = 1;
      emit(AddCartssSucsses());
    }
  }

  void addCartsCategory(Products productModel) {
    productId = productModel.id;
    if (cartMap.containsKey(productModel)) {
      cartMap[productModel] += 1;
      // print(productId);
      emit(AddCartssSucsses());
    } else {
      cartMap[productModel] = 1;
      emit(AddCartssSucsses());
    }
  }

  void removeCart(ProductModel productModel) {
    if (cartMap.containsKey(productModel) && cartMap[productModel] == 1) {
      cartMap.removeWhere((key, value) => key == productModel);
      emit(RemoveCartsSucsses());
    } else {
      cartMap[productModel] -= 1;
      emit(RemoveCartsSucsses());
    }
  }

  void removeOneProduct(ProductModel productModel) {
    cartMap.removeWhere((key, value) => key == productModel);
    emit(RemoveCartsSucsses());
  }

  get totalPrice => cartMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element);

  get price => cartMap.entries.map((e) => e.key.price * e.value).toList();

  List<ProductModel> listFavorite = [];
  void manageFavorite(id) {
    listFavorite.add(products.firstWhere((element) => element.id == id));
  }

  bool inFavorites(id) {
    return listFavorite.any((element) => element.id == id);
  }

  var cartLists = {};

  void getCartsx(ProductModel productModel) {
    if (cartLists.containsKey(productModel)) {
      cartLists[productModel] += 1;
    } else {
      cartLists[productModel] = 1;
    }
  }

  void removeCarts(ProductModel productModel) {
    if (cartLists.containsKey(productModel) && cartLists[productModel] == 1) {
      cartLists.removeWhere((key, value) => key == productModel);
    } else {
      cartLists[productModel] -= 1;
    }
  }

  void removeOneCarts(ProductModel productModel) {
    cartLists.removeWhere((key, value) => key == productModel);
  }

  get priceCount =>
      cartLists.entries.map((e) => e.value * e.key.price).toList();
  get totalPriceCount => cartLists.entries
      .map((e) => e.value * e.key.price)
      .toList()
      .reduce((value, element) => value + element);

  int count() {
    return cartLists.entries
        .map((e) => e.value)
        .toList()
        .reduce((value, element) => value + element);
  }

  void removeCartss(GetCarts? carts) {
    carts!.items!.removeAt(index);
    getCartss();
    emit(RemoveCartsSucsses());
  }

  int quantity = 1;

  double pricex = 0;
  void inCrease(ItemsCarts item) {
    item.quantity!.value++;
    item.totals!.subtotal =
        '${double.parse(item.price!) * item.quantity!.value}';
    getCartss();
    emit(InCrease());
  }

  void deCrease(ItemsCarts item) {
    if (item.quantity!.value > 1) {
      item.quantity!.value--;
      item.totals!.subtotal =
          '${double.parse(item.price!) * item.quantity!.value}';
      getCartss();
      emit(Decreas());
    }
  }
}
