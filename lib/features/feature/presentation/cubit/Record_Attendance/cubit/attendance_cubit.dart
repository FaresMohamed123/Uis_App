import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'attendance_state.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  late Dio dio;
  AttendanceCubit(this.dio) : super(AttendanceInitial());
  Future attendance( {required String time}) async {
    emit(AttendanceLoading());
    try {
      Response response =
          await dio.post("http://18.224.175.116/UISAttendanceMobile/api/Attendance/SaveAttendanceLog?time=$time");
      print(response.data);
      emit(AttendanceSuccess());
    } on Exception catch (e) {
      emit(AttendanceFailure(message: e.toString()));
    }
  }
}
