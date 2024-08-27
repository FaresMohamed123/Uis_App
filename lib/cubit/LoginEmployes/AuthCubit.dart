// ignore_for_file: unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:uis_app/cubit/LoginEmployes/AuthState.dart';
import 'package:uis_app/data/model/login_employes_model.dart';

class AuthCubit extends Cubit<AuthState> {
  final baseUrl = "http://18.224.175.116/UISAttendanceMobile/api";
  late Dio dio;

  AuthCubit(this.dio) : super(AuthInitial());

  Future login(String id, String pin) async {
    emit(AuthLoading());

    try {
      final response = await dio
          .get("$baseUrl/Employee/LoginEmployee?nationalId=$id&Pin=$pin");
      // ignore: use_build_context_synchronously
      LoginEmployesModel loginEmployesModel = LoginEmployesModel.fromJson(response.data);
        
      // ignore: avoid_print
      print(response.data);
      emit(AuthSuccess(loginEmployesModel: loginEmployesModel));
    } catch (e) {
      emit(AuthFailure('An error occurred: $e'));
    }
  }
}
