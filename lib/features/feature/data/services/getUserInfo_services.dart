import 'package:dio/dio.dart';
import 'package:uis_app/app_link.dart';
import 'package:uis_app/features/feature/data/model/get_user_details_model.dart';

class GetUserDetailServices {
  late Dio dio;
  GetUserDetailServices(
    this.dio,
  );
  Future<GetUserDetailsModel> getUserDetails(String id) async {
    try {
  Response response =
      await dio.get("$baseUrl/Employee/FindHREmployee?nationalId=$id");
  if (response.statusCode == 200) {
    return GetUserDetailsModel.fromJson(response.data);
  } else {
    throw Exception('Failed to get user details${response.statusCode}');
  }
}  catch (e) {
 throw Exception('Failed to get user details${e.toString()}');
}
  }
}
