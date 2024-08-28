import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:uis_app/data/datasource/get_User_Detail_Services.dart';
import 'package:uis_app/data/model/get_user_details_model.dart';

part 'GetUserDetails_state.dart';

class GetUserDetailsCubit extends Cubit<GetUserDetailsState> {
  GetUserDetailsCubit() : super(CubitInitial());
  GetUserDetailsModel? getUserDetailsModel;
  getUserDetails(String id) async {
    emit(GetUserDetailsLoading());

    try {
      GetUserDetailsModel getUserDetailsModel =
          await GetUserDetailServices(Dio()).getUserDetails(id);
      emit(GetUserDetailsSuccess(getUserDetailsModel));
    } catch (e) {
      emit(GetuserdetailsError("الرقم غير صحيح"));
    }
  }
}
