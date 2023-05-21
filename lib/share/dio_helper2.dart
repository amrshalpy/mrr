import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:azaiim/componant/const.dart';
    final consumerKey = 'ck_b391b19778e03ae4f6f54663e04afc39aaa4a839';
  final consumerSecret = 'cs_01c0c72fe78796334173fc0bc410392ca19b8481';

class DioHelper {
  static late Dio dio;

  static init() async {
    dio = Dio(
      BaseOptions(
        connectTimeout: Duration(seconds: 60), // 60 seconds
        receiveTimeout: Duration(seconds: 60),
        
        baseUrl: kBaseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  // post
  static Future<Response> postData({
    required String path,
    String? token,
    required dynamic data,
    // Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      // "Accept": "application/json",
      // "Authorization": 'Basic ' +
      //     base64Encode(utf8.encode('$consumerKey:$consumerSecret')),
    

      'Content-Type': 'application/json',
                // "cache-control": "no-cache",
                // "cookie":"cookie value will goes here"
    };
    return await dio.post(
      path,
      data: data,
      //  queryParameters: data
    );
  }

  //get
  static Future<Response> getData({
    required String path,
    String? token,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      // "Accept": "application/json",
      // "Authorization": "Bearer $token",
      // "secretKey": "tgCiGblcr1daxYxx3Lw8uw==",
      "Content-Type": "application/json",
                "cache-control": "no-cache",
                "cookie":"cookie value will goes here"
    };

    return await dio.get(path, queryParameters: query);
  }

  //put
  static Future<Response> putData({
    String? path,
    String? token,
    dynamic data,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      "Accept": "application/json",
      // "secretKey": "tgCiGblcr1daxYxx3Lw8uw==",
      "Authorization": "Bearer $token",
    };
    return await dio.put(path!, data: data, queryParameters: query);
  }

  static Future<Response> patchData({
    String? path,
    String? token,
    dynamic data,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      "Accept": "application/json",
      // "secretKey": "tgCiGblcr1daxYxx3Lw8uw==",
      "Authorization": "Bearer $token",
    };
    return await dio.patch(path!, data: data, queryParameters: query);
  }

  //delete
  static Future<Response> deleteData({
    String? path,
    String? token,
    dynamic data,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      "Accept": "application/json",
      // "secretKey": "tgCiGblcr1daxYxx3Lw8uw==",
      "Authorization": "Bearer $token",
    };
    return await dio.delete(path!, data: data, queryParameters: query);
  }
}
