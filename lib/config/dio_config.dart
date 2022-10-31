import 'package:dio/dio.dart';

class DioConfig {
  static Dio createRequest({
    int? defaultTimeOuts,
  }) {
    Dio dio = Dio(BaseOptions(
      receiveDataWhenStatusError: true,
    ));

    // TIME OUT

    dio.options.connectTimeout = defaultTimeOuts ?? 59 * 1000;
    dio.options.receiveTimeout = defaultTimeOuts ?? 59 * 1000;
    dio.options.sendTimeout = defaultTimeOuts ?? 59 * 1000;

    return dio;
  }
}
