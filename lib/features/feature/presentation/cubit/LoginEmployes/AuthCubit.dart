import 'package:bloc/bloc.dart';
import 'package:uis_app/features/feature/data/repositories/loginEmployes_repositories.dart';
import 'package:uis_app/features/feature/presentation/cubit/LoginEmployes/AuthState.dart';
import 'package:uis_app/features/feature/data/model/login_employes_model.dart';

class LoginEmployesCubit extends Cubit<LoginEmployesState> {
  LoginEmployesRepositories loginEmployesRepositories;
  LoginEmployesModel? loginEmployesModel;

  LoginEmployesCubit(this.loginEmployesRepositories)
      : super(LoginEmployesInitial());

  Future login(String id, String pin) async {
    emit(LoginEmployesLoading());
    try {
      await loginEmployesRepositories.getUserInfo(id, pin).then(
        (value) {
          loginEmployesModel = value;
          emit(LoginEmployesSuccess(loginEmployesModel: loginEmployesModel!));
        },
      );
    } catch (e) {
      emit(LoginEmployesFailure('An error occurred: $e'));
    }
  }
}
