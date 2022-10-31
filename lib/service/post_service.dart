import 'package:dio/dio.dart';
import 'package:request_handler/config/dio_config.dart';

Future<Map<String, dynamic>> post(
    {required String url,
    required Map<String, dynamic> data,
    String? contentType,
    String? method,
    // Default time outs are 50 sekund
    int? defaultTimeOuts,
    Map<String, dynamic>? headers}) async {
  try {
    Response response =
        await DioConfig.createRequest(defaultTimeOuts: defaultTimeOuts).post(
      url,
      data: data,
      options: Options(
        headers: headers,
        contentType: contentType,
        method: method,
      ),
    );
    // Status code successful?
    switch (response.statusCode) {
      case 100:
        return {};
      default:
        return {};
    }
  } on DioError catch (e) {
    if (e.type == DioErrorType.connectTimeout ||
        e.type == DioErrorType.receiveTimeout ||
        e.type == DioErrorType.sendTimeout) {
      return {};
    } else {
      return {};
    }
  }
}
