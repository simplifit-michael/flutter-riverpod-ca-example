import 'package:dio/dio.dart';

class DioFactory {
  Dio build(String baseUrl) {
    final Dio dio = Dio();
    dio.options.baseUrl = baseUrl;
    return dio;
  }
}
