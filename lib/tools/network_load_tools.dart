import 'package:dio/dio.dart';

///
class NetworkLoadTools {
  ///
  Future<String> load(String url) async {
    Response response = await Dio().get(url);
    return response.data;
  }
}