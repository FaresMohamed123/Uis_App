import 'package:dio/dio.dart';
import 'package:uis_app/app_link.dart';

class LoginemployesServices {
  late Dio dio;

  LoginemployesServices() {
    BaseOptions options = BaseOptions(
      baseUrl:baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60), // 20 seconds
      receiveTimeout: const Duration(seconds: 60),
    );
    dio = Dio(options);
  }

  Future<dynamic> getUserInfo(String id, String pin) async {
    try {
      Response response = await dio.get("/Employee/LoginEmployee?nationalId=$id&Pin=$pin");
      if (response.statusCode == 200) {
  return response.data;
} else {
  throw Exception('Failed to LoginemployesServices${response.statusCode}');
}
    } catch (e) {
      throw Exception('Failed to LoginemployesServices${e.toString()}');
    }
  }
}
