// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:uis_app/app_link.dart';

part 'resetpin_state.dart';

class ResetPinCubit extends Cubit<ResetPinState> {
  late Dio dio;
  ResetPinCubit(this.dio) : super(ResetPinInitial());

  Future resetpin(String id, String pin) async {
    emit(ResetPinLoading());
    try {
      Response response =
          await dio.post("$baseUrl/Employee/ChangePin?nationalId=$id&Pin=$pin");
      print(response.data);
      emit(ResetPinSuccess());
    } on Exception catch (e) {
      emit(ResetPinFailure(message: e.toString()));
    }
  }
}
