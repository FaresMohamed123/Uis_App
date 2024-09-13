import '../../../data/model/login_employes_model.dart';

abstract class LoginEmployesState {}

class LoginEmployesInitial extends LoginEmployesState {}

class LoginEmployesLoading extends LoginEmployesState {}

class LoginEmployesSuccess extends LoginEmployesState {
  final LoginEmployesModel loginEmployesModel;

  LoginEmployesSuccess({required this.loginEmployesModel});
}

class LoginEmployesFailure extends LoginEmployesState {
  final String errorMessage;

  LoginEmployesFailure(this.errorMessage);
}
