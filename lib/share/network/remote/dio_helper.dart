import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio dio;
//803c950feec64958b66674fcaeeff457
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: "https://newsapi.org",
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getDate({@required String path, @required Map<String, dynamic> query}) async{
    return await dio.get(
      path,
      queryParameters: query,
    );
  }
}
