import 'package:uis_app/features/feature/data/model/login_employes_model.dart';
import 'package:uis_app/features/feature/data/services/loginEmployes_services.dart';

class LoginEmployesRepositories {
  LoginemployesServices loginemployesServices;
  LoginEmployesRepositories( this.loginemployesServices);

  Future<LoginEmployesModel> getUserInfo(String id,  String pin) async {
    final response = await loginemployesServices.getUserInfo(id,pin);
    return LoginEmployesModel.fromJson(response);
  }
}
