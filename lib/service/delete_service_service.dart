import 'package:dio/dio.dart';
import 'package:request_handler/config/dio_config.dart';

Future<dynamic> delete(
    // Request parametrs
    {
  required String url,
  required Map<String, dynamic> data,
  Options? options,
  Map<String, dynamic>? queryParametrs,
  CancelToken? cancelToken,
  // Default time outs are 59 sekund
  int? defaultTimeOuts,
}) async {
  try {
    Response response =
        await DioConfig.createRequest(defaultTimeOuts: defaultTimeOuts).delete(
            queryParameters: queryParametrs,
            cancelToken: cancelToken,
            url,
            data: data,
            options: options);

    // Status code successful?

  } on DioError catch (e) {
    if (e.type == DioErrorType.connectTimeout ||
        e.type == DioErrorType.receiveTimeout ||
        e.type == DioErrorType.sendTimeout) {
      return "Server time out error";
    } else {
      return "No internet connection";
    }
  }
}

