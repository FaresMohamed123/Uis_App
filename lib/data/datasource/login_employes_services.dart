import 'package:dio/dio.dart';
import 'package:uis_app/app_link.dart';
import 'package:uis_app/data/model/login_employes_model.dart';

class LoginEmployesServices {
  late Dio dio;
  LoginEmployesServices(
    this.dio,
  );
  Future<LoginEmployesModel> getUserDetails() async {
    Response response = await dio.get(AppLink.Login);
    if (response.statusCode == 200) {
      LoginEmployesModel loginEmployesModel =
          LoginEmployesModel.fromJson(response.data);
      return loginEmployesModel;
    } else {
      throw Exception('Failed to get user details');
    }
  }
}
