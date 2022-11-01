import 'package:dio/dio.dart';
import 'package:request_handler/config/dio_config.dart';

Future<dynamic> close(
    // Request parametrs
    {
  required bool force,

  // Default time outs are 59 sekund
  int? defaultTimeOuts,
}) async {
  try {
    DioConfig.createRequest(defaultTimeOuts: defaultTimeOuts).close(force: force);
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
