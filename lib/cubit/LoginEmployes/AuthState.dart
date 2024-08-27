import '../../data/model/login_employes_model.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final LoginEmployesModel loginEmployesModel;

  AuthSuccess({required this.loginEmployesModel});
}

class AuthFailure extends AuthState {
  final String errorMessage;

  AuthFailure(this.errorMessage);
}
