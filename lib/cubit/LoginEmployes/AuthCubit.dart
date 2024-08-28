import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:uis_app/app_link.dart';
import 'package:uis_app/cubit/LoginEmployes/AuthState.dart';
import 'package:uis_app/data/model/login_employes_model.dart';

class AuthCubit extends Cubit<AuthState> {
  late Dio dio;

  AuthCubit(this.dio) : super(AuthInitial());

  Future login(String id, String pin) async {
    emit(AuthLoading());

    try {
      final response = await dio
          .get("$baseUrl/Employee/LoginEmployee?nationalId=$id&Pin=$pin");
      LoginEmployesModel loginEmployesModel =
          LoginEmployesModel.fromJson(response.data);
      emit(AuthSuccess(loginEmployesModel: loginEmployesModel));
    } catch (e) {
      emit(AuthFailure('An error occurred: $e'));
    }
  }
}
