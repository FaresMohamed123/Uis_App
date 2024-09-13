import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:uis_app/features/feature/data/model/get_user_details_model.dart';
import 'package:uis_app/features/feature/data/services/getUserInfo_services.dart';
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