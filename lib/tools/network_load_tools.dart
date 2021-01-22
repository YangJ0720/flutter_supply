import 'package:dio/dio.dart';
import 'package:supply/config/base_config.dart';

///
class NetworkLoadTools {
  ///
  static Future<String> load(String url) async {
    Response response = await Dio().get(url);
    if (response.statusCode == BaseConfig.CODE_200) {
      return response.data;
    }
    return null;
  }
}