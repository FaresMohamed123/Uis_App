import 'package:dio/dio.dart';
import 'package:uis_app/data/model/get_user_details_model.dart';

class GetUserDetailServices {
  final baseUrl = "http://18.224.175.116/UISAttendanceMobile/api";
  late Dio dio;
  GetUserDetailServices(
    this.dio,
  );
  Future<GetUserDetailsModel> getUserDetails(String id) async {
    Response response = await dio.get("$baseUrl/Employee/FindHREmployee?nationalId=$id"); 
    if (response.statusCode == 200) {
      GetUserDetailsModel getUserDetailsModel =
          GetUserDetailsModel.fromJson(response.data);
      return getUserDetailsModel;
    } else {
      throw Exception('Failed to get user details');
    }
  }
}
