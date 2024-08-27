
// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'resetpin_state.dart';

class ResetPinCubit extends Cubit<ResetPinState> {
  final baseUrl = "http://18.224.175.116/UISAttendanceMobile/api";
  late Dio dio;
  ResetPinCubit(this.dio) : super(ResetPinInitial());

  Future resetpin(String id, String pin) async {
    // ignore: avoid_print
    print(pin)  ;
    emit(ResetPinLoading());
    try {
      Response response = await dio.post(
          "$baseUrl/Employee/ChangePin?nationalId=$id&Pin=$pin");
          print(response.data);
      emit(ResetPinSuccess());
    } on Exception catch (e) {
      emit(ResetPinFailure(message: e.toString()));
    }
  }
}
