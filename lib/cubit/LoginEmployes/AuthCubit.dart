import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:uis_app/cubit/LoginEmployes/AuthState.dart';

class AuthCubit extends Cubit<AuthState> {
  final baseUrl = "http://18.224.175.116/UISAttendanceMobile/api";
  late Dio dio;

  AuthCubit(this.dio) : super(AuthInitial());

  Future login(String id, String pin) async {
    emit(AuthLoading());

    try {
      final response =
          await dio.get("$baseUrl/Employee/LoginEmployee?nationalId=$id&Pin=$pin");
          // ignore: use_build_context_synchronously
      
         print(response.data);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure('An error occurred: $e'));
    }
  }
}
