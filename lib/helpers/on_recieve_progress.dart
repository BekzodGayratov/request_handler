import 'package:request_handler/request_handler.dart';

void main() async {
  await DioRequestHandler.get(
    url: "https://jsonplaceholder.typicode.com/userss",
  ).then((value) {});
}
